/* File: parser.y
 * --------------
 * Yacc input file to generate the parser for the compiler.
 *
 * pp2: your job is to write a parser that will construct the parse tree
 *      and if no parse errors were found, print it.  The parser should 
 *      accept the language as described in specification, and as augmented 
 *      in the pp2 handout.
 */

%{

/* Just like lex, the text within this first region delimited by %{ and %}
 * is assumed to be C/C++ code and will be copied verbatim to the y.tab.c
 * file ahead of the definitions of the yyparse() function. Add other header
 * file inclusions or C++ variable declarations/prototypes that are needed
 * by your code here.
 */
#include "scanner.h" // for yylex
#include "parser.h"
#include "errors.h"
#include <string.h>

void yyerror(const char *msg); // standard error-handling routine

%}

/* The section before the first %% is the Definitions section of the yacc
 * input file. Here is where you declare tokens and types, add precedence
 * and associativity options, and so on.
 */
 
/* yylval 
 * ------
 * Here we define the type of the yylval global variable that is used by
 * the scanner to store attibute information about the token just scanned
 * and thus communicate that information to the parser. 
 *
 * pp2: You will need to add new fields to this union as you add different 
 *      attributes to your non-terminal symbols.
 */
%union {
    int integerConstant;
    bool boolConstant;
    char *stringConstant;
    double doubleConstant;
    char identifier[MaxIdentLen+1]; // +1 for terminating null
    Identifier *ident;
    Type *type;
    NamedType *namedType;
    List<NamedType*> *namedTypeList;
    Decl *decl;
    List<Decl*> *declList;
    VarDecl *varDecl;
    List<VarDecl*> *varDeclList;
    Stmt *stmt;
    StmtBlock *stmtBlock;
    List<Stmt*> *stmtList;
    Expr *expr;
    List<Expr*> *exprList;
    Case *caseStmt;
    List<Case*> *caseList;
    DefaultCase *defaultCase;
    DeclStmtLists *declStmtLists;
    Operator *op;
}


/* Tokens
 * ------
 * Here we tell yacc about all the token types that we are using.
 * Yacc will assign unique numbers to these and export the #define
 * in the generated y.tab.h header file.
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

%token   T_Increm T_Decrem T_Switch T_Case T_Default

%glr-parser
%start Program
%locations

%nonassoc NO_ELSE
%nonassoc T_Else
%right '='
%left T_Or
%left T_And
%left T_Equal T_NotEqual
%left '<' '>' T_LessEqual T_GreaterEqual
%left '+' '-'
%left '*' '/' '%'
%right '!' UMINUS
%left T_Increm T_Decrem

%type <declList> DeclList ClassBodyDecls InterfaceMembers
%type <decl> Decl ClassDecl InterfaceDecl FnDecl Prototype ClassBodyDecl
%type <varDecl> VarDecl Formal
%type <varDeclList> FormalsOpt Formals
%type <type> Type TypeOrVoid
%type <namedType> NamedType ExtendsOpt
%type <namedTypeList> ImplementsOpt ImplementsList
%type <ident> Ident
%type <stmt> Stmt
%type <stmtBlock> StmtBlock
%type <declStmtLists> DeclStmtList
%type <stmtList> StmtList
%type <expr> Expr ExprOpt LValue Call Constant
%type <exprList> Actuals ActualsOpt PrintArgs ExprList
%type <caseStmt> Case
%type <caseList> CaseList
%type <defaultCase> DefaultOpt
%type <ident> CaseKeyword DefaultKeyword
%type <expr> CaseLabel
%type <op> PostfixOp
%type <ident> SwitchKeyword

%%
/* Rules
 * -----
 * All productions and actions should be placed between the start and stop
 * %% markers which delimit the Rules section.
	 
 */
Program   :    DeclList            { 
                                      Program *program = new Program($1);
                                      if (ReportError::NumErrors() == 0)
                                          program->Print(0);
                                    }
          ;

