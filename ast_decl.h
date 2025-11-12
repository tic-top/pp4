/* File: ast_decl.h
 * ----------------
 * In our parse tree, Decl nodes are used to represent and
 * manage declarations. There are 4 subclasses of the base class,
 * specialized for declarations of variables, functions, classes,
 * and interfaces.
 *
 * pp4: You will need to extend the Decl classes to implement 
 * code generation for declarations.
 */

#ifndef _H_ast_decl
#define _H_ast_decl

#include "ast.h"
#include "ast_type.h"
#include "hashtable.h"
#include "list.h"

class Identifier;
class Stmt;
class FnDecl;

class Decl : public Node
{
  protected:
    Identifier *id;

  public:
    Decl(Identifier *name);
    Identifier *GetId() { return id; }
    friend std::ostream& operator<<(std::ostream& out, Decl *d) { return out << d->id; }
};

class VarDecl : public Decl
{
  protected:
    Type *type;
    Location *location;

  public:
    VarDecl(Identifier *name, Type *type);
    void SetLocation(Location *loc) { location = loc; }
    Location *GetEmitLocation() { return location; }
    Type *GetType() { return type; }
    void Emit(CodeGenerator *cg);
};

class ClassDecl : public Decl
{
  protected:
    List<Decl*> *members;
    NamedType *extends;
    List<NamedType*> *implements;
    List<VarDecl*> *orderedFields;
    List<FnDecl*> *orderedMethods;
    bool layoutPrepared;
    NamedType *classType;
    static Hashtable<ClassDecl*> *classTable;

  public:
    ClassDecl(Identifier *name, NamedType *extends,
              List<NamedType*> *implements, List<Decl*> *members);
    void Emit(CodeGenerator *cg);
    static void RegisterClass(ClassDecl *decl);
    static ClassDecl *LookupClass(const char *name);
    NamedType *GetClassType() { return classType; }
    void PrepareLayout();
    int GetFieldOffset(const char *fieldName);
    int GetFieldCount();
    VarDecl *GetFieldDecl(const char *fieldName);
    FnDecl *GetMethodDecl(const char *methodName);
    int GetMethodIndex(const char *methodName);
    List<VarDecl*> *GetOrderedFields() { return orderedFields; }
    List<FnDecl*> *GetOrderedMethods() { return orderedMethods; }
};

class InterfaceDecl : public Decl 
{
  protected:
    List<Decl*> *members;
    
  public:
    InterfaceDecl(Identifier *name, List<Decl*> *members);
};

class FnDecl : public Decl
{
  protected:
    List<VarDecl*> *formals;
    Type *returnType;
    Stmt *body;
    static Hashtable<FnDecl*> *fnTable;

  public:
    FnDecl(Identifier *name, Type *returnType, List<VarDecl*> *formals);
    void SetFunctionBody(Stmt *b);
    void Emit(CodeGenerator *cg);
    static void RegisterFunction(FnDecl *fn);
    static FnDecl *LookupFunction(const char *name);
    Type *GetReturnType() { return returnType; }
    List<VarDecl*> *GetFormals() { return formals; }
};

#endif
