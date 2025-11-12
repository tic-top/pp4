/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 12 "parser.y"


#include "scanner.h" // for yylex
#include "parser.h"
#include "errors.h"
#include "utility.h"

void yyerror(const char *msg); // standard error-handling routine

static Identifier *NewIdentifier(const yyltype &loc, const char *text) {
    return new Identifier(loc, text);
}


#line 86 "y.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

/* Use api.header.include to #include this header
   instead of duplicating it here.  */
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

#line 129 "y.tab.c"

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

#line 249 "y.tab.c"

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
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_T_Void = 3,                     /* T_Void  */
  YYSYMBOL_T_Bool = 4,                     /* T_Bool  */
  YYSYMBOL_T_Int = 5,                      /* T_Int  */
  YYSYMBOL_T_Double = 6,                   /* T_Double  */
  YYSYMBOL_T_String = 7,                   /* T_String  */
  YYSYMBOL_T_Class = 8,                    /* T_Class  */
  YYSYMBOL_T_LessEqual = 9,                /* T_LessEqual  */
  YYSYMBOL_T_GreaterEqual = 10,            /* T_GreaterEqual  */
  YYSYMBOL_T_Equal = 11,                   /* T_Equal  */
  YYSYMBOL_T_NotEqual = 12,                /* T_NotEqual  */
  YYSYMBOL_T_Dims = 13,                    /* T_Dims  */
  YYSYMBOL_T_And = 14,                     /* T_And  */
  YYSYMBOL_T_Or = 15,                      /* T_Or  */
  YYSYMBOL_T_Null = 16,                    /* T_Null  */
  YYSYMBOL_T_Extends = 17,                 /* T_Extends  */
  YYSYMBOL_T_This = 18,                    /* T_This  */
  YYSYMBOL_T_Interface = 19,               /* T_Interface  */
  YYSYMBOL_T_Implements = 20,              /* T_Implements  */
  YYSYMBOL_T_While = 21,                   /* T_While  */
  YYSYMBOL_T_For = 22,                     /* T_For  */
  YYSYMBOL_T_If = 23,                      /* T_If  */
  YYSYMBOL_T_Else = 24,                    /* T_Else  */
  YYSYMBOL_T_Return = 25,                  /* T_Return  */
  YYSYMBOL_T_Break = 26,                   /* T_Break  */
  YYSYMBOL_T_New = 27,                     /* T_New  */
  YYSYMBOL_T_NewArray = 28,                /* T_NewArray  */
  YYSYMBOL_T_Print = 29,                   /* T_Print  */
  YYSYMBOL_T_ReadInteger = 30,             /* T_ReadInteger  */
  YYSYMBOL_T_ReadLine = 31,                /* T_ReadLine  */
  YYSYMBOL_T_Identifier = 32,              /* T_Identifier  */
  YYSYMBOL_T_StringConstant = 33,          /* T_StringConstant  */
  YYSYMBOL_T_IntConstant = 34,             /* T_IntConstant  */
  YYSYMBOL_T_DoubleConstant = 35,          /* T_DoubleConstant  */
  YYSYMBOL_T_BoolConstant = 36,            /* T_BoolConstant  */
  YYSYMBOL_37_ = 37,                       /* '='  */
  YYSYMBOL_38_ = 38,                       /* '<'  */
  YYSYMBOL_39_ = 39,                       /* '>'  */
  YYSYMBOL_40_ = 40,                       /* '+'  */
  YYSYMBOL_41_ = 41,                       /* '-'  */
  YYSYMBOL_42_ = 42,                       /* '*'  */
  YYSYMBOL_43_ = 43,                       /* '/'  */
  YYSYMBOL_44_ = 44,                       /* '%'  */
  YYSYMBOL_45_ = 45,                       /* '!'  */
  YYSYMBOL_UMINUS = 46,                    /* UMINUS  */
  YYSYMBOL_LOWER_THAN_ELSE = 47,           /* LOWER_THAN_ELSE  */
  YYSYMBOL_48_ = 48,                       /* '{'  */
  YYSYMBOL_49_ = 49,                       /* '}'  */
  YYSYMBOL_50_ = 50,                       /* ','  */
  YYSYMBOL_51_ = 51,                       /* '('  */
  YYSYMBOL_52_ = 52,                       /* ')'  */
  YYSYMBOL_53_ = 53,                       /* ';'  */
  YYSYMBOL_54_ = 54,                       /* '['  */
  YYSYMBOL_55_ = 55,                       /* ']'  */
  YYSYMBOL_56_ = 56,                       /* '.'  */
  YYSYMBOL_YYACCEPT = 57,                  /* $accept  */
  YYSYMBOL_Program = 58,                   /* Program  */
  YYSYMBOL_DeclList = 59,                  /* DeclList  */
  YYSYMBOL_Decl = 60,                      /* Decl  */
  YYSYMBOL_Ident = 61,                     /* Ident  */
  YYSYMBOL_ClassDecl = 62,                 /* ClassDecl  */
  YYSYMBOL_ExtendsOpt = 63,                /* ExtendsOpt  */
  YYSYMBOL_ImplementsOpt = 64,             /* ImplementsOpt  */
  YYSYMBOL_IdentList = 65,                 /* IdentList  */
  YYSYMBOL_FieldList = 66,                 /* FieldList  */
  YYSYMBOL_Field = 67,                     /* Field  */
  YYSYMBOL_InterfaceDecl = 68,             /* InterfaceDecl  */
  YYSYMBOL_PrototypeList = 69,             /* PrototypeList  */
  YYSYMBOL_Prototype = 70,                 /* Prototype  */
  YYSYMBOL_FnDecl = 71,                    /* FnDecl  */
  YYSYMBOL_FormalsOpt = 72,                /* FormalsOpt  */
  YYSYMBOL_Formals = 73,                   /* Formals  */
  YYSYMBOL_VarDecl = 74,                   /* VarDecl  */
  YYSYMBOL_Variable = 75,                  /* Variable  */
  YYSYMBOL_Type = 76,                      /* Type  */
  YYSYMBOL_StmtBlock = 77,                 /* StmtBlock  */
  YYSYMBOL_BlockItems = 78,                /* BlockItems  */
  YYSYMBOL_Stmt = 79,                      /* Stmt  */
  YYSYMBOL_IfStmt = 80,                    /* IfStmt  */
  YYSYMBOL_WhileStmt = 81,                 /* WhileStmt  */
  YYSYMBOL_ExprOpt = 82,                   /* ExprOpt  */
  YYSYMBOL_ForStmt = 83,                   /* ForStmt  */
  YYSYMBOL_BreakStmt = 84,                 /* BreakStmt  */
  YYSYMBOL_ReturnStmt = 85,                /* ReturnStmt  */
  YYSYMBOL_PrintStmt = 86,                 /* PrintStmt  */
  YYSYMBOL_ActualsOpt = 87,                /* ActualsOpt  */
  YYSYMBOL_Actuals = 88,                   /* Actuals  */
  YYSYMBOL_Expr = 89,                      /* Expr  */
  YYSYMBOL_AssignExpr = 90,                /* AssignExpr  */
  YYSYMBOL_OrExpr = 91,                    /* OrExpr  */
  YYSYMBOL_AndExpr = 92,                   /* AndExpr  */
  YYSYMBOL_EqExpr = 93,                    /* EqExpr  */
  YYSYMBOL_RelExpr = 94,                   /* RelExpr  */
  YYSYMBOL_AddExpr = 95,                   /* AddExpr  */
  YYSYMBOL_MulExpr = 96,                   /* MulExpr  */
  YYSYMBOL_UnaryExpr = 97,                 /* UnaryExpr  */
  YYSYMBOL_PostfixExpr = 98,               /* PostfixExpr  */
  YYSYMBOL_Primary = 99,                   /* Primary  */
  YYSYMBOL_Constant = 100                  /* Constant  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_uint8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL \
             && defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
  YYLTYPE yyls_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE) \
             + YYSIZEOF (YYLTYPE)) \
      + 2 * YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  22
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   260

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  57
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  44
/* YYNRULES -- Number of rules.  */
#define YYNRULES  109
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  205

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   293


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    45,     2,     2,     2,    44,     2,     2,
      51,    52,    42,    40,    50,    41,    56,    43,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    53,
      38,    37,    39,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    54,     2,    55,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    48,     2,    49,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    46,    47
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,   117,   117,   126,   127,   128,   131,   132,   133,   134,
     137,   140,   144,   145,   149,   150,   153,   154,   157,   158,
     161,   162,   166,   171,   172,   175,   177,   181,   186,   193,
     194,   197,   198,   201,   204,   207,   208,   209,   210,   211,
     212,   215,   223,   224,   225,   228,   229,   230,   231,   232,
     233,   234,   235,   238,   240,   244,   248,   249,   252,   256,
     259,   260,   263,   268,   269,   272,   273,   276,   279,   281,
     284,   285,   288,   289,   292,   293,   294,   297,   298,   299,
     300,   301,   304,   305,   306,   309,   310,   311,   312,   315,
     316,   317,   321,   322,   323,   325,   329,   331,   332,   333,
     334,   336,   337,   338,   339,   342,   343,   344,   345,   346
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "T_Void", "T_Bool",
  "T_Int", "T_Double", "T_String", "T_Class", "T_LessEqual",
  "T_GreaterEqual", "T_Equal", "T_NotEqual", "T_Dims", "T_And", "T_Or",
  "T_Null", "T_Extends", "T_This", "T_Interface", "T_Implements",
  "T_While", "T_For", "T_If", "T_Else", "T_Return", "T_Break", "T_New",
  "T_NewArray", "T_Print", "T_ReadInteger", "T_ReadLine", "T_Identifier",
  "T_StringConstant", "T_IntConstant", "T_DoubleConstant",
  "T_BoolConstant", "'='", "'<'", "'>'", "'+'", "'-'", "'*'", "'/'", "'%'",
  "'!'", "UMINUS", "LOWER_THAN_ELSE", "'{'", "'}'", "','", "'('", "')'",
  "';'", "'['", "']'", "'.'", "$accept", "Program", "DeclList", "Decl",
  "Ident", "ClassDecl", "ExtendsOpt", "ImplementsOpt", "IdentList",
  "FieldList", "Field", "InterfaceDecl", "PrototypeList", "Prototype",
  "FnDecl", "FormalsOpt", "Formals", "VarDecl", "Variable", "Type",
  "StmtBlock", "BlockItems", "Stmt", "IfStmt", "WhileStmt", "ExprOpt",
  "ForStmt", "BreakStmt", "ReturnStmt", "PrintStmt", "ActualsOpt",
  "Actuals", "Expr", "AssignExpr", "OrExpr", "AndExpr", "EqExpr",
  "RelExpr", "AddExpr", "MulExpr", "UnaryExpr", "PostfixExpr", "Primary",
  "Constant", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-175)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-11)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
      96,   -20,  -175,  -175,  -175,  -175,   -20,   -20,  -175,    17,
      96,  -175,  -175,  -175,  -175,  -175,  -175,   -29,    -5,   -19,
      21,     6,  -175,  -175,  -175,  -175,    11,   106,   -20,    37,
    -175,   106,    34,    46,  -175,    -5,  -175,   -20,    78,    15,
      79,    86,   106,  -175,  -175,   104,  -175,   -20,  -175,  -175,
      -5,    86,  -175,  -175,  -175,   -20,    84,   113,   115,  -175,
     114,  -175,  -175,  -175,  -175,  -175,   106,   106,  -175,  -175,
     118,   131,   132,   140,   133,   136,   137,   138,   143,   147,
      -7,  -175,  -175,  -175,  -175,   196,   196,  -175,   196,  -175,
    -175,  -175,  -175,  -175,  -175,  -175,  -175,  -175,   158,  -175,
     142,   199,   111,    59,   120,   109,  -175,    -3,  -175,  -175,
     164,   165,   196,   196,   196,   167,  -175,   168,  -175,   -20,
     196,   196,   181,   182,   196,  -175,    51,  -175,   183,  -175,
     196,   196,   196,   196,   196,   196,   196,   196,   196,   196,
     196,   196,   196,   196,   196,   188,   185,   186,   184,   187,
    -175,   190,  -175,   191,   194,   193,   198,  -175,  -175,  -175,
     197,  -175,   199,   111,    59,    59,   120,   120,   120,   120,
     109,   109,  -175,  -175,  -175,  -175,   195,   200,  -175,  -175,
     174,   196,   174,  -175,   106,   201,   196,  -175,  -175,   196,
    -175,   202,   222,    -2,  -175,  -175,   204,   196,   174,  -175,
    -175,   205,  -175,   174,  -175
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       5,     0,    37,    35,    36,    38,     0,     0,    10,     0,
       2,     4,    39,     8,     9,     7,     6,     0,     0,     0,
      13,     0,     1,     3,    33,    40,    34,    30,     0,    15,
      24,    30,     0,    29,    32,     0,    12,     0,     0,     0,
       0,     0,     0,    34,    17,    14,    19,     0,    22,    23,
       0,     0,    44,    28,    31,     0,     0,     0,     0,    27,
       0,    16,    11,    18,    21,    20,    30,    30,   109,   103,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     104,   108,   105,   106,   107,     0,     0,    41,     0,    42,
      52,    43,    46,    47,    48,    49,    50,    51,     0,    67,
      69,    71,    73,    76,    81,    84,    88,    91,    92,   102,
       0,     0,     0,    57,     0,   104,    61,     0,    59,     0,
       0,    64,     0,     0,    64,    89,    91,    90,     0,    45,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      56,     0,    60,     0,     0,     0,    63,    66,    97,    98,
       0,   101,    70,    72,    74,    75,    79,    80,    77,    78,
      82,    83,    85,    86,    87,    68,     0,    95,    26,    25,
       0,    57,     0,    99,     0,     0,     0,    96,    93,    64,
      55,     0,    53,     0,    62,    65,     0,    57,     0,   100,
      94,     0,    54,     0,    58
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -175,  -175,  -175,   242,     8,  -175,  -175,  -175,  -175,  -175,
    -175,  -175,  -175,  -175,   203,    -1,  -175,   -23,     4,     0,
     -38,  -175,   -74,  -175,  -175,  -174,  -175,  -175,  -175,  -175,
    -122,  -175,   -72,   110,  -175,   128,   129,    45,   -42,    41,
     -81,   -57,  -175,  -175
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_uint8 yydefgoto[] =
{
       0,     9,    10,    11,    12,    13,    29,    38,    45,    56,
      63,    14,    39,    49,    15,    32,    33,    16,    17,    35,
      90,    60,    91,    92,    93,   149,    94,    95,    96,    97,
     155,   156,    98,    99,   100,   101,   102,   103,   104,   105,
     106,   107,   108,   109
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      18,   117,   160,    53,   125,   127,   -10,   191,    25,    19,
      18,    25,     8,    59,    20,    21,   128,    22,    47,     2,
       3,     4,     5,   201,    24,   -10,    26,     8,   126,   126,
      40,    34,    27,    65,   143,    34,    36,    89,    28,    50,
     148,   150,   151,    43,   124,    44,    54,     8,   154,   157,
     199,   144,   157,   145,    30,    57,    18,    37,    58,   172,
     173,   174,    31,    61,    48,   110,   111,   196,   134,   135,
      34,    34,   176,   126,   126,   126,   126,   126,   126,   126,
     126,   126,   126,   126,   126,   126,    41,     1,     2,     3,
       4,     5,   166,   167,   168,   169,    42,   136,   137,     1,
       2,     3,     4,     5,     6,   144,   190,   145,   192,   150,
       2,     3,     4,     5,   195,     7,     8,   157,     2,     3,
       4,     5,   132,   133,   202,   150,    46,   153,     8,   204,
      68,    51,    69,    62,    52,    70,    71,    72,     8,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    82,    83,
      84,   140,   141,   142,    55,    85,    68,   130,    69,    86,
     138,   139,    52,    87,    66,    88,    67,    75,    76,   112,
      78,    79,   115,    81,    82,    83,    84,   164,   165,   170,
     171,    85,   113,   114,   193,    86,   118,   119,   120,   121,
      68,    88,    69,   116,   122,    70,    71,    72,   123,    73,
      74,    75,    76,    77,    78,    79,   115,    81,    82,    83,
      84,   129,    68,   131,    69,    85,   146,   147,   124,    86,
     177,   152,    52,    75,    76,    88,    78,    79,   115,    81,
      82,    83,    84,   158,   159,   161,   180,    85,   178,   179,
     181,    86,   182,   183,   184,   185,   198,    88,   186,   187,
     188,   189,    23,   175,   194,   197,   200,   203,   162,    64,
     163
};

