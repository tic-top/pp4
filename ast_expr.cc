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

static FnDecl *FindEnclosingFunction(Node *node) {
    while (node && !dynamic_cast<FnDecl*>(node))
        node = node->GetParent();
    return dynamic_cast<FnDecl*>(node);
}

static ClassDecl *FindEnclosingClass(Node *node) {
    while (node && !dynamic_cast<ClassDecl*>(node))
        node = node->GetParent();
    return dynamic_cast<ClassDecl*>(node);
}

static const char *GetClassName(Type *type) {
    if (!type) return NULL;
    NamedType *nt = dynamic_cast<NamedType*>(type);
    if (!nt) return NULL;
    return nt->GetId()->GetName();
}

static bool IsStringType(Type *type) {
    if (!type) return false;
    if (type == Type::stringType) return true;
    NamedType *nt = dynamic_cast<NamedType*>(type);
    return nt && strcmp(nt->GetId()->GetName(), "string") == 0;
}


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
    arrayType = NULL;
}

// Constant expressions
Location *IntConstant::Emit(CodeGenerator *cg) {
    SetResultType(Type::intType);
    return cg->GenLoadConstant(value);
}

Location *BoolConstant::Emit(CodeGenerator *cg) {
    SetResultType(Type::boolType);
    return cg->GenLoadConstant(value ? 1 : 0);
}

Location *StringConstant::Emit(CodeGenerator *cg) {
    SetResultType(Type::stringType);
    return cg->GenLoadConstant(value);
}

Location *NullConstant::Emit(CodeGenerator *cg) {
    SetResultType(Type::nullType);
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
    SetResultType(Type::intType);
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
        SetResultType(Type::boolType);
        return cg->GenBinaryOp("<", leftLoc, rightLoc);
    } else if (strcmp(opStr, ">") == 0) {
        // a > b : swap to b < a
        SetResultType(Type::boolType);
        return cg->GenBinaryOp("<", rightLoc, leftLoc);
    } else if (strcmp(opStr, "<=") == 0) {
        // a <= b : !(b < a)
        Location *temp = cg->GenBinaryOp("<", rightLoc, leftLoc);
        Location *result = cg->GenLoadConstant(1);
        SetResultType(Type::boolType);
        return cg->GenBinaryOp("-", result, temp);
    } else if (strcmp(opStr, ">=") == 0) {
        // a >= b : !(a < b)
        Location *temp = cg->GenBinaryOp("<", leftLoc, rightLoc);
        Location *result = cg->GenLoadConstant(1);
        SetResultType(Type::boolType);
        return cg->GenBinaryOp("-", result, temp);
    }
    SetResultType(Type::boolType);
    return NULL;
}

// Equality expressions
Location *EqualityExpr::Emit(CodeGenerator *cg) {
    Location *leftLoc = left->Emit(cg);
    Location *rightLoc = right->Emit(cg);
    const char *opStr = op->GetTokenString();
    Type *leftType = left->GetResultType();
    Type *rightType = right->GetResultType();
    bool isString = IsStringType(leftType) && IsStringType(rightType);

    SetResultType(Type::boolType);

    if (isString) {
        Location *cmp = cg->GenBuiltInCall(StringEqual, leftLoc, rightLoc);
        if (strcmp(opStr, "==") == 0) {
            return cmp;
        } else if (strcmp(opStr, "!=") == 0) {
            Location *one = cg->GenLoadConstant(1);
            return cg->GenBinaryOp("-", one, cmp);
        }
    } else {
        if (strcmp(opStr, "==") == 0) {
            return cg->GenBinaryOp("==", leftLoc, rightLoc);
        } else if (strcmp(opStr, "!=") == 0) {
            Location *temp = cg->GenBinaryOp("==", leftLoc, rightLoc);
            Location *one = cg->GenLoadConstant(1);
            return cg->GenBinaryOp("-", one, temp);
        }
    }
    return NULL;
}

