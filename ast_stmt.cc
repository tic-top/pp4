/* File: ast_stmt.cc
 * -----------------
 * Implementation of statement node classes.
 */
#include "ast_stmt.h"
#include "ast_type.h"
#include "ast_decl.h"
#include "ast_expr.h"
#include "codegen.h"
#include "errors.h"
#include <string.h>

static bool IsTypeName(Type *type, const char *target) {
    if (!type || !target) return false;
    const char *name = NULL;
    NamedType *named = dynamic_cast<NamedType*>(type);
    if (named) name = named->GetId()->GetName();
    else name = type->GetTypeName();
    if (!name) return false;
    return strcmp(name, target) == 0;
}


Program::Program(List<Decl*> *d) {
    Assert(d != NULL);
    (decls=d)->SetParentAll(this);
}

void Program::Check() {
    /* You can use your pp3 semantic analysis or leave it out if
     * you want to avoid the clutter.  We won't test pp4 against 
     * semantically-invalid programs.
     */
}
void Program::Emit() {
    /* pp4: here is where the code generation is kicked off.
     *      The general idea is perform a tree traversal of the
     *      entire program, generating instructions as you go.
     *      Each node can have its own way of translating itself,
     *      which makes for a great use of inheritance and
     *      polymorphism in the node classes.
     */

    // Create global code generator
    CodeGenerator *cg = new CodeGenerator();

    bool foundMain = false;

    // Register classes and global functions
    for (int i = 0; i < decls->NumElements(); i++) {
        ClassDecl *classDecl = dynamic_cast<ClassDecl*>(decls->Nth(i));
        if (classDecl) {
            ClassDecl::RegisterClass(classDecl);
        }
    }
    for (int i = 0; i < decls->NumElements(); i++) {
        FnDecl *fnDecl = dynamic_cast<FnDecl*>(decls->Nth(i));
        if (fnDecl && dynamic_cast<ClassDecl*>(fnDecl->GetParent()) == NULL) {
            FnDecl::RegisterFunction(fnDecl);
        }
    }

    // First pass: assign locations to global variables and emit vtables
    for (int i = 0; i < decls->NumElements(); i++) {
        Decl *decl = decls->Nth(i);

        // Global variable
        VarDecl *varDecl = dynamic_cast<VarDecl*>(decl);
        if (varDecl) {
            Location *loc = cg->GenGlobalVar(varDecl->GetId()->GetName());
            varDecl->SetLocation(loc);
            cg->AddGlobalVariable(varDecl->GetId()->GetName(), loc);
            cg->AddGlobalVarDecl(varDecl->GetId()->GetName(), varDecl);
            continue;
        }

        // Class declaration - emit vtable
        ClassDecl *classDecl = dynamic_cast<ClassDecl*>(decl);
        if (classDecl) {
            classDecl->Emit(cg);
            continue;
        }
    }

    // Second pass: emit function code
    for (int i = 0; i < decls->NumElements(); i++) {
        Decl *decl = decls->Nth(i);

        // Function declaration
        FnDecl *fnDecl = dynamic_cast<FnDecl*>(decl);
        if (fnDecl) {
            const char *fname = fnDecl->GetId()->GetName();
            if (strcmp(fname, "main") == 0) {
                foundMain = true;
            }
            fnDecl->Emit(cg);
            continue;
        }
    }

    // Check if main exists
    if (!foundMain) {
        ReportError::NoMainFound();
    }

    // If any errors reported, abort code generation so linker errors aren't produced
    if (ReportError::NumErrors() > 0) {
        return;
    }

    // Generate final MIPS code
    cg->DoFinalCodeGen();
}

StmtBlock::StmtBlock(List<VarDecl*> *d, List<Stmt*> *s) {
    Assert(d != NULL && s != NULL);
    (decls=d)->SetParentAll(this);
    (stmts=s)->SetParentAll(this);
}

ConditionalStmt::ConditionalStmt(Expr *t, Stmt *b) { 
    Assert(t != NULL && b != NULL);
    (test=t)->SetParent(this); 
    (body=b)->SetParent(this);
}

ForStmt::ForStmt(Expr *i, Expr *t, Expr *s, Stmt *b): LoopStmt(t, b) { 
    Assert(i != NULL && t != NULL && s != NULL && b != NULL);
    (init=i)->SetParent(this);
    (step=s)->SetParent(this);
}

IfStmt::IfStmt(Expr *t, Stmt *tb, Stmt *eb): ConditionalStmt(t, tb) { 
    Assert(t != NULL && tb != NULL); // else can be NULL
    elseBody = eb;
    if (elseBody) elseBody->SetParent(this);
}


