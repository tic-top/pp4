/* File: codegen.cc
 * ----------------
 * Implementation for the CodeGenerator class. The methods don't do anything
 * too fancy, mostly just create objects of the various Tac instruction
 * classes and append them to the list.
 */

#include "codegen.h"
#include <string.h>
#include "tac.h"
#include "mips.h"
  
CodeGenerator::CodeGenerator()
{
  code = new List<Instruction*>();
  curStackOffset = OffsetToFirstLocal;
  globalOffset = OffsetToFirstGlobal;
  loopEndLabels = new List<const char*>();
  varLocations = new Hashtable<Location*>();
  varDecls = new Hashtable<VarDecl*>();
}

char *CodeGenerator::NewLabel()
{
  static int nextLabelNum = 0;
  char temp[10];
  sprintf(temp, "_L%d", nextLabelNum++);
  return strdup(temp);
}


Location *CodeGenerator::GenTempVar()
{
  static int nextTempNum;
  char temp[10];
  sprintf(temp, "_tmp%d", nextTempNum++);
  /* pp4: create variable in proper location in stack frame for use as temporary */
  Location *result = new Location(fpRelative, curStackOffset, strdup(temp));
  curStackOffset -= VarSize;
  return result;
}

 
Location *CodeGenerator::GenLoadConstant(int value)
{
  Location *result = GenTempVar();
  code->Append(new LoadConstant(result, value));
  return result;
}

Location *CodeGenerator::GenLoadConstant(const char *s)
{
  Location *result = GenTempVar();
  code->Append(new LoadStringConstant(result, s));
  return result;
} 

Location *CodeGenerator::GenLoadLabel(const char *label)
{
  Location *result = GenTempVar();
  code->Append(new LoadLabel(result, label));
  return result;
} 


void CodeGenerator::GenAssign(Location *dst, Location *src)
{
  code->Append(new Assign(dst, src));
}


Location *CodeGenerator::GenLoad(Location *ref, int offset)
{
  Location *result = GenTempVar();
  code->Append(new Load(result, ref, offset));
  return result;
}

void CodeGenerator::GenStore(Location *dst,Location *src, int offset)
{
  code->Append(new Store(dst, src, offset));
}


Location *CodeGenerator::GenBinaryOp(const char *opName, Location *op1,
						     Location *op2)
{
  Location *result = GenTempVar();
  code->Append(new BinaryOp(BinaryOp::OpCodeForName(opName), result, op1, op2));
  return result;
}


void CodeGenerator::GenLabel(const char *label)
{
  code->Append(new Label(label));
}

void CodeGenerator::GenIfZ(Location *test, const char *label)
{
  code->Append(new IfZ(test, label));
}

void CodeGenerator::GenGoto(const char *label)
{
  code->Append(new Goto(label));
}

void CodeGenerator::GenReturn(Location *val)
{
  code->Append(new Return(val));
}


BeginFunc *CodeGenerator::GenBeginFunc()
{
  BeginFunc *result = new BeginFunc;
  code->Append(result);
  return result;
}

void CodeGenerator::GenEndFunc()
{
  code->Append(new EndFunc());
}

void CodeGenerator::GenPushParam(Location *param)
{
  code->Append(new PushParam(param));
}

void CodeGenerator::GenPopParams(int numBytesOfParams)
{
  Assert(numBytesOfParams >= 0 && numBytesOfParams % VarSize == 0); // sanity check
  if (numBytesOfParams > 0)
    code->Append(new PopParams(numBytesOfParams));
}

Location *CodeGenerator::GenLCall(const char *label, bool fnHasReturnValue)
{
  Location *result = fnHasReturnValue ? GenTempVar() : NULL;
  code->Append(new LCall(label, result));
  return result;
}