static const yytype_uint8 yycheck[] =
{
       0,    73,   124,    41,    85,    86,    13,   181,    13,     1,
      10,    13,    32,    51,     6,     7,    88,     0,     3,     4,
       5,     6,     7,   197,    53,    32,    18,    32,    85,    86,
      31,    27,    51,    56,    37,    31,    28,    60,    17,    39,
     112,   113,   114,    35,    51,    37,    42,    32,   120,   121,
      52,    54,   124,    56,    48,    47,    56,    20,    50,   140,
     141,   142,    51,    55,    49,    66,    67,   189,     9,    10,
      66,    67,   144,   130,   131,   132,   133,   134,   135,   136,
     137,   138,   139,   140,   141,   142,    52,     3,     4,     5,
       6,     7,   134,   135,   136,   137,    50,    38,    39,     3,
       4,     5,     6,     7,     8,    54,   180,    56,   182,   181,
       4,     5,     6,     7,   186,    19,    32,   189,     4,     5,
       6,     7,    11,    12,   198,   197,    48,   119,    32,   203,
      16,    52,    18,    49,    48,    21,    22,    23,    32,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    42,    43,    44,    50,    41,    16,    15,    18,    45,
      40,    41,    48,    49,    51,    51,    51,    27,    28,    51,
      30,    31,    32,    33,    34,    35,    36,   132,   133,   138,
     139,    41,    51,    51,   184,    45,    53,    51,    51,    51,
      16,    51,    18,    53,    51,    21,    22,    23,    51,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    53,    16,    14,    18,    41,    52,    52,    51,    45,
      32,    53,    48,    27,    28,    51,    30,    31,    32,    33,
      34,    35,    36,    52,    52,    52,    52,    41,    53,    53,
      53,    45,    52,    52,    50,    52,    24,    51,    50,    52,
      55,    51,    10,   143,    53,    53,    52,    52,   130,    56,
     131
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     3,     4,     5,     6,     7,     8,    19,    32,    58,
      59,    60,    61,    62,    68,    71,    74,    75,    76,    61,
      61,    61,     0,    60,    53,    13,    61,    51,    17,    63,
      48,    51,    72,    73,    75,    76,    61,    20,    64,    69,
      72,    52,    50,    61,    61,    65,    48,     3,    49,    70,
      76,    52,    48,    77,    75,    50,    66,    61,    61,    77,
      78,    61,    49,    67,    71,    74,    51,    51,    16,    18,
      21,    22,    23,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    41,    45,    49,    51,    74,
      77,    79,    80,    81,    83,    84,    85,    86,    89,    90,
      91,    92,    93,    94,    95,    96,    97,    98,    99,   100,
      72,    72,    51,    51,    51,    32,    53,    89,    53,    51,
      51,    51,    51,    51,    51,    97,    98,    97,    89,    53,
      15,    14,    11,    12,     9,    10,    38,    39,    40,    41,
      42,    43,    44,    37,    54,    56,    52,    52,    89,    82,
      89,    89,    53,    61,    89,    87,    88,    89,    52,    52,
      87,    52,    92,    93,    94,    94,    95,    95,    95,    95,
      96,    96,    97,    97,    97,    90,    89,    32,    53,    53,
      52,    53,    52,    52,    50,    52,    50,    52,    55,    51,
      79,    82,    79,    76,    53,    89,    87,    53,    24,    52,
      52,    82,    79,    52,    79
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    57,    58,    59,    59,    59,    60,    60,    60,    60,
      61,    62,    63,    63,    64,    64,    65,    65,    66,    66,
      67,    67,    68,    69,    69,    70,    70,    71,    71,    72,
      72,    73,    73,    74,    75,    76,    76,    76,    76,    76,
      76,    77,    78,    78,    78,    79,    79,    79,    79,    79,
      79,    79,    79,    80,    80,    81,    82,    82,    83,    84,
      85,    85,    86,    87,    87,    88,    88,    89,    90,    90,
      91,    91,    92,    92,    93,    93,    93,    94,    94,    94,
      94,    94,    95,    95,    95,    96,    96,    96,    96,    97,
      97,    97,    98,    98,    98,    98,    99,    99,    99,    99,
      99,    99,    99,    99,    99,   100,   100,   100,   100,   100
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     2,     1,     0,     1,     1,     1,     1,
       1,     7,     2,     0,     2,     0,     3,     1,     2,     0,
       1,     1,     5,     2,     0,     6,     6,     6,     6,     1,
       0,     3,     1,     2,     2,     1,     1,     1,     1,     1,
       2,     3,     2,     2,     0,     2,     1,     1,     1,     1,
       1,     1,     1,     5,     7,     5,     1,     0,     9,     2,
       3,     2,     5,     1,     0,     3,     1,     1,     3,     1,
       3,     1,     3,     1,     3,     3,     1,     3,     3,     3,
       3,     1,     3,     3,     1,     3,     3,     3,     1,     2,
       2,     1,     1,     4,     6,     3,     4,     3,     3,     4,
       6,     3,     1,     1,     1,     1,     1,     1,     1,     1
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF

/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)                                \
    do                                                                  \
      if (N)                                                            \
        {                                                               \
          (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;        \
          (Current).first_column = YYRHSLOC (Rhs, 1).first_column;      \
          (Current).last_line    = YYRHSLOC (Rhs, N).last_line;         \
          (Current).last_column  = YYRHSLOC (Rhs, N).last_column;       \
        }                                                               \
      else                                                              \
        {                                                               \
          (Current).first_line   = (Current).last_line   =              \
            YYRHSLOC (Rhs, 0).last_line;                                \
          (Current).first_column = (Current).last_column =              \
            YYRHSLOC (Rhs, 0).last_column;                              \
        }                                                               \
    while (0)
#endif

#define YYRHSLOC(Rhs, K) ((Rhs)[K])


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)


/* YYLOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

# ifndef YYLOCATION_PRINT

#  if defined YY_LOCATION_PRINT

   /* Temporary convenience wrapper in case some people defined the
      undocumented and private YY_LOCATION_PRINT macros.  */
#   define YYLOCATION_PRINT(File, Loc)  YY_LOCATION_PRINT(File, *(Loc))

#  elif defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL

/* Print *YYLOCP on YYO.  Private, do not rely on its existence. */

YY_ATTRIBUTE_UNUSED
static int
yy_location_print_ (FILE *yyo, YYLTYPE const * const yylocp)
{
  int res = 0;
  int end_col = 0 != yylocp->last_column ? yylocp->last_column - 1 : 0;
  if (0 <= yylocp->first_line)
    {
      res += YYFPRINTF (yyo, "%d", yylocp->first_line);
      if (0 <= yylocp->first_column)
        res += YYFPRINTF (yyo, ".%d", yylocp->first_column);
    }
  if (0 <= yylocp->last_line)
    {
      if (yylocp->first_line < yylocp->last_line)
        {
          res += YYFPRINTF (yyo, "-%d", yylocp->last_line);
          if (0 <= end_col)
            res += YYFPRINTF (yyo, ".%d", end_col);
        }
      else if (0 <= end_col && yylocp->first_column < end_col)
        res += YYFPRINTF (yyo, "-%d", end_col);
    }
  return res;
}

