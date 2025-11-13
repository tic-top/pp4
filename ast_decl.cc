/* File: ast_decl.cc
 * -----------------
 * Implementation of Decl node classes.
 */
#include "ast_decl.h"
#include "ast_type.h"
#include "ast_stmt.h"
#include "codegen.h"
#include <string.h>
        
         
Hashtable<ClassDecl*> *ClassDecl::classTable = NULL;
Hashtable<FnDecl*> *FnDecl::fnTable = NULL;

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
    orderedFields = NULL;
    orderedMethods = NULL;
    layoutPrepared = false;
    yyltype loc = *(n->GetLocation());
    Identifier *idCopy = new Identifier(loc, n->GetName());
    classType = new NamedType(idCopy);
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

void ClassDecl::RegisterClass(ClassDecl *decl) {
    if (!classTable)
        classTable = new Hashtable<ClassDecl*>();
    classTable->Enter(decl->GetId()->GetName(), decl);
}

ClassDecl *ClassDecl::LookupClass(const char *name) {
    if (!classTable) return NULL;
    return classTable->Lookup(name);
}

void ClassDecl::PrepareLayout() {
    if (layoutPrepared) return;
    if (!orderedFields) orderedFields = new List<VarDecl*>();
    if (!orderedMethods) orderedMethods = new List<FnDecl*>();

    if (extends) {
        ClassDecl *parent = LookupClass(extends->GetId()->GetName());
        if (parent) {
            parent->PrepareLayout();
            List<VarDecl*> *parentFields = parent->GetOrderedFields();
            if (parentFields) {
                for (int i = 0; i < parentFields->NumElements(); i++)
                    orderedFields->Append(parentFields->Nth(i));
            }
            List<FnDecl*> *parentMethods = parent->GetOrderedMethods();
            if (parentMethods) {
                for (int i = 0; i < parentMethods->NumElements(); i++)
                    orderedMethods->Append(parentMethods->Nth(i));
            }
        }
    }

    for (int i = 0; i < members->NumElements(); i++) {
        VarDecl *var = dynamic_cast<VarDecl*>(members->Nth(i));
        if (var) {
            orderedFields->Append(var);
            continue;
        }

        FnDecl *method = dynamic_cast<FnDecl*>(members->Nth(i));
        if (method) {
            int idx = -1;
            for (int m = 0; m < orderedMethods->NumElements(); m++) {
                if (!strcmp(orderedMethods->Nth(m)->GetId()->GetName(),
                            method->GetId()->GetName())) {
                    idx = m;
                    break;
                }
            }
            if (idx >= 0) {
                orderedMethods->RemoveAt(idx);
                orderedMethods->InsertAt(method, idx);
            } else {
                orderedMethods->Append(method);
            }
        }
    }
    layoutPrepared = true;
}

int ClassDecl::GetFieldOffset(const char *fieldName) {
    PrepareLayout();
    if (!orderedFields) return -1;
    for (int i = 0; i < orderedFields->NumElements(); i++) {
        if (!strcmp(orderedFields->Nth(i)->GetId()->GetName(), fieldName)) {
            return CodeGenerator::VarSize * (i + 1);
        }
    }
    return -1;
}

int ClassDecl::GetFieldCount() {
    PrepareLayout();
    return orderedFields ? orderedFields->NumElements() : 0;
}

VarDecl *ClassDecl::GetFieldDecl(const char *fieldName) {
    PrepareLayout();
    if (!orderedFields) return NULL;
    for (int i = 0; i < orderedFields->NumElements(); i++) {
        VarDecl *decl = orderedFields->Nth(i);
        if (!strcmp(decl->GetId()->GetName(), fieldName))
            return decl;
    }
    return NULL;
}

FnDecl *ClassDecl::GetMethodDecl(const char *methodName) {
    PrepareLayout();
    if (!orderedMethods) return NULL;
    for (int i = 0; i < orderedMethods->NumElements(); i++) {
        FnDecl *decl = orderedMethods->Nth(i);
        if (!strcmp(decl->GetId()->GetName(), methodName))
            return decl;
    }
    return NULL;
}

int ClassDecl::GetMethodIndex(const char *methodName) {
    PrepareLayout();
    if (!orderedMethods) return -1;
    for (int i = 0; i < orderedMethods->NumElements(); i++) {
        if (!strcmp(orderedMethods->Nth(i)->GetId()->GetName(), methodName))
            return i;
    }
    return -1;
}

void FnDecl::RegisterFunction(FnDecl *fn) {
    if (!fnTable)
        fnTable = new Hashtable<FnDecl*>();
    fnTable->Enter(fn->GetId()->GetName(), fn);
}

FnDecl *FnDecl::LookupFunction(const char *name) {
    if (!fnTable) return NULL;
    return fnTable->Lookup(name);
}

// FnDecl Emit
void FnDecl::Emit(CodeGenerator *cg) {
    // Generate function label
    char label[256];
    const char *fname = id->GetName();
    ClassDecl *classDecl = dynamic_cast<ClassDecl*>(parent);
    bool isMain = (!classDecl && strcmp(fname, "main") == 0);

    if (isMain) {
        strcpy(label, "main");
    } else {
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
    cg->ClearVariables();
    cg->PushScope();

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
    cg->PopScope();

    // Backpatch frame size
    int frameSize = -(cg->GetCurrentLocalOffset() + 8);
    beginFunc->SetFrameSize(frameSize);
}

// ClassDecl Emit
void ClassDecl::Emit(CodeGenerator *cg) {
    PrepareLayout();
    List<const char*> *methodLabels = new List<const char*>();
    if (orderedMethods) {
        for (int i = 0; i < orderedMethods->NumElements(); i++) {
            FnDecl *method = orderedMethods->Nth(i);
            ClassDecl *owner = dynamic_cast<ClassDecl*>(method->GetParent());
            const char *ownerName = owner ? owner->GetId()->GetName() : id->GetName();
            char *label = new char[256];
            sprintf(label, "_%s.%s", ownerName, method->GetId()->GetName());
            methodLabels->Append(label);
        }
    }
    cg->GenVTable(id->GetName(), methodLabels);

    for (int i = 0; i < members->NumElements(); i++) {
        FnDecl *method = dynamic_cast<FnDecl*>(members->Nth(i));
        if (method) method->Emit(cg);
    }
}