Location *CodeGenerator::GenACall(Location *fnAddr, bool fnHasReturnValue)
{
  Location *result = fnHasReturnValue ? GenTempVar() : NULL;
  code->Append(new ACall(fnAddr, result));
  return result;
}
 
 
static struct _builtin {
  const char *label;
  int numArgs;
  bool hasReturn;
} builtins[] =
 {{"_Alloc", 1, true},
  {"_ReadLine", 0, true},
  {"_ReadInteger", 0, true},
  {"_StringEqual", 2, true},
  {"_PrintInt", 1, false},
  {"_PrintString", 1, false},
  {"_PrintBool", 1, false},
  {"_Halt", 0, false}};

Location *CodeGenerator::GenBuiltInCall(BuiltIn bn,Location *arg1, Location *arg2)
{
  Assert(bn >= 0 && bn < NumBuiltIns);
  struct _builtin *b = &builtins[bn];
  Location *result = NULL;

  if (b->hasReturn) result = GenTempVar();
                // verify appropriate number of non-NULL arguments given
  Assert((b->numArgs == 0 && !arg1 && !arg2)
	|| (b->numArgs == 1 && arg1 && !arg2)
	|| (b->numArgs == 2 && arg1 && arg2));
  if (arg2) code->Append(new PushParam(arg2));
  if (arg1) code->Append(new PushParam(arg1));
  code->Append(new LCall(b->label, result));
  GenPopParams(VarSize*b->numArgs);
  return result;
}


void CodeGenerator::GenVTable(const char *className, List<const char *> *methodLabels)
{
  code->Append(new VTable(className, methodLabels));
}


void CodeGenerator::DoFinalCodeGen()
{
  if (IsDebugOn("tac")) { // if debug don't translate to mips, just print Tac
    for (int i = 0; i < code->NumElements(); i++)
	code->Nth(i)->Print();
   }  else {
     Mips mips;
     mips.EmitPreamble();
     for (int i = 0; i < code->NumElements(); i++)
	 code->Nth(i)->Emit(&mips);
     // Emit built-in function implementations
     EmitBuiltIns();
  }
}

