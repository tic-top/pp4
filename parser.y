/* File: parser.y
 * --------------
 * Yacc input file to generate the parser for the compiler.
 *
 * pp3: add parser rules and tree construction from your pp2. You should
 *      not need to make any significant changes in the parser itself. After
 *      parsing completes, if no syntax errors were found, the parser calls
 *      program->Check() to kick off the semantic analyzer pass. The
 *      interesting work happens during the tree traversal.
 */

%{

#include "scanner.h" // for yylex
#include "parser.h"
#include "errors.h"
#include "utility.h"

void yyerror(const char *msg); // standard error-handling routine

static Identifier *NewIdentifier(const yyltype &loc, const char *text) {
    return new Identifier(loc, text);
}

%}

%code requires {
struct BlockComponents {
    List<VarDecl*> *decls;
    List<Stmt*> *stmts;
    BlockComponents() : decls(new List<VarDecl*>()), stmts(new List<Stmt*>()) {}
};
}

 
/* yylval 
 * ------
 */
%union {
    int integerConstant;
    bool boolConstant;
    char *stringConstant;
    double doubleConstant;
    char identifier[MaxIdentLen+1]; // +1 for terminating null
    Decl *decl;
    List<Decl*> *declList;
    VarDecl *varDecl;
    List<VarDecl*> *varDeclList;
    NamedType *namedType;
    List<NamedType*> *namedTypeList;
    Type *type;
    FnDecl *fnDecl;
    InterfaceDecl *interfaceDecl;
    ClassDecl *classDecl;
    Stmt *stmt;
    StmtBlock *stmtBlock;
    Expr *expr;
    List<Expr*> *exprList;
    Identifier *identifierObj;
    BlockComponents *block;
}


/* Tokens
 * ------
 */
%token   T_Void T_Bool T_Int T_Double T_String T_Class 
%token   T_LessEqual T_GreaterEqual T_Equal T_NotEqual T_Dims
%token   T_And T_Or T_Null T_Extends T_This T_Interface T_Implements
%token   T_While T_For T_If T_Else T_Return T_Break
%token   T_New T_NewArray T_Print T_ReadInteger T_ReadLine

%token   <identifier> T_Identifier
%token   <stringConstant> T_StringConstant 
%token   <integerConstant> T_IntConstant
%token   <doubleConstant> T_DoubleConstant
%token   <boolConstant> T_BoolConstant


/* Non-terminal types
 * ------------------
 */
%type <declList> DeclList FieldList PrototypeList
%type <decl> Decl Field Prototype
%type <identifierObj> Ident
%type <namedType> ExtendsOpt
%type <namedTypeList> ImplementsOpt IdentList
%type <varDecl> VarDecl Variable
%type <varDeclList> Formals FormalsOpt
%type <type> Type
%type <stmtBlock> StmtBlock
%type <stmt> Stmt IfStmt WhileStmt ForStmt BreakStmt ReturnStmt PrintStmt
%type <expr> Expr AssignExpr OrExpr AndExpr EqExpr RelExpr AddExpr MulExpr UnaryExpr PostfixExpr Primary Constant ExprOpt
%type <exprList> Actuals ActualsOpt
%type <block> BlockItems
%type <classDecl> ClassDecl
%type <interfaceDecl> InterfaceDecl
%type <fnDecl> FnDecl

%right '='
%left T_Or
%left T_And
%nonassoc T_Equal T_NotEqual
%nonassoc '<' '>' T_LessEqual T_GreaterEqual
%left '+' '-'
%left '*' '/' '%'
%right '!' UMINUS
%nonassoc LOWER_THAN_ELSE
%nonassoc T_Else


%%
/* Rules
 * -----
	 
 */
Program   :    DeclList            {
                                      @1;
                                      Program *program = new Program($1);
                                      // if no errors, advance to next phase
                                      if (ReportError::NumErrors() == 0) {
                                          program->Check();
                                          program->Emit();
                                      }
                                    }
          ;

DeclList  : DeclList Decl          { ($$=$1)->Append($2); }
          | Decl                   { ($$ = new List<Decl*>)->Append($1); }
          |                        { $$ = new List<Decl*>; }
          ;

Decl      : VarDecl                { $$ = $1; }
          | FnDecl                 { $$ = $1; }
          | ClassDecl              { $$ = $1; }
          | InterfaceDecl          { $$ = $1; }
          ;

Ident     : T_Identifier           { $$ = NewIdentifier(@1, $1); }
          ;

ClassDecl : T_Class Ident ExtendsOpt ImplementsOpt '{' FieldList '}'
            { $$ = new ClassDecl($2, $3, $4, $6); }
          ;

ExtendsOpt: T_Extends Ident        { $$ = new NamedType($2); }
          |                        { $$ = NULL; }
          ;