#   define YYLOCATION_PRINT  yy_location_print_

    /* Temporary convenience wrapper in case some people defined the
       undocumented and private YY_LOCATION_PRINT macros.  */
#   define YY_LOCATION_PRINT(File, Loc)  YYLOCATION_PRINT(File, &(Loc))

#  else

#   define YYLOCATION_PRINT(File, Loc) ((void) 0)
    /* Temporary convenience wrapper in case some people defined the
       undocumented and private YY_LOCATION_PRINT macros.  */
#   define YY_LOCATION_PRINT  YYLOCATION_PRINT

#  endif
# endif /* !defined YYLOCATION_PRINT */


# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value, Location); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  YY_USE (yylocationp);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  YYLOCATION_PRINT (yyo, yylocationp);
  YYFPRINTF (yyo, ": ");
  yy_symbol_value_print (yyo, yykind, yyvaluep, yylocationp);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp, YYLTYPE *yylsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)],
                       &(yylsp[(yyi + 1) - (yynrhs)]));
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, yylsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep, YYLTYPE *yylocationp)
{
  YY_USE (yyvaluep);
  YY_USE (yylocationp);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Location data for the lookahead symbol.  */
YYLTYPE yylloc
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
  = { 1, 1, 1, 1 }
# endif
;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

    /* The location stack: array, bottom, top.  */
    YYLTYPE yylsa[YYINITDEPTH];
    YYLTYPE *yyls = yylsa;
    YYLTYPE *yylsp = yyls;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;
  YYLTYPE yyloc;

  /* The locations where the error started and ended.  */
  YYLTYPE yyerror_range[3];



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N), yylsp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  yylsp[0] = yylloc;
  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;
        YYLTYPE *yyls1 = yyls;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yyls1, yysize * YYSIZEOF (*yylsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
        yyls = yyls1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
        YYSTACK_RELOCATE (yyls_alloc, yyls);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;
      yylsp = yyls + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      yyerror_range[1] = yylloc;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END
  *++yylsp = yylloc;

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];

  /* Default location. */
  YYLLOC_DEFAULT (yyloc, (yylsp - yylen), yylen);
  yyerror_range[1] = yyloc;
  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2: /* Program: DeclList  */