// Logical expressions with short-circuit evaluation
Location *LogicalExpr::Emit(CodeGenerator *cg) {
    // Handle unary NOT
    if (left == NULL && strcmp(op->GetTokenString(), "!") == 0) {
        Location *rightLoc = right->Emit(cg);
        Location *zero = cg->GenLoadConstant(0);
        SetResultType(Type::boolType);
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
        SetResultType(Type::boolType);
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
        SetResultType(Type::boolType);
        return result;
    }

    // Fallback: regular binary operation
    Location *leftLoc = left->Emit(cg);
    Location *rightLoc = right->Emit(cg);
    SetResultType(Type::boolType);
    return cg->GenBinaryOp(op->GetTokenString(), leftLoc, rightLoc);
}

// This expression
Location *This::Emit(CodeGenerator *cg) {
    // "this" is always at fp+4 for methods
    Location *loc = new Location(fpRelative, CodeGenerator::OffsetToFirstParam, "this");
    ClassDecl *cls = FindEnclosingClass(this);
    if (cls) SetResultType(cls->GetClassType());
    return loc;
}

// ReadInteger and ReadLine
Location *ReadIntegerExpr::Emit(CodeGenerator *cg) {
    SetResultType(Type::intType);
    return cg->GenBuiltInCall(ReadInteger);
}

Location *ReadLineExpr::Emit(CodeGenerator *cg) {
    SetResultType(Type::stringType);
    return cg->GenBuiltInCall(ReadLine);
}

// Assignment expression
Location *AssignExpr::Emit(CodeGenerator *cg) {
    // Emit the right-hand side first
    Location *rhsLoc = right->Emit(cg);
    Type *rhsType = right->GetResultType();

    // Handle different types of lvalues
    FieldAccess *fa = dynamic_cast<FieldAccess*>(left);
    ArrayAccess *aa = dynamic_cast<ArrayAccess*>(left);

    if (fa && fa->base == NULL) {
        // Simple variable assignment
        Location *varLoc = cg->GetVariable(fa->field->GetName());
        if (varLoc) {
            cg->GenAssign(varLoc, rhsLoc);
            SetResultType(rhsType);
            return rhsLoc;
        }
        ClassDecl *cls = FindEnclosingClass(this);
        if (cls) {
            int offset = cls->GetFieldOffset(fa->field->GetName());
            if (offset >= 0) {
                Location *thisLoc = new Location(fpRelative, CodeGenerator::OffsetToFirstParam, "this");
                cg->GenStore(thisLoc, rhsLoc, offset);
                SetResultType(rhsType);
                return rhsLoc;
            }
        }
    } else if (aa) {
        // Array element assignment - need bounds checking
        Location *baseLoc = aa->base->Emit(cg);
        Location *indexLoc = aa->subscript->Emit(cg);

        // Add bounds checking
        Location *errMsg = cg->GenLoadConstant(err_arr_out_of_bounds);
        Location *zero = cg->GenLoadConstant(0);
        Location *isNeg = cg->GenBinaryOp("<", indexLoc, zero);
        char *nonNegLabel = cg->NewLabel();
        cg->GenIfZ(isNeg, nonNegLabel);
        cg->GenBuiltInCall(PrintString, errMsg);
        cg->GenBuiltInCall(Halt);
        cg->GenLabel(nonNegLabel);

        Location *length = cg->GenLoad(baseLoc, 0);
        Location *inRange = cg->GenBinaryOp("<", indexLoc, length);
        char *rangeOkLabel = cg->NewLabel();
        char *rangeErrorLabel = cg->NewLabel();
        cg->GenIfZ(inRange, rangeErrorLabel);
        cg->GenGoto(rangeOkLabel);
        cg->GenLabel(rangeErrorLabel);
        cg->GenBuiltInCall(PrintString, errMsg);
        cg->GenBuiltInCall(Halt);
        cg->GenLabel(rangeOkLabel);

        // Compute address: base + (index + 1) * 4
        Location *one = cg->GenLoadConstant(1);
        Location *indexPlusOne = cg->GenBinaryOp("+", indexLoc, one);
        Location *four = cg->GenLoadConstant(4);
        Location *offset = cg->GenBinaryOp("*", indexPlusOne, four);
        Location *addr = cg->GenBinaryOp("+", baseLoc, offset);

        // Store value at computed address
        cg->GenStore(addr, rhsLoc, 0);
        SetResultType(rhsType);
        return rhsLoc;
    } else if (fa) {
        // Object field assignment
        Location *baseLoc = fa->base->Emit(cg);
        Type *baseType = fa->base->GetResultType();
        const char *className = GetClassName(baseType);
        ClassDecl *cls = className ? ClassDecl::LookupClass(className) : NULL;
        int offset = cls ? cls->GetFieldOffset(fa->field->GetName()) : -1;
        if (offset >= 0) {
            cg->GenStore(baseLoc, rhsLoc, offset);
            SetResultType(rhsType);
            return rhsLoc;
        }
    }

    // Fallback
    SetResultType(rhsType);
    return rhsLoc;
}