ImplementsOpt
          : T_Implements IdentList { $$ = $2; }
          |                        { $$ = new List<NamedType*>; }
          ;

IdentList : IdentList ',' Ident    { ($$=$1)->Append(new NamedType($3)); }
          | Ident                  { ($$ = new List<NamedType*>)->Append(new NamedType($1)); }
          ;

FieldList : FieldList Field        { ($$=$1)->Append($2); }
          |                        { $$ = new List<Decl*>; }
          ;

Field     : VarDecl                { $$ = $1; }
          | FnDecl                 { $$ = $1; }
          ;

InterfaceDecl
          : T_Interface Ident '{' PrototypeList '}' 
            { $$ = new InterfaceDecl($2, $4); }
          ;

PrototypeList
          : PrototypeList Prototype { ($$=$1)->Append($2); }
          |                         { $$ = new List<Decl*>; }
          ;

Prototype : Type Ident '(' FormalsOpt ')' ';'
            { $$ = new FnDecl($2, $1, $4); }
          | T_Void Ident '(' FormalsOpt ')' ';'
            { $$ = new FnDecl($2, Type::voidType, $4); }
          ;

FnDecl    : Type Ident '(' FormalsOpt ')' StmtBlock
            {
                $$ = new FnDecl($2, $1, $4);
                $$->SetFunctionBody($6);
            }
          | T_Void Ident '(' FormalsOpt ')' StmtBlock
            {
                $$ = new FnDecl($2, Type::voidType, $4);
                $$->SetFunctionBody($6);
            }
          ;

FormalsOpt: Formals                { $$ = $1; }
          |                        { $$ = new List<VarDecl*>; }
          ;

Formals   : Formals ',' Variable   { ($$=$1)->Append($3); }
          | Variable               { ($$ = new List<VarDecl*>)->Append($1); }
          ;

VarDecl   : Variable ';'           { $$ = $1; }
          ;

Variable  : Type Ident             { $$ = new VarDecl($2, $1); }
          ;

Type      : T_Int                  { $$ = Type::intType; }
          | T_Double               { $$ = Type::doubleType; }
          | T_Bool                 { $$ = Type::boolType; }
          | T_String               { $$ = Type::stringType; }
          | Ident                  { $$ = new NamedType($1); }
          | Type T_Dims            { $$ = new ArrayType(Join(@1, @2), $1); }
          ;

StmtBlock : '{' BlockItems '}'
            {
                $$ = new StmtBlock($2->decls, $2->stmts);
                delete $2;
            }
          ;

BlockItems
          : BlockItems VarDecl     { $$ = $1; $$->decls->Append($2); }
          | BlockItems Stmt        { $$ = $1; $$->stmts->Append($2); }
          |                        { $$ = new BlockComponents(); }
          ;

Stmt      : Expr ';'               { $$ = $1; }
          | IfStmt
          | WhileStmt
          | ForStmt
          | BreakStmt
          | ReturnStmt
          | PrintStmt
          | StmtBlock              { $$ = $1; }
          ;

IfStmt    : T_If '(' Expr ')' Stmt %prec LOWER_THAN_ELSE
            { $$ = new IfStmt($3, $5, NULL); }
          | T_If '(' Expr ')' Stmt T_Else Stmt
            { $$ = new IfStmt($3, $5, $7); }
          ;

WhileStmt : T_While '(' Expr ')' Stmt
            { $$ = new WhileStmt($3, $5); }
          ;

ExprOpt   : Expr                   { $$ = $1; }
          |                        { $$ = new EmptyExpr(); }
          ;

ForStmt   : T_For '(' ExprOpt ';' ExprOpt ';' ExprOpt ')' Stmt
            { $$ = new ForStmt($3, $5, $7, $9); }
          ;

BreakStmt : T_Break ';'            { $$ = new BreakStmt(@1); }
          ;

ReturnStmt: T_Return Expr ';'      { $$ = new ReturnStmt(@2, $2); }
          | T_Return ';'           { $$ = new ReturnStmt(@1, new EmptyExpr()); }
          ;

PrintStmt : T_Print '(' ActualsOpt ')' ';'
            { $$ = new PrintStmt($3); }
          ;

ActualsOpt
          : Actuals                { $$ = $1; }
          |                        { $$ = new List<Expr*>; }
          ;

Actuals   : Actuals ',' Expr       { ($$=$1)->Append($3); }
          | Expr                   { ($$ = new List<Expr*>)->Append($1); }
          ;

Expr      : AssignExpr             { $$ = $1; }
          ;

AssignExpr: PostfixExpr '=' AssignExpr
                                  { $$ = new AssignExpr($1, new Operator(@2, "="), $3); }
          | OrExpr                 { $$ = $1; }
          ;

OrExpr    : OrExpr T_Or AndExpr    { $$ = new LogicalExpr($1, new Operator(@2, "||"), $3); }
          | AndExpr                { $$ = $1; }
          ;