#line 117 "parser.y"
                                   { 
                                      (yylsp[0]); 
                                      Program *program = new Program((yyvsp[0].declList));
                                      // if no errors, advance to next phase
                                      if (ReportError::NumErrors() == 0) 
                                          program->Check(); 
                                    }
#line 1620 "y.tab.c"
    break;

  case 3: /* DeclList: DeclList Decl  */
#line 126 "parser.y"
                                   { ((yyval.declList)=(yyvsp[-1].declList))->Append((yyvsp[0].decl)); }
#line 1626 "y.tab.c"
    break;

  case 4: /* DeclList: Decl  */
#line 127 "parser.y"
                                   { ((yyval.declList) = new List<Decl*>)->Append((yyvsp[0].decl)); }
#line 1632 "y.tab.c"
    break;

  case 5: /* DeclList: %empty  */
#line 128 "parser.y"
                                   { (yyval.declList) = new List<Decl*>; }
#line 1638 "y.tab.c"
    break;

  case 6: /* Decl: VarDecl  */
#line 131 "parser.y"
                                   { (yyval.decl) = (yyvsp[0].varDecl); }
#line 1644 "y.tab.c"
    break;

  case 7: /* Decl: FnDecl  */
#line 132 "parser.y"
                                   { (yyval.decl) = (yyvsp[0].fnDecl); }
#line 1650 "y.tab.c"
    break;

  case 8: /* Decl: ClassDecl  */
#line 133 "parser.y"
                                   { (yyval.decl) = (yyvsp[0].classDecl); }
#line 1656 "y.tab.c"
    break;

  case 9: /* Decl: InterfaceDecl  */
#line 134 "parser.y"
                                   { (yyval.decl) = (yyvsp[0].interfaceDecl); }
#line 1662 "y.tab.c"
    break;

  case 10: /* Ident: T_Identifier  */
#line 137 "parser.y"
                                   { (yyval.identifierObj) = NewIdentifier((yylsp[0]), (yyvsp[0].identifier)); }
#line 1668 "y.tab.c"
    break;

  case 11: /* ClassDecl: T_Class Ident ExtendsOpt ImplementsOpt '{' FieldList '}'  */
#line 141 "parser.y"
            { (yyval.classDecl) = new ClassDecl((yyvsp[-5].identifierObj), (yyvsp[-4].namedType), (yyvsp[-3].namedTypeList), (yyvsp[-1].declList)); }
#line 1674 "y.tab.c"
    break;

  case 12: /* ExtendsOpt: T_Extends Ident  */
#line 144 "parser.y"
                                   { (yyval.namedType) = new NamedType((yyvsp[0].identifierObj)); }
#line 1680 "y.tab.c"
    break;

  case 13: /* ExtendsOpt: %empty  */
#line 145 "parser.y"
                                   { (yyval.namedType) = NULL; }
#line 1686 "y.tab.c"
    break;

  case 14: /* ImplementsOpt: T_Implements IdentList  */
#line 149 "parser.y"
                                   { (yyval.namedTypeList) = (yyvsp[0].namedTypeList); }
#line 1692 "y.tab.c"
    break;

  case 15: /* ImplementsOpt: %empty  */
#line 150 "parser.y"
                                   { (yyval.namedTypeList) = new List<NamedType*>; }
#line 1698 "y.tab.c"
    break;

  case 16: /* IdentList: IdentList ',' Ident  */
#line 153 "parser.y"
                                   { ((yyval.namedTypeList)=(yyvsp[-2].namedTypeList))->Append(new NamedType((yyvsp[0].identifierObj))); }
#line 1704 "y.tab.c"
    break;

  case 17: /* IdentList: Ident  */
#line 154 "parser.y"
                                   { ((yyval.namedTypeList) = new List<NamedType*>)->Append(new NamedType((yyvsp[0].identifierObj))); }
#line 1710 "y.tab.c"
    break;

  case 18: /* FieldList: FieldList Field  */
#line 157 "parser.y"
                                   { ((yyval.declList)=(yyvsp[-1].declList))->Append((yyvsp[0].decl)); }
#line 1716 "y.tab.c"
    break;

  case 19: /* FieldList: %empty  */
#line 158 "parser.y"
                                   { (yyval.declList) = new List<Decl*>; }
#line 1722 "y.tab.c"
    break;

  case 20: /* Field: VarDecl  */
#line 161 "parser.y"
                                   { (yyval.decl) = (yyvsp[0].varDecl); }
#line 1728 "y.tab.c"
    break;

  case 21: /* Field: FnDecl  */
#line 162 "parser.y"
                                   { (yyval.decl) = (yyvsp[0].fnDecl); }
#line 1734 "y.tab.c"
    break;

  case 22: /* InterfaceDecl: T_Interface Ident '{' PrototypeList '}'  */
#line 167 "parser.y"
            { (yyval.interfaceDecl) = new InterfaceDecl((yyvsp[-3].identifierObj), (yyvsp[-1].declList)); }
#line 1740 "y.tab.c"
    break;

  case 23: /* PrototypeList: PrototypeList Prototype  */
#line 171 "parser.y"
                                    { ((yyval.declList)=(yyvsp[-1].declList))->Append((yyvsp[0].decl)); }
#line 1746 "y.tab.c"
    break;

  case 24: /* PrototypeList: %empty  */
#line 172 "parser.y"
                                    { (yyval.declList) = new List<Decl*>; }
#line 1752 "y.tab.c"
    break;

  case 25: /* Prototype: Type Ident '(' FormalsOpt ')' ';'  */
#line 176 "parser.y"
            { (yyval.decl) = new FnDecl((yyvsp[-4].identifierObj), (yyvsp[-5].type), (yyvsp[-2].varDeclList)); }
#line 1758 "y.tab.c"
    break;

  case 26: /* Prototype: T_Void Ident '(' FormalsOpt ')' ';'  */
#line 178 "parser.y"
            { (yyval.decl) = new FnDecl((yyvsp[-4].identifierObj), Type::voidType, (yyvsp[-2].varDeclList)); }
#line 1764 "y.tab.c"
    break;

  case 27: /* FnDecl: Type Ident '(' FormalsOpt ')' StmtBlock  */
#line 182 "parser.y"
            {
                (yyval.fnDecl) = new FnDecl((yyvsp[-4].identifierObj), (yyvsp[-5].type), (yyvsp[-2].varDeclList));
                (yyval.fnDecl)->SetFunctionBody((yyvsp[0].stmtBlock));
            }