ReturnStmt::ReturnStmt(yyltype loc, Expr *e) : Stmt(loc) { 
    Assert(e != NULL);
    (expr=e)->SetParent(this);
}
  
PrintStmt::PrintStmt(List<Expr*> *a) {
    Assert(a != NULL);
    (args=a)->SetParentAll(this);
}

// StmtBlock Emit
Location* StmtBlock::Emit(CodeGenerator *cg) {
    cg->PushScope();
    // Assign locations to local variables and add to symbol table
    for (int i = 0; i < decls->NumElements(); i++) {
        VarDecl *var = decls->Nth(i);
        Location *loc = cg->GenLocalVar(var->GetId()->GetName());
        var->SetLocation(loc);
        cg->AddVariable(var->GetId()->GetName(), loc);
        cg->AddVarDecl(var->GetId()->GetName(), var);
    }

    // Emit all statements
    for (int i = 0; i < stmts->NumElements(); i++) {
        stmts->Nth(i)->Emit(cg);
    }
    cg->PopScope();
    return NULL;
}

// IfStmt Emit
Location* IfStmt::Emit(CodeGenerator *cg) {
    // Emit test expression
    Location *testLoc = test->Emit(cg);

    char *elseLabel = cg->NewLabel();
    char *endLabel = cg->NewLabel();

    // If test is zero, jump to else
    cg->GenIfZ(testLoc, elseLabel);

    // Emit then body
    body->Emit(cg);
    cg->GenGoto(endLabel);

    // Emit else body
    cg->GenLabel(elseLabel);
    if (elseBody) {
        elseBody->Emit(cg);
    }

    cg->GenLabel(endLabel);
    return NULL;
}

// WhileStmt Emit
Location* WhileStmt::Emit(CodeGenerator *cg) {
    char *startLabel = cg->NewLabel();
    char *endLabel = cg->NewLabel();

    // Push end label for break statements
    cg->PushLoopEndLabel(endLabel);

    // Loop start
    cg->GenLabel(startLabel);

    // Emit test
    Location *testLoc = test->Emit(cg);
    cg->GenIfZ(testLoc, endLabel);

    // Emit body
    body->Emit(cg);

    // Jump back to start
    cg->GenGoto(startLabel);

    // Loop end
    cg->GenLabel(endLabel);

    // Pop end label
    cg->PopLoopEndLabel();
    return NULL;
}

// ForStmt Emit
Location* ForStmt::Emit(CodeGenerator *cg) {
    // Emit init
    init->Emit(cg);

    char *startLabel = cg->NewLabel();
    char *endLabel = cg->NewLabel();

    // Push end label for break statements
    cg->PushLoopEndLabel(endLabel);

    // Loop start
    cg->GenLabel(startLabel);

    // Emit test
    Location *testLoc = test->Emit(cg);
    cg->GenIfZ(testLoc, endLabel);

    // Emit body
    body->Emit(cg);

    // Emit step
    step->Emit(cg);

    // Jump back to start
    cg->GenGoto(startLabel);

    // Loop end
    cg->GenLabel(endLabel);

    // Pop end label
    cg->PopLoopEndLabel();
    return NULL;
}

// BreakStmt Emit
Location* BreakStmt::Emit(CodeGenerator *cg) {
    const char *endLabel = cg->GetCurrentLoopEndLabel();
    if (endLabel) {
        cg->GenGoto(endLabel);
    }
    // If no loop, this is a semantic error, but we don't handle it in code generation
    return NULL;
}

// ReturnStmt Emit
Location* ReturnStmt::Emit(CodeGenerator *cg) {
    if (expr) {
        Location *retVal = expr->Emit(cg);
        cg->GenReturn(retVal);
    } else {
        cg->GenReturn();
    }
    return NULL;
}

// PrintStmt Emit
Location* PrintStmt::Emit(CodeGenerator *cg) {
    for (int i = 0; i < args->NumElements(); i++) {
        Expr *arg = args->Nth(i);
        Location *argLoc = arg->Emit(cg);

        Type *argType = arg->GetResultType();
        bool isString = IsTypeName(argType, "string");
        bool isBool = IsTypeName(argType, "bool");
        if (!argType) {
            if (dynamic_cast<StringConstant*>(arg)) isString = true;
            else if (dynamic_cast<BoolConstant*>(arg)) isBool = true;
        }

        // Call the appropriate print function
        if (isString) {
            cg->GenBuiltInCall(PrintString, argLoc);
        } else if (isBool) {
            cg->GenBuiltInCall(PrintBool, argLoc);
        } else {
            cg->GenBuiltInCall(PrintInt, argLoc);
        }
    }
    return NULL;
}