DeclList  :    DeclList Decl        { ($$=$1)->Append($2); }
          |    Decl                 { ($$ = new List<Decl*>)->Append($1); }
          ;

Decl      :    VarDecl              { $$ = $1; }
          |    FnDecl               { $$ = $1; }
          |    ClassDecl            { $$ = $1; }
          |    InterfaceDecl        { $$ = $1; }
          ;

ClassDecl :    T_Class Ident ExtendsOpt ImplementsOpt '{' ClassBodyDecls '}'
                                    { $$ = new ClassDecl($2, $3, $4, $6); }
          ;

ExtendsOpt:    T_Extends NamedType  { $$ = $2; }
          |    /* empty */          { $$ = NULL; }
          ;

ImplementsOpt
          :    T_Implements ImplementsList { $$ = $2; }
          |    /* empty */          { $$ = new List<NamedType*>; }
          ;

ImplementsList
          :    ImplementsList ',' NamedType { ($$=$1)->Append($3); }
          |    NamedType            { ($$ = new List<NamedType*>)->Append($1); }
          ;

ClassBodyDecls
          :    ClassBodyDecls ClassBodyDecl { ($$=$1)->Append($2); }
          |    /* empty */                  { $$ = new List<Decl*>; }
          ;

ClassBodyDecl
          :    VarDecl              { $$ = $1; }
          |    FnDecl               { $$ = $1; }
          ;

InterfaceDecl
          :    T_Interface Ident '{' InterfaceMembers '}'
                                    { $$ = new InterfaceDecl($2, $4); }
          ;

InterfaceMembers
          :    InterfaceMembers Prototype { ($$=$1)->Append($2); }
          |    /* empty */          { $$ = new List<Decl*>; }
          ;

Prototype :    TypeOrVoid Ident '(' FormalsOpt ')' ';'
                                    { FnDecl *fn = new FnDecl($2, $1, $4);
                                      $$ = fn; }
          ;

FnDecl    :    TypeOrVoid Ident '(' FormalsOpt ')' StmtBlock
                                    { FnDecl *fn = new FnDecl($2, $1, $4);
                                      fn->SetFunctionBody($6);
                                      $$ = fn; }
          ;

FormalsOpt
          :    Formals              { $$ = $1; }
          |    /* empty */          { $$ = new List<VarDecl*>; }
          ;

Formals   :    Formals ',' Formal   { ($$=$1)->Append($3); }
          |    Formal               { ($$ = new List<VarDecl*>)->Append($1); }
          ;

Formal    :    Type Ident           { $$ = new VarDecl($2, $1); }
          ;

VarDecl   :    Type Ident ';'       { $$ = new VarDecl($2, $1); }
          ;

TypeOrVoid
          :    Type                 { $$ = $1; }
          |    T_Void               { $$ = Type::voidType; }
          ;

Type      :    T_Int                { $$ = Type::intType; }
          |    T_Double             { $$ = Type::doubleType; }
          |    T_Bool               { $$ = Type::boolType; }
          |    T_String             { $$ = Type::stringType; }
          |    NamedType            { $$ = $1; }
          |    Type T_Dims          { $$ = new ArrayType(@2, $1); }
          ;

NamedType :    Ident                { $$ = new NamedType($1); }
          ;

Ident     :    T_Identifier         { $$ = new Identifier(@1, $1); }
          ;

StmtBlock :    '{' DeclStmtList '}'
                                    { DeclStmtLists *dsl = $2;
                                      $$ = new StmtBlock(dsl->varDecls, dsl->stmts);
                                      delete dsl; }
          ;

DeclStmtList
          :    VarDecl DeclStmtList  { $$ = $2; $$->varDecls->InsertAt($1, 0); }
          |    Stmt DeclStmtList     { $$ = $2; $$->stmts->InsertAt($1, 0); }
          |    /* empty */           { $$ = new DeclStmtLists;
                                      $$->varDecls = new List<VarDecl*>;
                                      $$->stmts = new List<Stmt*>; }
          ;