#line 1773 "y.tab.c"
    break;

  case 28: /* FnDecl: T_Void Ident '(' FormalsOpt ')' StmtBlock  */
#line 187 "parser.y"
            {
                (yyval.fnDecl) = new FnDecl((yyvsp[-4].identifierObj), Type::voidType, (yyvsp[-2].varDeclList));
                (yyval.fnDecl)->SetFunctionBody((yyvsp[0].stmtBlock));
            }
#line 1782 "y.tab.c"
    break;

  case 29: /* FormalsOpt: Formals  */
#line 193 "parser.y"
                                   { (yyval.varDeclList) = (yyvsp[0].varDeclList); }
#line 1788 "y.tab.c"
    break;

  case 30: /* FormalsOpt: %empty  */
#line 194 "parser.y"
                                   { (yyval.varDeclList) = new List<VarDecl*>; }
#line 1794 "y.tab.c"
    break;

  case 31: /* Formals: Formals ',' Variable  */
#line 197 "parser.y"
                                   { ((yyval.varDeclList)=(yyvsp[-2].varDeclList))->Append((yyvsp[0].varDecl)); }
#line 1800 "y.tab.c"
    break;

  case 32: /* Formals: Variable  */
#line 198 "parser.y"
                                   { ((yyval.varDeclList) = new List<VarDecl*>)->Append((yyvsp[0].varDecl)); }
#line 1806 "y.tab.c"
    break;

  case 33: /* VarDecl: Variable ';'  */
#line 201 "parser.y"
                                   { (yyval.varDecl) = (yyvsp[-1].varDecl); }
#line 1812 "y.tab.c"
    break;

  case 34: /* Variable: Type Ident  */
#line 204 "parser.y"
                                   { (yyval.varDecl) = new VarDecl((yyvsp[0].identifierObj), (yyvsp[-1].type)); }
#line 1818 "y.tab.c"
    break;

  case 35: /* Type: T_Int  */
#line 207 "parser.y"
                                   { (yyval.type) = Type::intType; }
#line 1824 "y.tab.c"
    break;

  case 36: /* Type: T_Double  */
#line 208 "parser.y"
                                   { (yyval.type) = Type::doubleType; }
#line 1830 "y.tab.c"
    break;

  case 37: /* Type: T_Bool  */
#line 209 "parser.y"
                                   { (yyval.type) = Type::boolType; }
#line 1836 "y.tab.c"
    break;

  case 38: /* Type: T_String  */
#line 210 "parser.y"
                                   { (yyval.type) = Type::stringType; }
#line 1842 "y.tab.c"
    break;

  case 39: /* Type: Ident  */
#line 211 "parser.y"
                                   { (yyval.type) = new NamedType((yyvsp[0].identifierObj)); }
#line 1848 "y.tab.c"
    break;

  case 40: /* Type: Type T_Dims  */
#line 212 "parser.y"
                                   { (yyval.type) = new ArrayType(Join((yylsp[-1]), (yylsp[0])), (yyvsp[-1].type)); }
#line 1854 "y.tab.c"
    break;

  case 41: /* StmtBlock: '{' BlockItems '}'  */
#line 216 "parser.y"
            {
                (yyval.stmtBlock) = new StmtBlock((yyvsp[-1].block)->decls, (yyvsp[-1].block)->stmts);
                delete (yyvsp[-1].block);
            }
#line 1863 "y.tab.c"
    break;

  case 42: /* BlockItems: BlockItems VarDecl  */
#line 223 "parser.y"
                                   { (yyval.block) = (yyvsp[-1].block); (yyval.block)->decls->Append((yyvsp[0].varDecl)); }
#line 1869 "y.tab.c"
    break;

  case 43: /* BlockItems: BlockItems Stmt  */
#line 224 "parser.y"
                                   { (yyval.block) = (yyvsp[-1].block); (yyval.block)->stmts->Append((yyvsp[0].stmt)); }
#line 1875 "y.tab.c"
    break;

  case 44: /* BlockItems: %empty  */
#line 225 "parser.y"
                                   { (yyval.block) = new BlockComponents(); }
#line 1881 "y.tab.c"
    break;

  case 45: /* Stmt: Expr ';'  */
#line 228 "parser.y"
                                   { (yyval.stmt) = (yyvsp[-1].expr); }
#line 1887 "y.tab.c"
    break;

  case 52: /* Stmt: StmtBlock  */
#line 235 "parser.y"
                                   { (yyval.stmt) = (yyvsp[0].stmtBlock); }
#line 1893 "y.tab.c"
    break;

  case 53: /* IfStmt: T_If '(' Expr ')' Stmt  */
#line 239 "parser.y"
            { (yyval.stmt) = new IfStmt((yyvsp[-2].expr), (yyvsp[0].stmt), NULL); }
#line 1899 "y.tab.c"
    break;

  case 54: /* IfStmt: T_If '(' Expr ')' Stmt T_Else Stmt  */
#line 241 "parser.y"
            { (yyval.stmt) = new IfStmt((yyvsp[-4].expr), (yyvsp[-2].stmt), (yyvsp[0].stmt)); }
#line 1905 "y.tab.c"
    break;

  case 55: /* WhileStmt: T_While '(' Expr ')' Stmt  */
#line 245 "parser.y"
            { (yyval.stmt) = new WhileStmt((yyvsp[-2].expr), (yyvsp[0].stmt)); }
#line 1911 "y.tab.c"
    break;

  case 56: /* ExprOpt: Expr  */
#line 248 "parser.y"
                                   { (yyval.expr) = (yyvsp[0].expr); }
#line 1917 "y.tab.c"
    break;

  case 57: /* ExprOpt: %empty  */
#line 249 "parser.y"
                                   { (yyval.expr) = new EmptyExpr(); }
#line 1923 "y.tab.c"
    break;

  case 58: /* ForStmt: T_For '(' ExprOpt ';' ExprOpt ';' ExprOpt ')' Stmt  */
#line 253 "parser.y"
            { (yyval.stmt) = new ForStmt((yyvsp[-6].expr), (yyvsp[-4].expr), (yyvsp[-2].expr), (yyvsp[0].stmt)); }
#line 1929 "y.tab.c"
    break;

  case 59: /* BreakStmt: T_Break ';'  */
#line 256 "parser.y"
                                   { (yyval.stmt) = new BreakStmt((yylsp[-1])); }
#line 1935 "y.tab.c"
    break;

  case 60: /* ReturnStmt: T_Return Expr ';'  */
