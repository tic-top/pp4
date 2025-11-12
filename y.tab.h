/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif
/* "%code requires" blocks.  */
#line 27 "parser.y"

struct BlockComponents {
    List<VarDecl*> *decls;
    List<Stmt*> *stmts;
    BlockComponents() : decls(new List<VarDecl*>()), stmts(new List<Stmt*>()) {}
};

#line 57 "y.tab.h"

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    T_Void = 258,                  /* T_Void  */
    T_Bool = 259,                  /* T_Bool  */
    T_Int = 260,                   /* T_Int  */
    T_Double = 261,                /* T_Double  */
    T_String = 262,                /* T_String  */
    T_Class = 263,                 /* T_Class  */
    T_LessEqual = 264,             /* T_LessEqual  */
    T_GreaterEqual = 265,          /* T_GreaterEqual  */
    T_Equal = 266,                 /* T_Equal  */
    T_NotEqual = 267,              /* T_NotEqual  */
    T_Dims = 268,                  /* T_Dims  */
    T_And = 269,                   /* T_And  */
    T_Or = 270,                    /* T_Or  */
    T_Null = 271,                  /* T_Null  */
    T_Extends = 272,               /* T_Extends  */
    T_This = 273,                  /* T_This  */
    T_Interface = 274,             /* T_Interface  */
    T_Implements = 275,            /* T_Implements  */
    T_While = 276,                 /* T_While  */
    T_For = 277,                   /* T_For  */
    T_If = 278,                    /* T_If  */
    T_Else = 279,                  /* T_Else  */
    T_Return = 280,                /* T_Return  */
    T_Break = 281,                 /* T_Break  */
    T_New = 282,                   /* T_New  */
    T_NewArray = 283,              /* T_NewArray  */
    T_Print = 284,                 /* T_Print  */
    T_ReadInteger = 285,           /* T_ReadInteger  */
    T_ReadLine = 286,              /* T_ReadLine  */
    T_Identifier = 287,            /* T_Identifier  */
    T_StringConstant = 288,        /* T_StringConstant  */
    T_IntConstant = 289,           /* T_IntConstant  */
    T_DoubleConstant = 290,        /* T_DoubleConstant  */
    T_BoolConstant = 291,          /* T_BoolConstant  */
    UMINUS = 292,                  /* UMINUS  */
    LOWER_THAN_ELSE = 293          /* LOWER_THAN_ELSE  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define T_Void 258
#define T_Bool 259
#define T_Int 260
#define T_Double 261
#define T_String 262
#define T_Class 263
#define T_LessEqual 264
#define T_GreaterEqual 265
#define T_Equal 266
#define T_NotEqual 267
#define T_Dims 268
#define T_And 269
#define T_Or 270
#define T_Null 271
#define T_Extends 272
#define T_This 273
#define T_Interface 274
#define T_Implements 275
#define T_While 276
#define T_For 277
#define T_If 278
#define T_Else 279
#define T_Return 280
#define T_Break 281
#define T_New 282
#define T_NewArray 283
#define T_Print 284
#define T_ReadInteger 285
#define T_ReadLine 286
#define T_Identifier 287
#define T_StringConstant 288
#define T_IntConstant 289
#define T_DoubleConstant 290
#define T_BoolConstant 291
#define UMINUS 292
#define LOWER_THAN_ELSE 293

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 39 "parser.y"

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

#line 177 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif

/* Location type.  */
#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE YYLTYPE;
struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
};
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif


extern YYSTYPE yylval;
extern YYLTYPE yylloc;

int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