StmtList  :    StmtList Stmt         { ($$=$1)->Append($2); }
          |    /* empty */           { $$ = new List<Stmt*>; }
          ;

Stmt      :    StmtBlock             { $$ = $1; }
          |    T_If '(' Expr ')' Stmt %prec NO_ELSE
                                    { $$ = new IfStmt($3, $5, NULL); }
          |    T_If '(' Expr ')' Stmt T_Else Stmt
                                    { $$ = new IfStmt($3, $5, $7); }
          |    T_While '(' Expr ')' Stmt
                                    { $$ = new WhileStmt($3, $5); }
          |    T_For '(' ExprOpt ';' ExprOpt ';' ExprOpt ')' Stmt
                                    { $$ = new ForStmt($3, $5, $7, $9); }
          |    T_Break ';'          { $$ = new BreakStmt(@1); }
          |    T_Return ExprOpt ';' { $$ = new ReturnStmt(@1, $2); }
          |    T_Print '(' PrintArgs ')' ';'
                                    { $$ = new PrintStmt($3); }
          |    SwitchKeyword '(' Expr ')' '{' CaseList DefaultOpt '}'
                                    { $$ = new SwitchStmt($3, $6, $7); }
          |    Expr ';'             { $$ = $1; }
          ;

CaseList  :    CaseList Case         { ($$=$1)->Append($2); }
          |    Case                  { ($$ = new List<Case*>)->Append($1); }
          ;

Case      :    CaseKeyword CaseLabel ':' StmtList
                                    { $$ = new Case((IntConstant*)$2, $4); }
          ;

DefaultOpt
          :    DefaultKeyword ':' StmtList { $$ = new DefaultCase($3); }
          |    /* empty */                { $$ = NULL; }
          ;

ExprOpt   :    Expr                  { $$ = $1; }
          |    /* empty */           { $$ = new EmptyExpr(); }
          ;

PrintArgs :    ExprList              { $$ = $1; }
          ;

ExprList  :    ExprList ',' Expr     { ($$=$1)->Append($3); }
          |    Expr                  { ($$ = new List<Expr*>)->Append($1); }
          ;

ActualsOpt
          :    Actuals               { $$ = $1; }
          |    /* empty */           { $$ = new List<Expr*>; }
          ;

Actuals   :    ExprList              { $$ = $1; }
          ;

Expr      :    Expr '+' Expr         { $$ = new ArithmeticExpr($1, new Operator(@2, "+"), $3); }
          |    Expr '-' Expr         { $$ = new ArithmeticExpr($1, new Operator(@2, "-"), $3); }
          |    Expr '*' Expr         { $$ = new ArithmeticExpr($1, new Operator(@2, "*"), $3); }
          |    Expr '/' Expr         { $$ = new ArithmeticExpr($1, new Operator(@2, "/"), $3); }
          |    Expr '%' Expr         { $$ = new ArithmeticExpr($1, new Operator(@2, "%"), $3); }
          |    Expr '<' Expr         { $$ = new RelationalExpr($1, new Operator(@2, "<"), $3); }
          |    Expr '>' Expr         { $$ = new RelationalExpr($1, new Operator(@2, ">"), $3); }
          |    Expr T_LessEqual Expr { $$ = new RelationalExpr($1, new Operator(@2, "<="), $3); }
          |    Expr T_GreaterEqual Expr
                                    { $$ = new RelationalExpr($1, new Operator(@2, ">="), $3); }
          |    Expr T_Equal Expr     { $$ = new EqualityExpr($1, new Operator(@2, "=="), $3); }
          |    Expr T_NotEqual Expr  { $$ = new EqualityExpr($1, new Operator(@2, "!="), $3); }
          |    Expr T_And Expr       { $$ = new LogicalExpr($1, new Operator(@2, "&&"), $3); }
          |    Expr T_Or Expr        { $$ = new LogicalExpr($1, new Operator(@2, "||"), $3); }
          |    LValue '=' Expr       { $$ = new AssignExpr($1, new Operator(@2, "="), $3); }
          |    LValue PostfixOp      { $$ = new PostfixExpr($1, $2); }
          |    '-' Expr %prec UMINUS { $$ = new ArithmeticExpr(new Operator(@1, "-"), $2); }
          |    '!' Expr              { $$ = new LogicalExpr(new Operator(@1, "!"), $2); }
          |    '(' Expr ')'          { $$ = $2; }
          |    LValue                { $$ = $1; }
          |    Call                  { $$ = $1; }
          |    Constant              { $$ = $1; }
          |    T_This                { $$ = new This(@1); }
          |    T_ReadInteger '(' ')' { $$ = new ReadIntegerExpr(Join(@1, @3)); }
          |    T_ReadLine '(' ')'    { $$ = new ReadLineExpr(Join(@1, @3)); }
          |    T_New '(' Ident ')'   { $$ = new NewExpr(Join(@1, @4), new NamedType($3)); }
          |    T_NewArray '(' Expr ',' Type ')' 
                                    { $$ = new NewArrayExpr(Join(@1, @6), $3, $5); }
          ;