#line 259 "parser.y"
                                   { (yyval.stmt) = new ReturnStmt((yylsp[-1]), (yyvsp[-1].expr)); }
#line 1941 "y.tab.c"
    break;

  case 61: /* ReturnStmt: T_Return ';'  */
#line 260 "parser.y"
                                   { (yyval.stmt) = new ReturnStmt((yylsp[-1]), new EmptyExpr()); }
#line 1947 "y.tab.c"
    break;

  case 62: /* PrintStmt: T_Print '(' ActualsOpt ')' ';'  */
#line 264 "parser.y"
            { (yyval.stmt) = new PrintStmt((yyvsp[-2].exprList)); }
#line 1953 "y.tab.c"
    break;

  case 63: /* ActualsOpt: Actuals  */
#line 268 "parser.y"
                                   { (yyval.exprList) = (yyvsp[0].exprList); }
#line 1959 "y.tab.c"
    break;

  case 64: /* ActualsOpt: %empty  */
#line 269 "parser.y"
                                   { (yyval.exprList) = new List<Expr*>; }
#line 1965 "y.tab.c"
    break;

  case 65: /* Actuals: Actuals ',' Expr  */
#line 272 "parser.y"
                                   { ((yyval.exprList)=(yyvsp[-2].exprList))->Append((yyvsp[0].expr)); }
#line 1971 "y.tab.c"
    break;

  case 66: /* Actuals: Expr  */
#line 273 "parser.y"
                                   { ((yyval.exprList) = new List<Expr*>)->Append((yyvsp[0].expr)); }
#line 1977 "y.tab.c"
    break;

  case 67: /* Expr: AssignExpr  */
#line 276 "parser.y"
                                   { (yyval.expr) = (yyvsp[0].expr); }
#line 1983 "y.tab.c"
    break;

  case 68: /* AssignExpr: PostfixExpr '=' AssignExpr  */
#line 280 "parser.y"
                                  { (yyval.expr) = new AssignExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), "="), (yyvsp[0].expr)); }
#line 1989 "y.tab.c"
    break;

  case 69: /* AssignExpr: OrExpr  */
#line 281 "parser.y"
                                   { (yyval.expr) = (yyvsp[0].expr); }
#line 1995 "y.tab.c"
    break;

  case 70: /* OrExpr: OrExpr T_Or AndExpr  */
#line 284 "parser.y"
                                   { (yyval.expr) = new LogicalExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), "||"), (yyvsp[0].expr)); }
#line 2001 "y.tab.c"
    break;

  case 71: /* OrExpr: AndExpr  */
#line 285 "parser.y"
                                   { (yyval.expr) = (yyvsp[0].expr); }
#line 2007 "y.tab.c"
    break;

  case 72: /* AndExpr: AndExpr T_And EqExpr  */
#line 288 "parser.y"
                                   { (yyval.expr) = new LogicalExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), "&&"), (yyvsp[0].expr)); }
#line 2013 "y.tab.c"
    break;

  case 73: /* AndExpr: EqExpr  */
#line 289 "parser.y"
                                   { (yyval.expr) = (yyvsp[0].expr); }
#line 2019 "y.tab.c"
    break;

  case 74: /* EqExpr: EqExpr T_Equal RelExpr  */
#line 292 "parser.y"
                                       { (yyval.expr) = new EqualityExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), "=="), (yyvsp[0].expr)); }
#line 2025 "y.tab.c"
    break;

  case 75: /* EqExpr: EqExpr T_NotEqual RelExpr  */
#line 293 "parser.y"
                                       { (yyval.expr) = new EqualityExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), "!="), (yyvsp[0].expr)); }
#line 2031 "y.tab.c"
    break;

  case 76: /* EqExpr: RelExpr  */
#line 294 "parser.y"
                                       { (yyval.expr) = (yyvsp[0].expr); }
#line 2037 "y.tab.c"
    break;

  case 77: /* RelExpr: RelExpr '<' AddExpr  */
#line 297 "parser.y"
                                          { (yyval.expr) = new RelationalExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), "<"), (yyvsp[0].expr)); }
#line 2043 "y.tab.c"
    break;

  case 78: /* RelExpr: RelExpr '>' AddExpr  */
#line 298 "parser.y"
                                          { (yyval.expr) = new RelationalExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), ">"), (yyvsp[0].expr)); }
#line 2049 "y.tab.c"
    break;

  case 79: /* RelExpr: RelExpr T_LessEqual AddExpr  */
#line 299 "parser.y"
                                          { (yyval.expr) = new RelationalExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), "<="), (yyvsp[0].expr)); }
#line 2055 "y.tab.c"
    break;

  case 80: /* RelExpr: RelExpr T_GreaterEqual AddExpr  */
#line 300 "parser.y"
                                          { (yyval.expr) = new RelationalExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), ">="), (yyvsp[0].expr)); }
#line 2061 "y.tab.c"
    break;

  case 81: /* RelExpr: AddExpr  */
#line 301 "parser.y"
                                          { (yyval.expr) = (yyvsp[0].expr); }
#line 2067 "y.tab.c"
    break;

  case 82: /* AddExpr: AddExpr '+' MulExpr  */
#line 304 "parser.y"
                                     { (yyval.expr) = new ArithmeticExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), "+"), (yyvsp[0].expr)); }
#line 2073 "y.tab.c"
    break;

  case 83: /* AddExpr: AddExpr '-' MulExpr  */
#line 305 "parser.y"
                                     { (yyval.expr) = new ArithmeticExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), "-"), (yyvsp[0].expr)); }
#line 2079 "y.tab.c"
    break;

  case 84: /* AddExpr: MulExpr  */
#line 306 "parser.y"
                                     { (yyval.expr) = (yyvsp[0].expr); }
#line 2085 "y.tab.c"
    break;

  case 85: /* MulExpr: MulExpr '*' UnaryExpr  */
#line 309 "parser.y"
                                     { (yyval.expr) = new ArithmeticExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), "*"), (yyvsp[0].expr)); }
#line 2091 "y.tab.c"
    break;

  case 86: /* MulExpr: MulExpr '/' UnaryExpr  */
#line 310 "parser.y"
                                     { (yyval.expr) = new ArithmeticExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), "/"), (yyvsp[0].expr)); }
#line 2097 "y.tab.c"
    break;

  case 87: /* MulExpr: MulExpr '%' UnaryExpr  */