// Array access
Location *ArrayAccess::Emit(CodeGenerator *cg) {
    Location *baseLoc = base->Emit(cg);
    Location *indexLoc = subscript->Emit(cg);

    Location *errMsg = cg->GenLoadConstant(err_arr_out_of_bounds);
    Location *zero = cg->GenLoadConstant(0);

    // Null base check
    Location *isNull = cg->GenBinaryOp("==", baseLoc, zero);
    char *nonNullLabel = cg->NewLabel();
    cg->GenIfZ(isNull, nonNullLabel);
    cg->GenBuiltInCall(PrintString, errMsg);
    cg->GenBuiltInCall(Halt);
    cg->GenLabel(nonNullLabel);

    Location *isNeg = cg->GenBinaryOp("<", indexLoc, zero);
    char *nonNegLabel = cg->NewLabel();
    cg->GenIfZ(isNeg, nonNegLabel);
    cg->GenBuiltInCall(PrintString, errMsg);
    cg->GenBuiltInCall(Halt);
    cg->GenLabel(nonNegLabel);

    Location *length = cg->GenLoad(baseLoc, 0);
    Location *inRange = cg->GenBinaryOp("<", indexLoc, length);
    char *rangeOkLabel = cg->NewLabel();
    char *rangeErrorLabel = cg->NewLabel();
    cg->GenIfZ(inRange, rangeErrorLabel);
    cg->GenGoto(rangeOkLabel);
    cg->GenLabel(rangeErrorLabel);
    cg->GenBuiltInCall(PrintString, errMsg);
    cg->GenBuiltInCall(Halt);
    cg->GenLabel(rangeOkLabel);

    Location *one = cg->GenLoadConstant(1);
    Location *adjustedIndex = cg->GenBinaryOp("+", indexLoc, one);
    Location *four = cg->GenLoadConstant(4);
    Location *offset = cg->GenBinaryOp("*", adjustedIndex, four);
    Location *addr = cg->GenBinaryOp("+", baseLoc, offset);
    Type *baseType = base->GetResultType();
    ArrayType *arrayType = baseType ? dynamic_cast<ArrayType*>(baseType) : NULL;
    if (arrayType) SetResultType(arrayType->GetElemType());
    return cg->GenLoad(addr, 0);
}

// Field access
Location *FieldAccess::Emit(CodeGenerator *cg) {
    if (base == NULL) {
        Location *loc = cg->GetVariable(field->GetName());
        if (loc) {
            VarDecl *decl = cg->GetVarDecl(field->GetName());
            if (decl) SetResultType(decl->GetType());
            return loc;
        }
        ClassDecl *cls = FindEnclosingClass(this);
        if (cls) {
            VarDecl *fieldDecl = cls->GetFieldDecl(field->GetName());
            if (fieldDecl) {
                int offset = cls->GetFieldOffset(field->GetName());
                Location *thisLoc = new Location(fpRelative, CodeGenerator::OffsetToFirstParam, "this");
                SetResultType(fieldDecl->GetType());
                return cg->GenLoad(thisLoc, offset);
            }
        }
        return cg->GenTempVar();
    }

    Location *baseLoc = base->Emit(cg);
    Type *baseType = base->GetResultType();
    const char *className = GetClassName(baseType);
    ClassDecl *cls = className ? ClassDecl::LookupClass(className) : NULL;
    if (cls) {
        VarDecl *fieldDecl = cls->GetFieldDecl(field->GetName());
        if (fieldDecl) {
            int offset = cls->GetFieldOffset(field->GetName());
            SetResultType(fieldDecl->GetType());
            return cg->GenLoad(baseLoc, offset);
        }
    }
    return cg->GenTempVar();
}

