/* File: ast_decl.cc
 * -----------------
 * Implementation of Decl node classes.
 */
#include "ast_decl.h"
#include "ast_type.h"
#include "ast_stmt.h"
#include "codegen.h"
#include <string.h>
        
         
Decl::Decl(Identifier *n) : Node(*n->GetLocation()) {
    Assert(n != NULL);
    (id=n)->SetParent(this); 
}


VarDecl::VarDecl(Identifier *n, Type *t) : Decl(n) {
    Assert(n != NULL && t != NULL);
    (type=t)->SetParent(this);
    location = NULL;
}
  

ClassDecl::ClassDecl(Identifier *n, NamedType *ex, List<NamedType*> *imp, List<Decl*> *m) : Decl(n) {
    // extends can be NULL, impl & mem may be empty lists but cannot be NULL
    Assert(n != NULL && imp != NULL && m != NULL);     
    extends = ex;
    if (extends) extends->SetParent(this);
    (implements=imp)->SetParentAll(this);
    (members=m)->SetParentAll(this);
}


InterfaceDecl::InterfaceDecl(Identifier *n, List<Decl*> *m) : Decl(n) {
    Assert(n != NULL && m != NULL);
    (members=m)->SetParentAll(this);
}

	
FnDecl::FnDecl(Identifier *n, Type *r, List<VarDecl*> *d) : Decl(n) {
    Assert(n != NULL && r!= NULL && d != NULL);
    (returnType=r)->SetParent(this);
    (formals=d)->SetParentAll(this);
    body = NULL;
}

void FnDecl::SetFunctionBody(Stmt *b) {
    (body=b)->SetParent(this);
}

// VarDecl Emit - just a placeholder, actual location assignment happens in parent
void VarDecl::Emit(CodeGenerator *cg) {
    // Location is set by parent (StmtBlock, FnDecl, or Program)
    // Nothing to emit for variable declaration itself
}

// FnDecl Emit
void FnDecl::Emit(CodeGenerator *cg) {
    // Generate function label
    char label[256];
    const char *fname = id->GetName();
    bool isMain = (strcmp(fname, "main") == 0);

    if (isMain) {
        strcpy(label, "main");
    } else {
        // Check if this is a method (parent is ClassDecl)
        ClassDecl *classDecl = dynamic_cast<ClassDecl*>(parent);
        if (classDecl) {
            // Method label: _ClassName.methodName
            sprintf(label, "_%s.%s", classDecl->GetId()->GetName(), fname);
        } else {
            // Regular function: _functionName
            sprintf(label, "_%s", fname);
        }
    }

    cg->GenLabel(label);

    // Generate BeginFunc
    BeginFunc *beginFunc = cg->GenBeginFunc();

    // Reset local offset for new function
    cg->ResetLocalOffset();

    // Assign locations to parameters and add to symbol table
    bool isMethod = (dynamic_cast<ClassDecl*>(parent) != NULL);
    for (int i = 0; i < formals->NumElements(); i++) {
        VarDecl *param = formals->Nth(i);
        Location *loc = cg->GenParamVar(param->GetId()->GetName(), i, isMethod);
        param->SetLocation(loc);
        cg->AddVariable(param->GetId()->GetName(), loc);
        cg->AddVarDecl(param->GetId()->GetName(), param);
    }

    // Emit function body
    if (body) {
        body->Emit(cg);
    }

    // Generate EndFunc
    cg->GenEndFunc();

    // Backpatch frame size
    int frameSize = -(cg->GetCurrentLocalOffset() + 8);
    beginFunc->SetFrameSize(frameSize);
}

// ClassDecl Emit
void ClassDecl::Emit(CodeGenerator *cg) {
    // Build vtable
    List<const char*> *methodLabels = new List<const char*>();

    // Collect methods and generate their code
    for (int i = 0; i < members->NumElements(); i++) {
        FnDecl *method = dynamic_cast<FnDecl*>(members->Nth(i));
        if (method) {
            // Build method label
            char *label = new char[256];
            sprintf(label, "_%s.%s", id->GetName(), method->GetId()->GetName());
            methodLabels->Append(label);

            // Emit method code
            method->Emit(cg);
        }
    }

    // Generate vtable
    if (methodLabels->NumElements() > 0) {
        cg->GenVTable(id->GetName(), methodLabels);
    }
}