AndExpr   : AndExpr T_And EqExpr   { $$ = new LogicalExpr($1, new Operator(@2, "&&"), $3); }
          | EqExpr                 { $$ = $1; }
          ;

EqExpr    : EqExpr T_Equal RelExpr     { $$ = new EqualityExpr($1, new Operator(@2, "=="), $3); }
          | EqExpr T_NotEqual RelExpr  { $$ = new EqualityExpr($1, new Operator(@2, "!="), $3); }
          | RelExpr                    { $$ = $1; }
          ;

RelExpr   : RelExpr '<' AddExpr           { $$ = new RelationalExpr($1, new Operator(@2, "<"), $3); }
          | RelExpr '>' AddExpr           { $$ = new RelationalExpr($1, new Operator(@2, ">"), $3); }
          | RelExpr T_LessEqual AddExpr   { $$ = new RelationalExpr($1, new Operator(@2, "<="), $3); }
          | RelExpr T_GreaterEqual AddExpr{ $$ = new RelationalExpr($1, new Operator(@2, ">="), $3); }
          | AddExpr                       { $$ = $1; }
          ;

AddExpr   : AddExpr '+' MulExpr      { $$ = new ArithmeticExpr($1, new Operator(@2, "+"), $3); }
          | AddExpr '-' MulExpr      { $$ = new ArithmeticExpr($1, new Operator(@2, "-"), $3); }
          | MulExpr                  { $$ = $1; }
          ;

MulExpr   : MulExpr '*' UnaryExpr    { $$ = new ArithmeticExpr($1, new Operator(@2, "*"), $3); }
          | MulExpr '/' UnaryExpr    { $$ = new ArithmeticExpr($1, new Operator(@2, "/"), $3); }
          | MulExpr '%' UnaryExpr    { $$ = new ArithmeticExpr($1, new Operator(@2, "%"), $3); }
          | UnaryExpr                { $$ = $1; }
          ;

UnaryExpr : '-' UnaryExpr            { $$ = new ArithmeticExpr(new Operator(@1, "-"), $2); }
          | '!' UnaryExpr            { $$ = new LogicalExpr(new Operator(@1, "!"), $2); }
          | PostfixExpr              { $$ = $1; }
          ;

PostfixExpr
          : Primary                  { $$ = $1; }
          | PostfixExpr '[' Expr ']' { $$ = new ArrayAccess(Join($1->GetLocation(), &@4), $1, $3); }
          | PostfixExpr '.' T_Identifier '(' ActualsOpt ')'
                                    { $$ = new Call(Join($1->GetLocation(), &@6), $1, new Identifier(@3, $3), $5); }
          | PostfixExpr '.' T_Identifier
                                    { $$ = new FieldAccess($1, new Identifier(@3, $3)); }
          ;

Primary   : T_Identifier '(' ActualsOpt ')'
                                    { $$ = new Call(Join(@1, @4), NULL, new Identifier(@1, $1), $3); }
          | T_ReadInteger '(' ')'    { $$ = new ReadIntegerExpr(Join(@1, @3)); }
          | T_ReadLine '(' ')'       { $$ = new ReadLineExpr(Join(@1, @3)); }
          | T_New '(' Ident ')'      { $$ = new NewExpr(Join(@1, @4), new NamedType($3)); }
          | T_NewArray '(' Expr ',' Type ')'
                                    { $$ = new NewArrayExpr(Join(@1, @6), $3, $5); }
          | '(' Expr ')'             { $$ = $2; }
          | Constant                 { $$ = $1; }
          | T_This                   { $$ = new This(@1); }
          | T_Identifier             { $$ = new FieldAccess(NULL, new Identifier(@1, $1)); }
          ;

Constant  : T_IntConstant            { $$ = new IntConstant(@1, $1); }
          | T_DoubleConstant         { $$ = new DoubleConstant(@1, $1); }
          | T_BoolConstant           { $$ = new BoolConstant(@1, $1); }
          | T_StringConstant         { $$ = new StringConstant(@1, $1); }
          | T_Null                   { $$ = new NullConstant(@1); }
          ;


%%


/* Function: InitParser
 * --------------------
 * This function will be called before any calls to yyparse().  It is designed
 * to give you an opportunity to do anything that must be done to initialize
 * the parser (set global variables, configure starting state, etc.). One
 * thing it already does for you is assign the value of the global variable
 * yydebug that controls whether yacc prints debugging information about
 * parser actions (shift/reduce) and contents of state stack during parser.
 * If set to false, no information is printed. Setting it to true will give
 * you a running trail that might be helpful when debugging your parser.
 * Please be sure the variable is set to false when submitting your final
 * version.
 */
void InitParser()
{
   PrintDebug("parser", "Initializing parser");
   yydebug = IsDebugOn("parser");
}