// Function/method call
Location *Call::Emit(CodeGenerator *cg) {
    // Handle arr.length() specially
    if (base && strcmp(field->GetName(), "length") == 0 &&
        actuals->NumElements() == 0) {
        Location *arrLoc = base->Emit(cg);
        SetResultType(Type::intType);
        return cg->GenLoad(arrLoc, 0);
    }

    // Push parameters right-to-left
    for (int i = actuals->NumElements() - 1; i >= 0; i--) {
        Location *argLoc = actuals->Nth(i)->Emit(cg);
        cg->GenPushParam(argLoc);
    }

    Location *result = NULL;

    int totalParams = actuals->NumElements();
    const char *fname = field->GetName();

    if (base == NULL) {
        FnDecl *fnDecl = FnDecl::LookupFunction(fname);
        if (fnDecl) {
            char label[256];
            if (strcmp(fname, "main") == 0) {
                strcpy(label, "main");
            } else {
                sprintf(label, "_%s", fname);
            }
            bool hasReturn = fnDecl->GetReturnType() != Type::voidType;
            result = cg->GenLCall(label, hasReturn);
            if (hasReturn) SetResultType(fnDecl->GetReturnType());
            else SetResultType(Type::voidType);
            cg->GenPopParams(totalParams * CodeGenerator::VarSize);
            return result;
        }
    }

    // Method call (explicit base or implicit this)
    bool implicitThis = (base == NULL);
    Location *objLoc = NULL;
    Type *receiverType = NULL;

    if (base) {
        objLoc = base->Emit(cg);
        receiverType = base->GetResultType();
    } else {
        objLoc = new Location(fpRelative, CodeGenerator::OffsetToFirstParam, "this");
        ClassDecl *cls = FindEnclosingClass(this);
        receiverType = cls ? cls->GetClassType() : NULL;
    }

    const char *className = GetClassName(receiverType);
    ClassDecl *cls = className ? ClassDecl::LookupClass(className) : NULL;
    FnDecl *methodDecl = cls ? cls->GetMethodDecl(fname) : NULL;
    int methodIndex = cls ? cls->GetMethodIndex(fname) : -1;
    if (!cls || !methodDecl || methodIndex < 0) {
        char label[256];
        if (strcmp(fname, "main") == 0) strcpy(label, "main");
        else sprintf(label, "_%s", fname);
        bool fnReturn = true;
        result = cg->GenLCall(label, fnReturn);
        SetResultType(Type::voidType);
        cg->GenPopParams(totalParams * CodeGenerator::VarSize);
        return result;
    }
    bool hasReturn = methodDecl && methodDecl->GetReturnType() != Type::voidType;

    cg->GenPushParam(objLoc);
    totalParams++;

    Location *vtablePtr = cg->GenLoad(objLoc, 0);
    Location *methodAddr = cg->GenLoad(vtablePtr, methodIndex * CodeGenerator::VarSize);
    result = cg->GenACall(methodAddr, hasReturn);
    if (hasReturn) SetResultType(methodDecl->GetReturnType());
    else SetResultType(Type::voidType);

    cg->GenPopParams(totalParams * CodeGenerator::VarSize);

    return result;
}

// New expression (object allocation)
Location *NewExpr::Emit(CodeGenerator *cg) {
    ClassDecl *cls = ClassDecl::LookupClass(cType->GetId()->GetName());
    int fieldCount = cls ? cls->GetFieldCount() : 0;
    int objectBytes = CodeGenerator::VarSize * (fieldCount + 1); // vtable ptr + fields
    Location *size = cg->GenLoadConstant(objectBytes);
    Location *obj = cg->GenBuiltInCall(Alloc, size);

    // Set vtable pointer
    // Load vtable address
    char vtableLabel[256];
    sprintf(vtableLabel, "%s", cType->GetId()->GetName());
    Location *vtable = cg->GenLoadLabel(vtableLabel);
    cg->GenStore(obj, vtable, 0);
    SetResultType(cType);

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
    if (!arrayType) {
        yyltype loc;
        if (this->GetLocation()) loc = *this->GetLocation();
        else if (size->GetLocation()) loc = *size->GetLocation();
        else memset(&loc, 0, sizeof(loc));
        arrayType = new ArrayType(loc, Type::CopyType(elemType));
    }
    SetResultType(arrayType);

    return arr;
}
