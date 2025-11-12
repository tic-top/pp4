/* File: ast_expr.cc
 * -----------------
 * Implementation of expression node classes.
 */
#include "ast_expr.h"
#include "ast_type.h"
#include "ast_decl.h"
#include "codegen.h"
#include "errors.h"
#include <string.h>


IntConstant::IntConstant(yyltype loc, int val) : Expr(loc) {
    value = val;
}

DoubleConstant::DoubleConstant(yyltype loc, double val) : Expr(loc) {
    value = val;
}

BoolConstant::BoolConstant(yyltype loc, bool val) : Expr(loc) {
    value = val;
}

StringConstant::StringConstant(yyltype loc, const char *val) : Expr(loc) {
    Assert(val != NULL);
    value = strdup(val);
}

Operator::Operator(yyltype loc, const char *tok) : Node(loc) {
    Assert(tok != NULL);
    strncpy(tokenString, tok, sizeof(tokenString));
}
CompoundExpr::CompoundExpr(Expr *l, Operator *o, Expr *r) 
  : Expr(Join(l->GetLocation(), r->GetLocation())) {
    Assert(l != NULL && o != NULL && r != NULL);
    (op=o)->SetParent(this);
    (left=l)->SetParent(this); 
    (right=r)->SetParent(this);
}

CompoundExpr::CompoundExpr(Operator *o, Expr *r) 
  : Expr(Join(o->GetLocation(), r->GetLocation())) {
    Assert(o != NULL && r != NULL);
    left = NULL; 
    (op=o)->SetParent(this);
    (right=r)->SetParent(this);
}
   
  
ArrayAccess::ArrayAccess(yyltype loc, Expr *b, Expr *s) : LValue(loc) {
    (base=b)->SetParent(this); 
    (subscript=s)->SetParent(this);
}
     
FieldAccess::FieldAccess(Expr *b, Identifier *f) 
  : LValue(b? Join(b->GetLocation(), f->GetLocation()) : *f->GetLocation()) {
    Assert(f != NULL); // b can be be NULL (just means no explicit base)
    base = b; 
    if (base) base->SetParent(this); 
    (field=f)->SetParent(this);
}


Call::Call(yyltype loc, Expr *b, Identifier *f, List<Expr*> *a) : Expr(loc)  {
    Assert(f != NULL && a != NULL); // b can be be NULL (just means no explicit base)
    base = b;
    if (base) base->SetParent(this);
    (field=f)->SetParent(this);
    (actuals=a)->SetParentAll(this);
}
 

NewExpr::NewExpr(yyltype loc, NamedType *c) : Expr(loc) { 
  Assert(c != NULL);
  (cType=c)->SetParent(this);
}


NewArrayExpr::NewArrayExpr(yyltype loc, Expr *sz, Type *et) : Expr(loc) {
    Assert(sz != NULL && et != NULL);
    (size=sz)->SetParent(this);
    (elemType=et)->SetParent(this);
}

// Constant expressions
Location *IntConstant::Emit(CodeGenerator *cg) {
    return cg->GenLoadConstant(value);
}

Location *BoolConstant::Emit(CodeGenerator *cg) {
    return cg->GenLoadConstant(value ? 1 : 0);
}

Location *StringConstant::Emit(CodeGenerator *cg) {
    return cg->GenLoadConstant(value);
}

Location *NullConstant::Emit(CodeGenerator *cg) {
    return cg->GenLoadConstant(0);
}

// Arithmetic expressions
Location *ArithmeticExpr::Emit(CodeGenerator *cg) {
    // Handle unary minus as special case: 0 - right
    if (left == NULL) {
        Location *rightLoc = right->Emit(cg);
        Location *zero = cg->GenLoadConstant(0);
        return cg->GenBinaryOp("-", zero, rightLoc);
    }

    // Binary arithmetic operation
    Location *leftLoc = left->Emit(cg);
    Location *rightLoc = right->Emit(cg);
    return cg->GenBinaryOp(op->GetTokenString(), leftLoc, rightLoc);
}