void CodeGenerator::EmitBuiltIns()
{
    // Emit MIPS code for built-in functions
    printf("  _PrintInt:\n");
    printf("      subu $sp, $sp, 8\t# decrement sp to make space to save ra,fp\n");
    printf("      sw $fp, 8($sp)\t# save fp\n");
    printf("      sw $ra, 4($sp)\t# save ra\n");
    printf("      addiu $fp, $sp, 8\t# set up new fp\n");
    printf("      lw $a0, 4($fp)\t# fill a to $t0 from $fp+4\n");
    printf("    # LCall _PrintInt\n");
    printf("      li $v0, 1\n");
    printf("      syscall\n");
    printf("    # EndFunc\n");
    printf("    # (below handles reaching end of fn body with no explicit return)\n");
    printf("      move $sp, $fp\t\t# pop callee frame off stack\n");
    printf("      lw $ra, -4($fp)\t# restore saved ra\n");
    printf("      lw $fp, 0($fp)\t# restore saved fp\n");
    printf("      jr $ra\t\t# return from function\n");
    printf("\n");
    printf("  _ReadInteger:\n");
    printf("      subu $sp, $sp, 8\t# decrement sp to make space to save ra,fp\n");
    printf("      sw $fp, 8($sp)\t# save fp\n");
    printf("      sw $ra, 4($sp)\t# save ra\n");
    printf("      addiu $fp, $sp, 8\t# set up new fp\n");
    printf("      li $v0, 5\n");
    printf("      syscall\n");
    printf("    # EndFunc\n");
    printf("    # (below handles reaching end of fn body with no explicit return)\n");
    printf("      move $sp, $fp\t\t# pop callee frame off stack\n");
    printf("      lw $ra, -4($fp)\t# restore saved ra\n");
    printf("      lw $fp, 0($fp)\t# restore saved fp\n");
    printf("      jr $ra\t\t# return from function\n");
    printf("\n");
    printf("\n");
    printf("  _PrintBool:\n");
    printf("          subu $sp, $sp, 8      # decrement sp to make space to save ra, fp\n");
    printf("          sw $fp, 8($sp)        # save fp\n");
    printf("          sw $ra, 4($sp)        # save ra\n");
    printf("          addiu $fp, $sp, 8     # set up new fp\n");
    printf("          lw $t1, 4($fp)        # fill a from $fp+4\n");
    printf("      li $t2, 0\n");
    printf("          li $v0, 4\n");
    printf("      beq $t1, $t2, _PrintBoolFalse\n");
    printf("      la $a0, _PrintBoolTrueString\n");
    printf("      j _PrintBoolEnd\n");
    printf("    _PrintBoolFalse:\n");
    printf("    \t  la $a0, _PrintBoolFalseString\n");
    printf("    _PrintBoolEnd:\n");
    printf("          syscall\n");
    printf("        # EndFunc\n");
    printf("        # (below handles reaching end of fn body with no explicit return)\n");
    printf("          move $sp, $fp         # pop callee frame off stack\n");
    printf("          lw $ra, -4($fp)       # restore saved ra\n");
    printf("          lw $fp, 0($fp)        # restore saved fp\n");
    printf("          jr $ra                # return from function\n");
    printf("\n");
    printf("      .data\t\t\t# create string constant marked with label\n");
    printf("      _PrintBoolTrueString: .asciiz \"true\"\n");
    printf("      .text\n");
    printf("\n");
    printf("      .data\t\t\t# create string constant marked with label\n");
    printf("      _PrintBoolFalseString: .asciiz \"false\"\n");
    printf("      .text\n");
    printf("\n");
    printf("  _PrintString:\n");
    printf("          subu $sp, $sp, 8      # decrement sp to make space to save ra, fp\n");
    printf("          sw $fp, 8($sp)        # save fp\n");
    printf("          sw $ra, 4($sp)        # save ra\n");
    printf("          addiu $fp, $sp, 8     # set up new fp\n");
    printf("          lw $a0, 4($fp)        # fill a from $fp+4\n");
    printf("          li $v0, 4\n");
    printf("          syscall\n");
    printf("        # EndFunc\n");
    printf("        # (below handles reaching end of fn body with no explicit return)\n");
    printf("          move $sp, $fp         # pop callee frame off stack\n");
    printf("          lw $ra, -4($fp)       # restore saved ra\n");
    printf("          lw $fp, 0($fp)        # restore saved fp\n");
    printf("          jr $ra                # return from function\n");
    printf("\n");
    printf("  _Alloc:\n");
    printf("          subu $sp, $sp, 8      # decrement sp to make space to save ra, fp\n");
    printf("          sw $fp, 8($sp)        # save fp\n");
    printf("          sw $ra, 4($sp)        # save ra\n");
    printf("          addiu $fp, $sp, 8     # set up new fp\n");
    printf("          lw $a0, 4($fp)        # fill a from $fp+4\n");
    printf("          li $v0, 9\n");
    printf("          syscall\n");
    printf("        # EndFunc\n");
    printf("        # (below handles reaching end of fn body with no explicit return)\n");
    printf("          move $sp, $fp         # pop callee frame off stack\n");
    printf("          lw $ra, -4($fp)       # restore saved ra\n");
    printf("          lw $fp, 0($fp)        # restore saved fp\n");
    printf("          jr $ra                # return from function\n");
    printf("\n");
    printf("  _Halt:\n");
    printf("          li $v0, 10\n");
    printf("          syscall\n");
    printf("\n");
    printf("  _ReadLine:\n");
    printf("          subu $sp, $sp, 8      # decrement sp to make space to save ra, fp\n");
    printf("          sw $fp, 8($sp)        # save fp\n");
    printf("          sw $ra, 4($sp)        # save ra\n");
    printf("          addiu $fp, $sp, 8     # set up new fp\n");
    printf("          li $a0, 101\n");
    printf("          li $v0, 9\n");
    printf("          syscall\n");
    printf("          addu $a0, $v0, $zero  # copy allocated memory reference to $a0\n");
    printf("          li $a1, 101           # read 100 + null terminator\n");
    printf("          li $v0, 8             # ReadString syscall\n");
    printf("          syscall\n");
    printf("        # EndFunc\n");
    printf("        # (below handles reaching end of fn body with no explicit return)\n");
    printf("          move $sp, $fp         # pop callee frame off stack\n");
    printf("          lw $ra, -4($fp)       # restore saved ra\n");
    printf("          lw $fp, 0($fp)        # restore saved fp\n");
    printf("          jr $ra                # return from function\n");
    printf("\n");
    printf("  _StringEqual:\n");
    printf("          subu $sp, $sp, 8      # decrement sp to make space to save ra, fp\n");
    printf("          sw $fp, 8($sp)        # save fp\n");
    printf("          sw $ra, 4($sp)        # save ra\n");
    printf("          addiu $fp, $sp, 8     # set up new fp\n");
    printf("          lw $a0, 4($fp)        # fill a from $fp+4\n");
    printf("          lw $a1, 8($fp)        # fill b from $fp+8\n");
    printf("    _StringEqual_loop:\n");
    printf("          lb $t0, ($a0)\n");
    printf("          lb $t1, ($a1)\n");
    printf("          bne $t0, $t1, _StringEqual_no\n");
    printf("          beq $t0, $zero, _StringEqual_yes\n");
    printf("          addu $a0, $a0, 1\n");
    printf("          addu $a1, $a1, 1\n");
    printf("          j _StringEqual_loop\n");
    printf("    _StringEqual_yes:\n");
    printf("          li $v0, 1\n");
    printf("          j _StringEqual_done\n");
    printf("    _StringEqual_no:\n");
    printf("          li $v0, 0\n");
    printf("    _StringEqual_done:\n");
    printf("        # EndFunc\n");
    printf("        # (below handles reaching end of fn body with no explicit return)\n");
    printf("          move $sp, $fp         # pop callee frame off stack\n");
    printf("          lw $ra, -4($fp)       # restore saved ra\n");
    printf("          lw $fp, 0($fp)        # restore saved fp\n");
    printf("          jr $ra                # return from function\n");
}

