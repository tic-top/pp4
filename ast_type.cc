/* File: ast_type.cc
 * -----------------
 * Implementation of type node classes.
 */
#include "ast_type.h"
#include "ast_decl.h"
#include <string.h>

static yyltype CopyNodeLocation(Node *node) {
    if (node && node->GetLocation())
        return *(node->GetLocation());
    yyltype loc;
    memset(&loc, 0, sizeof(loc));
    return loc;
}

static Identifier *CloneIdentifier(Identifier *orig) {
    if (orig == NULL) return NULL;
    yyltype loc = CopyNodeLocation(orig);
    return new Identifier(loc, orig->GetName());
}
 
/* Class constants
 * ---------------
 * These are public constants for the built-in base types (int, double, etc.)
 * They can be accessed with the syntax Type::intType. This allows you to
 * directly access them and share the built-in types where needed rather that
 * creates lots of copies.
 */

Type *Type::intType    = new Type("int");
Type *Type::doubleType = new Type("double");
Type *Type::voidType   = new Type("void");
Type *Type::boolType   = new Type("bool");
Type *Type::nullType   = new Type("null");
Type *Type::stringType = new Type("string");
Type *Type::errorType  = new Type("error"); 

Type::Type(const char *n) {
    Assert(n);
    typeName = strdup(n);
}



	
NamedType::NamedType(Identifier *i) : Type(*i->GetLocation()) {
    Assert(i != NULL);
    (id=i)->SetParent(this);
} 


ArrayType::ArrayType(yyltype loc, Type *et) : Type(loc) {
    Assert(et != NULL);
    (elemType=et)->SetParent(this);
}

Type *Type::CopyType(Type *type) {
    if (type == NULL) return NULL;

    ArrayType *arr = dynamic_cast<ArrayType*>(type);
    if (arr) {
        yyltype loc = CopyNodeLocation(arr);
        Type *elemCopy = CopyType(arr->GetElemType());
        return new ArrayType(loc, elemCopy);
    }

    NamedType *nt = dynamic_cast<NamedType*>(type);
    if (nt) {
        Identifier *idCopy = CloneIdentifier(nt->GetId());
        yyltype loc = CopyNodeLocation(nt);
        return new NamedType(idCopy);
    }

    return new Type(type->GetTypeName());
}