// Relational expressions
Location *RelationalExpr::Emit(CodeGenerator *cg) {
    Location *leftLoc = left->Emit(cg);
    Location *rightLoc = right->Emit(cg);
    const char *opStr = op->GetTokenString();

    // TAC only supports '<', so we need to transform other operators
    if (strcmp(opStr, "<") == 0) {
        // a < b : direct support
        return cg->GenBinaryOp("<", leftLoc, rightLoc);
    } else if (strcmp(opStr, ">") == 0) {
        // a > b : swap to b < a
        return cg->GenBinaryOp("<", rightLoc, leftLoc);
    } else if (strcmp(opStr, "<=") == 0) {
        // a <= b : !(b < a)
        Location *temp = cg->GenBinaryOp("<", rightLoc, leftLoc);
        Location *result = cg->GenLoadConstant(1);
        return cg->GenBinaryOp("-", result, temp);
    } else if (strcmp(opStr, ">=") == 0) {
        // a >= b : !(a < b)
        Location *temp = cg->GenBinaryOp("<", leftLoc, rightLoc);
        Location *result = cg->GenLoadConstant(1);
        return cg->GenBinaryOp("-", result, temp);
    }
    return NULL;
}

// Equality expressions
Location *EqualityExpr::Emit(CodeGenerator *cg) {
    Location *leftLoc = left->Emit(cg);
    Location *rightLoc = right->Emit(cg);
    const char *opStr = op->GetTokenString();

    // TAC only supports '==', need to transform '!='
    if (strcmp(opStr, "==") == 0) {
        // a == b : direct support
        return cg->GenBinaryOp("==", leftLoc, rightLoc);
    } else if (strcmp(opStr, "!=") == 0) {
        // a != b : !(a == b) which is 1 - (a == b)
        Location *temp = cg->GenBinaryOp("==", leftLoc, rightLoc);
        Location *one = cg->GenLoadConstant(1);
        return cg->GenBinaryOp("-", one, temp);
    }
    return NULL;
}

// Logical expressions with short-circuit evaluation
Location *LogicalExpr::Emit(CodeGenerator *cg) {
    // Handle unary NOT
    if (left == NULL && strcmp(op->GetTokenString(), "!") == 0) {
        Location *rightLoc = right->Emit(cg);
        Location *zero = cg->GenLoadConstant(0);
        return cg->GenBinaryOp("==", rightLoc, zero);
    }

    // Handle && with short-circuit
    if (strcmp(op->GetTokenString(), "&&") == 0) {
        Location *result = cg->GenTempVar();
        Location *leftLoc = left->Emit(cg);

        // If left is false, result is false without evaluating right
        char *skipLabel = cg->NewLabel();
        char *endLabel = cg->NewLabel();

        cg->GenIfZ(leftLoc, skipLabel);
        // Left is true, evaluate right
        Location *rightLoc = right->Emit(cg);
        cg->GenAssign(result, rightLoc);
        cg->GenGoto(endLabel);

        // Left was false, assign false to result
        cg->GenLabel(skipLabel);
        Location *falseLoc = cg->GenLoadConstant(0);
        cg->GenAssign(result, falseLoc);

        cg->GenLabel(endLabel);
        return result;
    }

    // Handle || with short-circuit
    if (strcmp(op->GetTokenString(), "||") == 0) {
        Location *result = cg->GenTempVar();
        Location *leftLoc = left->Emit(cg);

        // If left is true, result is true without evaluating right
        char *skipLabel = cg->NewLabel();
        char *endLabel = cg->NewLabel();

        cg->GenIfZ(leftLoc, skipLabel);
        // Left is true, assign true to result
        Location *trueLoc = cg->GenLoadConstant(1);
        cg->GenAssign(result, trueLoc);
        cg->GenGoto(endLabel);

        // Left was false, evaluate right
        cg->GenLabel(skipLabel);
        Location *rightLoc = right->Emit(cg);
        cg->GenAssign(result, rightLoc);

        cg->GenLabel(endLabel);
        return result;
    }

    // Fallback: regular binary operation
    Location *leftLoc = left->Emit(cg);
    Location *rightLoc = right->Emit(cg);
    return cg->GenBinaryOp(op->GetTokenString(), leftLoc, rightLoc);
}