void CodeGenerator::ResetLocalOffset()
{
  curStackOffset = OffsetToFirstLocal;
}

int CodeGenerator::GetCurrentLocalOffset()
{
  return curStackOffset;
}

Location *CodeGenerator::GenLocalVar(const char *name)
{
  Location *loc = new Location(fpRelative, curStackOffset, name);
  curStackOffset -= VarSize;
  return loc;
}

Location *CodeGenerator::GenGlobalVar(const char *name)
{
  Location *loc = new Location(gpRelative, globalOffset, name);
  globalOffset += VarSize;
  return loc;
}

Location *CodeGenerator::GenParamVar(const char *name, int paramIndex, bool isMethod)
{
  // For methods, first param is 'this' at fp+4, so shift normal params
  int offset = OffsetToFirstParam + (isMethod ? VarSize : 0) + paramIndex * VarSize;
  return new Location(fpRelative, offset, name);
}

void CodeGenerator::PushLoopEndLabel(const char *label)
{
  loopEndLabels->Append(label);
}

void CodeGenerator::PopLoopEndLabel()
{
  if (loopEndLabels->NumElements() > 0)
    loopEndLabels->RemoveAt(loopEndLabels->NumElements() - 1);
}

const char *CodeGenerator::GetCurrentLoopEndLabel()
{
  if (loopEndLabels->NumElements() > 0)
    return loopEndLabels->Nth(loopEndLabels->NumElements() - 1);
  return NULL;
}

void CodeGenerator::AddVariable(const char *name, Location *loc)
{
  varLocations->Enter(name, loc);
}

void CodeGenerator::AddVarDecl(const char *name, VarDecl *decl)
{
  varDecls->Enter(name, decl);
}

Location *CodeGenerator::GetVariable(const char *name)
{
  Location *loc = varLocations->Lookup(name);
  return loc;
}

VarDecl *CodeGenerator::GetVarDecl(const char *name)
{
  VarDecl *decl = varDecls->Lookup(name);
  return decl;
}

void CodeGenerator::ClearVariables()
{
  delete varLocations;
  varLocations = new Hashtable<Location*>();
  delete varDecls;
  varDecls = new Hashtable<VarDecl*>();
}