LValue    :    Ident                 { $$ = new FieldAccess(NULL, $1); }
          |    Expr '.' Ident        { $$ = new FieldAccess($1, $3); }
          |    LValue '[' Expr ']'   { $$ = new ArrayAccess(Join(@1, @4), $1, $3); }
          ;

Call      :    Ident '(' ActualsOpt ')'
                                    { $$ = new Call(Join(@1, @4), NULL, $1, $3); }
          |    LValue '.' Ident '(' ActualsOpt ')'
                                    { $$ = new Call(Join(@1, @6), $1, $3, $5); }
          ;

Constant  :    T_IntConstant         { $$ = new IntConstant(@1, $1); }
          |    T_DoubleConstant      { $$ = new DoubleConstant(@1, $1); }
          |    T_BoolConstant        { $$ = new BoolConstant(@1, $1); }
          |    T_StringConstant      { $$ = new StringConstant(@1, $1); }
          |    T_Null                { $$ = new NullConstant(@1); }
          ;

PostfixOp :    T_Increm              { $$ = new Operator(@1, "++"); }
          |    T_Decrem              { $$ = new Operator(@1, "--"); }
          |    '+' '+'               { $$ = new Operator(Join(@1, @2), "++"); }
          |    '-' '-'               { $$ = new Operator(Join(@1, @2), "--"); }
          ;

SwitchKeyword
          :    T_Switch             { $$ = NULL; }
          |    Ident                { if (strcmp($1->GetName(), "switch") == 0)
                                          $$ = $1;
                                      else {
                                          $$ = NULL;
                                          YYERROR;
                                      } }
          ;

CaseKeyword
          :    T_Case               { $$ = NULL; }
          |    Ident                { if (strcmp($1->GetName(), "case") == 0)
                                          $$ = $1;
                                      else {
                                          $$ = NULL;
                                          YYERROR;
                                      } }
          ;

DefaultKeyword
          :    T_Default            { $$ = NULL; }
          |    Ident                { if (strcmp($1->GetName(), "default") == 0)
                                          $$ = $1;
                                      else {
                                          $$ = NULL;
                                          YYERROR;
                                      } }
          ;

CaseLabel :    T_IntConstant        { $$ = new IntConstant(@1, $1); }
          |    '-' T_IntConstant    { $$ = new IntConstant(Join(@1, @2), -$2); }
          ;


%%

/* The closing %% above marks the end of the Rules section and the beginning
 * of the User Subroutines section. All text from here to the end of the
 * file is copied verbatim to the end of the generated y.tab.c file.
 * This section is where you put definitions of helper functions.
 */

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
   yydebug = false;
}