// This expression
Location *This::Emit(CodeGenerator *cg) {
    // "this" is always at fp+4 for methods
    return new Location(fpRelative, CodeGenerator::OffsetToFirstParam, "this");
}

// ReadInteger and ReadLine
Location *ReadIntegerExpr::Emit(CodeGenerator *cg) {
    return cg->GenBuiltInCall(ReadInteger);
}

Location *ReadLineExpr::Emit(CodeGenerator *cg) {
    return cg->GenBuiltInCall(ReadLine);
}

// Assignment expression
Location *AssignExpr::Emit(CodeGenerator *cg) {
    // Emit the right-hand side first
    Location *rhsLoc = right->Emit(cg);

    // Handle different types of lvalues
    FieldAccess *fa = dynamic_cast<FieldAccess*>(left);
    ArrayAccess *aa = dynamic_cast<ArrayAccess*>(left);

    if (fa && fa->base == NULL) {
        // Simple variable assignment
        Location *varLoc = cg->GetVariable(fa->field->GetName());
        if (varLoc) {
            cg->GenAssign(varLoc, rhsLoc);
            return varLoc;
        }
    } else if (aa) {
        // Array element assignment
        Location *baseLoc = aa->base->Emit(cg);
        Location *indexLoc = aa->subscript->Emit(cg);

        // Compute address: base + (index + 1) * 4
        Location *one = cg->GenLoadConstant(1);
        Location *indexPlusOne = cg->GenBinaryOp("+", indexLoc, one);
        Location *four = cg->GenLoadConstant(4);
        Location *offset = cg->GenBinaryOp("*", indexPlusOne, four);
        Location *addr = cg->GenBinaryOp("+", baseLoc, offset);

        // Store value at computed address
        cg->GenStore(addr, rhsLoc, 0);
        return rhsLoc;
    } else if (fa) {
        // Object field assignment
        Location *baseLoc = fa->base->Emit(cg);
        // Store to field offset (simplified)
        cg->GenStore(baseLoc, rhsLoc, 4);
        return rhsLoc;
    }

    // Fallback
    return rhsLoc;
}

// Array access
Location *ArrayAccess::Emit(CodeGenerator *cg) {
    Location *baseLoc = base->Emit(cg);
    Location *indexLoc = subscript->Emit(cg);

    // Array layout: [length at offset 0][elem0 at offset 4][elem1 at offset 8]...
    // First, load the length and check bounds
    Location *length = cg->GenLoad(baseLoc, 0);

    // Check if index < 0
    Location *zero = cg->GenLoadConstant(0);
    Location *negCheck = cg->GenBinaryOp("<", indexLoc, zero);
    char *okLabel1 = cg->NewLabel();
    cg->GenIfZ(negCheck, okLabel1);
    // Index is negative - runtime error
    Location *errMsg = cg->GenLoadConstant(err_arr_out_of_bounds);
    cg->GenBuiltInCall(PrintString, errMsg);
    cg->GenBuiltInCall(Halt);
    cg->GenLabel(okLabel1);

    // Check if index >= length
    Location *upperCheck = cg->GenBinaryOp("<", indexLoc, length);
    char *okLabel2 = cg->NewLabel();
    Location *one = cg->GenLoadConstant(1);
    Location *upperCheckInv = cg->GenBinaryOp("==", upperCheck, zero);
    cg->GenIfZ(upperCheckInv, okLabel2);
    // Index out of bounds - runtime error
    cg->GenBuiltInCall(PrintString, errMsg);
    cg->GenBuiltInCall(Halt);
    cg->GenLabel(okLabel2);

    // Compute address: base + (index + 1) * 4
    Location *adjustedIndex = cg->GenBinaryOp("+", indexLoc, one);
    Location *four = cg->GenLoadConstant(4);
    Location *offset = cg->GenBinaryOp("*", adjustedIndex, four);
    Location *addr = cg->GenBinaryOp("+", baseLoc, offset);

    // Load the element value
    return cg->GenLoad(addr, 0);
}