#line 311 "parser.y"
                                     { (yyval.expr) = new ArithmeticExpr((yyvsp[-2].expr), new Operator((yylsp[-1]), "%"), (yyvsp[0].expr)); }
#line 2103 "y.tab.c"
    break;

  case 88: /* MulExpr: UnaryExpr  */
#line 312 "parser.y"
                                     { (yyval.expr) = (yyvsp[0].expr); }
#line 2109 "y.tab.c"
    break;

  case 89: /* UnaryExpr: '-' UnaryExpr  */
#line 315 "parser.y"
                                     { (yyval.expr) = new ArithmeticExpr(new Operator((yylsp[-1]), "-"), (yyvsp[0].expr)); }
#line 2115 "y.tab.c"
    break;

  case 90: /* UnaryExpr: '!' UnaryExpr  */
#line 316 "parser.y"
                                     { (yyval.expr) = new LogicalExpr(new Operator((yylsp[-1]), "!"), (yyvsp[0].expr)); }
#line 2121 "y.tab.c"
    break;

  case 91: /* UnaryExpr: PostfixExpr  */
#line 317 "parser.y"
                                     { (yyval.expr) = (yyvsp[0].expr); }
#line 2127 "y.tab.c"
    break;

  case 92: /* PostfixExpr: Primary  */
#line 321 "parser.y"
                                     { (yyval.expr) = (yyvsp[0].expr); }
#line 2133 "y.tab.c"
    break;

  case 93: /* PostfixExpr: PostfixExpr '[' Expr ']'  */
#line 322 "parser.y"
                                     { (yyval.expr) = new ArrayAccess(Join((yyvsp[-3].expr)->GetLocation(), &(yylsp[0])), (yyvsp[-3].expr), (yyvsp[-1].expr)); }
#line 2139 "y.tab.c"
    break;

  case 94: /* PostfixExpr: PostfixExpr '.' T_Identifier '(' ActualsOpt ')'  */
#line 324 "parser.y"
                                    { (yyval.expr) = new Call(Join((yyvsp[-5].expr)->GetLocation(), &(yylsp[0])), (yyvsp[-5].expr), new Identifier((yylsp[-3]), (yyvsp[-3].identifier)), (yyvsp[-1].exprList)); }
#line 2145 "y.tab.c"
    break;

  case 95: /* PostfixExpr: PostfixExpr '.' T_Identifier  */
#line 326 "parser.y"
                                    { (yyval.expr) = new FieldAccess((yyvsp[-2].expr), new Identifier((yylsp[0]), (yyvsp[0].identifier))); }
#line 2151 "y.tab.c"
    break;

  case 96: /* Primary: T_Identifier '(' ActualsOpt ')'  */
#line 330 "parser.y"
                                    { (yyval.expr) = new Call(Join((yylsp[-3]), (yylsp[0])), NULL, new Identifier((yylsp[-3]), (yyvsp[-3].identifier)), (yyvsp[-1].exprList)); }
#line 2157 "y.tab.c"
    break;

  case 97: /* Primary: T_ReadInteger '(' ')'  */
#line 331 "parser.y"
                                     { (yyval.expr) = new ReadIntegerExpr(Join((yylsp[-2]), (yylsp[0]))); }
#line 2163 "y.tab.c"
    break;

  case 98: /* Primary: T_ReadLine '(' ')'  */
#line 332 "parser.y"
                                     { (yyval.expr) = new ReadLineExpr(Join((yylsp[-2]), (yylsp[0]))); }
#line 2169 "y.tab.c"
    break;

  case 99: /* Primary: T_New '(' Ident ')'  */
#line 333 "parser.y"
                                     { (yyval.expr) = new NewExpr(Join((yylsp[-3]), (yylsp[0])), new NamedType((yyvsp[-1].identifierObj))); }
#line 2175 "y.tab.c"
    break;

  case 100: /* Primary: T_NewArray '(' Expr ',' Type ')'  */
#line 335 "parser.y"
                                    { (yyval.expr) = new NewArrayExpr(Join((yylsp[-5]), (yylsp[0])), (yyvsp[-3].expr), (yyvsp[-1].type)); }
#line 2181 "y.tab.c"
    break;

  case 101: /* Primary: '(' Expr ')'  */
#line 336 "parser.y"
                                     { (yyval.expr) = (yyvsp[-1].expr); }
#line 2187 "y.tab.c"
    break;

  case 102: /* Primary: Constant  */
#line 337 "parser.y"
                                     { (yyval.expr) = (yyvsp[0].expr); }
#line 2193 "y.tab.c"
    break;

  case 103: /* Primary: T_This  */
#line 338 "parser.y"
                                     { (yyval.expr) = new This((yylsp[0])); }
#line 2199 "y.tab.c"
    break;

  case 104: /* Primary: T_Identifier  */
#line 339 "parser.y"
                                     { (yyval.expr) = new FieldAccess(NULL, new Identifier((yylsp[0]), (yyvsp[0].identifier))); }
#line 2205 "y.tab.c"
    break;

  case 105: /* Constant: T_IntConstant  */
#line 342 "parser.y"
                                     { (yyval.expr) = new IntConstant((yylsp[0]), (yyvsp[0].integerConstant)); }
#line 2211 "y.tab.c"
    break;

  case 106: /* Constant: T_DoubleConstant  */
#line 343 "parser.y"
                                     { (yyval.expr) = new DoubleConstant((yylsp[0]), (yyvsp[0].doubleConstant)); }
#line 2217 "y.tab.c"
    break;

  case 107: /* Constant: T_BoolConstant  */
#line 344 "parser.y"
                                     { (yyval.expr) = new BoolConstant((yylsp[0]), (yyvsp[0].boolConstant)); }
#line 2223 "y.tab.c"
    break;

  case 108: /* Constant: T_StringConstant  */
#line 345 "parser.y"
                                     { (yyval.expr) = new StringConstant((yylsp[0]), (yyvsp[0].stringConstant)); }
#line 2229 "y.tab.c"
    break;

  case 109: /* Constant: T_Null  */
#line 346 "parser.y"
                                     { (yyval.expr) = new NullConstant((yylsp[0])); }
#line 2235 "y.tab.c"
    break;


#line 2239 "y.tab.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;
  *++yylsp = yyloc;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  yyerror_range[1] = yylloc;
  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval, &yylloc);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;

      yyerror_range[1] = *yylsp;
      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp, yylsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  yyerror_range[2] = yylloc;
  ++yylsp;
  YYLLOC_DEFAULT (*yylsp, yyerror_range, 2);

  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval, &yylloc);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp, yylsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 350 "parser.y"



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