// Field access
Location *FieldAccess::Emit(CodeGenerator *cg) {
    if (base == NULL) {
        // Simple variable reference - lookup in symbol table
        Location *loc = cg->GetVariable(field->GetName());
        if (loc) {
            return loc;
        }
        // Variable not found - this shouldn't happen if semantic analysis passed
        // Return a temp as fallback
        return cg->GenTempVar();
    }

    // obj.field
    Location *baseLoc = base->Emit(cg);
    // Load from field offset (simplified - would need class layout info)
    return cg->GenLoad(baseLoc, 4);
}

// Function/method call
Location *Call::Emit(CodeGenerator *cg) {
    // Push parameters right-to-left
    for (int i = actuals->NumElements() - 1; i >= 0; i--) {
        Location *argLoc = actuals->Nth(i)->Emit(cg);
        cg->GenPushParam(argLoc);
    }

    Location *result = NULL;

    if (base == NULL) {
        // Simple function call
        // Build label: for "test" -> "_test", for "main" -> "main"
        char label[256];
        const char *fname = field->GetName();
        if (strcmp(fname, "main") == 0) {
            strcpy(label, "main");
        } else {
            sprintf(label, "_%s", fname);
        }
        result = cg->GenLCall(label, true);
    } else {
        // Method call through object
        // Need to push "this" pointer first
        Location *objLoc = base->Emit(cg);
        cg->GenPushParam(objLoc);

        // Load vtable pointer from object
        Location *vtablePtr = cg->GenLoad(objLoc, 0);

        // Load method address from vtable (simplified - would need method index)
        Location *methodAddr = cg->GenLoad(vtablePtr, 0);

        result = cg->GenACall(methodAddr, true);
    }

    // Pop parameters
    int numParams = actuals->NumElements();
    if (base != NULL) numParams++;  // for "this"
    cg->GenPopParams(numParams * CodeGenerator::VarSize);

    return result;
}

// New expression (object allocation)
Location *NewExpr::Emit(CodeGenerator *cg) {
    // Simplified: allocate fixed size object (vtable + fields)
    // Real implementation would need class size information
    Location *size = cg->GenLoadConstant(8);  // vtable + one field
    Location *obj = cg->GenBuiltInCall(Alloc, size);

    // Set vtable pointer
    // Load vtable address
    char vtableLabel[256];
    sprintf(vtableLabel, "%s", cType->GetId()->GetName());
    Location *vtable = cg->GenLoadLabel(vtableLabel);
    cg->GenStore(obj, vtable, 0);

    return obj;
}

// New array expression
Location *NewArrayExpr::Emit(CodeGenerator *cg) {
    Location *sizeLoc = size->Emit(cg);

    // Check size > 0 (if size <= 0, report error)
    Location *zero = cg->GenLoadConstant(0);
    Location *sizeCheck = cg->GenBinaryOp("<", sizeLoc, zero);  // size < 0?
    char *checkZeroLabel = cg->NewLabel();
    char *okLabel = cg->NewLabel();
    cg->GenIfZ(sizeCheck, checkZeroLabel);  // if size >= 0, check if == 0
    // Size < 0 - runtime error
    Location *errMsg = cg->GenLoadConstant(err_arr_bad_size);
    cg->GenBuiltInCall(PrintString, errMsg);
    cg->GenBuiltInCall(Halt);
    cg->GenLabel(checkZeroLabel);
    // Check if size == 0
    Location *zeroCheck = cg->GenBinaryOp("==", sizeLoc, zero);
    cg->GenIfZ(zeroCheck, okLabel);  // if size != 0, continue
    // Size == 0 - runtime error
    cg->GenBuiltInCall(PrintString, errMsg);
    cg->GenBuiltInCall(Halt);
    cg->GenLabel(okLabel);

    // Allocate (size + 1) * 4 bytes
    Location *one = cg->GenLoadConstant(1);
    Location *totalSize = cg->GenBinaryOp("+", sizeLoc, one);
    Location *four = cg->GenLoadConstant(4);
    Location *bytes = cg->GenBinaryOp("*", totalSize, four);

    Location *arr = cg->GenBuiltInCall(Alloc, bytes);

    // Store length at offset 0
    cg->GenStore(arr, sizeLoc, 0);

    return arr;
}

