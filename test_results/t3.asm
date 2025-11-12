	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
	# VTable for class Cow
	  .data
	  .align 2
	  Cow:		# label for class Cow vtable
	  .word _Cow.Init
	  .word _Cow.Moo
	  .text
  _Cow.Init:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 8) = w
	  lw $t0, 8($fp)	# fill w to $t0 from $fp+8
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 8($t2) 	# store with offset
	# *(this + 4) = h
	  lw $t0, 12($fp)	# fill h to $t0 from $fp+12
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 4($t2) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Cow.Moo:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp0 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# PushParam _tmp0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1 = " "
	  .data			# create string constant marked with label
	  _string1: .asciiz " "
	  .text
	  la $t2, _string1	# load label
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# PushParam _tmp1
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp2 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# PushParam _tmp2
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp3 = "\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "\n"
	  .text
	  la $t2, _string2	# load label
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  main:
	# BeginFunc 40
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 40	# decrement sp to make space for locals/temps
	# _tmp4 = 12
	  li $t2, 12		# load constant value 12 into $t2
	  sw $t2, -12($fp)	# spill _tmp4 from $t2 to $fp-12
	# PushParam _tmp4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp4 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp5 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -16($fp)	# spill _tmp5 from $t2 to $fp-16
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp6 = Cow
	  la $t2, Cow	# load label
	  sw $t2, -20($fp)	# spill _tmp6 from $t2 to $fp-20
	# *(_tmp5) = _tmp6
	  lw $t0, -20($fp)	# fill _tmp6 to $t0 from $fp-20
	  lw $t2, -16($fp)	# fill _tmp5 to $t2 from $fp-16
	  sw $t0, 0($t2) 	# store with offset
	# betsy = _tmp5
	  lw $t2, -16($fp)	# fill _tmp5 to $t2 from $fp-16
	  sw $t2, -8($fp)	# spill betsy from $t2 to $fp-8
	# _tmp7 = 122
	  li $t2, 122		# load constant value 122 into $t2
	  sw $t2, -24($fp)	# spill _tmp7 from $t2 to $fp-24
	# PushParam _tmp7
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp7 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp8 = 100
	  li $t2, 100		# load constant value 100 into $t2
	  sw $t2, -28($fp)	# spill _tmp8 from $t2 to $fp-28
	# PushParam _tmp8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -28($fp)	# fill _tmp8 to $t0 from $fp-28
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam betsy
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill betsy to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp9 = *(betsy)
	  lw $t0, -8($fp)	# fill betsy to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -32($fp)	# spill _tmp9 from $t2 to $fp-32
	# _tmp10 = *(_tmp9)
	  lw $t0, -32($fp)	# fill _tmp9 to $t0 from $fp-32
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -36($fp)	# spill _tmp10 from $t2 to $fp-36
	# ACall _tmp10
	  lw $t0, -36($fp)	# fill _tmp10 to $t0 from $fp-36
	  jalr $t0            	# jump to function
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# PushParam betsy
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill betsy to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp11 = *(betsy)
	  lw $t0, -8($fp)	# fill betsy to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -40($fp)	# spill _tmp11 from $t2 to $fp-40
	# _tmp12 = *(_tmp11 + 4)
	  lw $t0, -40($fp)	# fill _tmp11 to $t0 from $fp-40
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -44($fp)	# spill _tmp12 from $t2 to $fp-44
	# ACall _tmp12
	  lw $t0, -44($fp)	# fill _tmp12 to $t0 from $fp-44
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _PrintInt:
      subu $sp, $sp, 8	# decrement sp to make space to save ra,fp
      sw $fp, 8($sp)	# save fp
      sw $ra, 4($sp)	# save ra
      addiu $fp, $sp, 8	# set up new fp
      lw $a0, 4($fp)	# fill a to $t0 from $fp+4
    # LCall _PrintInt
      li $v0, 1
      syscall
    # EndFunc
    # (below handles reaching end of fn body with no explicit return)
      move $sp, $fp		# pop callee frame off stack
      lw $ra, -4($fp)	# restore saved ra
      lw $fp, 0($fp)	# restore saved fp
      jr $ra		# return from function

  _ReadInteger:
      subu $sp, $sp, 8	# decrement sp to make space to save ra,fp
      sw $fp, 8($sp)	# save fp
      sw $ra, 4($sp)	# save ra
      addiu $fp, $sp, 8	# set up new fp
      li $v0, 5
      syscall
    # EndFunc
    # (below handles reaching end of fn body with no explicit return)
      move $sp, $fp		# pop callee frame off stack
      lw $ra, -4($fp)	# restore saved ra
      lw $fp, 0($fp)	# restore saved fp
      jr $ra		# return from function


  _PrintBool:
          subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
          sw $fp, 8($sp)        # save fp
          sw $ra, 4($sp)        # save ra
          addiu $fp, $sp, 8     # set up new fp
          lw $t1, 4($fp)        # fill a from $fp+4
      li $t2, 0
          li $v0, 4
      beq $t1, $t2, _PrintBoolFalse
      la $a0, _PrintBoolTrueString
      j _PrintBoolEnd
    _PrintBoolFalse:
    	  la $a0, _PrintBoolFalseString
    _PrintBoolEnd:
          syscall
        # EndFunc
        # (below handles reaching end of fn body with no explicit return)
          move $sp, $fp         # pop callee frame off stack
          lw $ra, -4($fp)       # restore saved ra
          lw $fp, 0($fp)        # restore saved fp
          jr $ra                # return from function

      .data			# create string constant marked with label
      _PrintBoolTrueString: .asciiz "true"
      .text

      .data			# create string constant marked with label
      _PrintBoolFalseString: .asciiz "false"
      .text

  _PrintString:
          subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
          sw $fp, 8($sp)        # save fp
          sw $ra, 4($sp)        # save ra
          addiu $fp, $sp, 8     # set up new fp
          lw $a0, 4($fp)        # fill a from $fp+4
          li $v0, 4
          syscall
        # EndFunc
        # (below handles reaching end of fn body with no explicit return)
          move $sp, $fp         # pop callee frame off stack
          lw $ra, -4($fp)       # restore saved ra
          lw $fp, 0($fp)        # restore saved fp
          jr $ra                # return from function

  _Alloc:
          subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
          sw $fp, 8($sp)        # save fp
          sw $ra, 4($sp)        # save ra
          addiu $fp, $sp, 8     # set up new fp
          lw $a0, 4($fp)        # fill a from $fp+4
          li $v0, 9
          syscall
        # EndFunc
        # (below handles reaching end of fn body with no explicit return)
          move $sp, $fp         # pop callee frame off stack
          lw $ra, -4($fp)       # restore saved ra
          lw $fp, 0($fp)        # restore saved fp
          jr $ra                # return from function

  _Halt:
          li $v0, 10
          syscall

  _ReadLine:
          subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
          sw $fp, 8($sp)        # save fp
          sw $ra, 4($sp)        # save ra
          addiu $fp, $sp, 8     # set up new fp
          li $a0, 101           # bytes to allocate
          li $v0, 9             # sbrk
          syscall
          move $t0, $v0         # save buffer pointer
          move $a0, $v0         # buffer address for ReadString
          li $a1, 101           # read up to 100 chars + null
          li $v0, 8             # ReadString syscall
          syscall
      _ReadLine_trim:
          move $t1, $t0         # iterator
      _ReadLine_loop:
          lb $t2, 0($t1)
          beqz $t2, _ReadLine_done
          li $t3, 10            # '\n'
          beq $t2, $t3, _ReadLine_strip
          li $t3, 13            # '\r'
          beq $t2, $t3, _ReadLine_strip
          addiu $t1, $t1, 1
          j _ReadLine_loop
      _ReadLine_strip:
          sb $zero, 0($t1)
          j _ReadLine_done
      _ReadLine_done:
          move $v0, $t0         # return buffer pointer
        # EndFunc
        # (below handles reaching end of fn body with no explicit return)
          move $sp, $fp         # pop callee frame off stack
          lw $ra, -4($fp)       # restore saved ra
          lw $fp, 0($fp)        # restore saved fp
          jr $ra                # return from function

  _StringEqual:
          subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
          sw $fp, 8($sp)        # save fp
          sw $ra, 4($sp)        # save ra
          addiu $fp, $sp, 8     # set up new fp
          lw $a0, 4($fp)        # fill a from $fp+4
          lw $a1, 8($fp)        # fill b from $fp+8
    _StringEqual_loop:
          lb $t0, ($a0)
          lb $t1, ($a1)
          bne $t0, $t1, _StringEqual_no
          beq $t0, $zero, _StringEqual_yes
          addu $a0, $a0, 1
          addu $a1, $a1, 1
          j _StringEqual_loop
    _StringEqual_yes:
          li $v0, 1
          j _StringEqual_done
    _StringEqual_no:
          li $v0, 0
    _StringEqual_done:
        # EndFunc
        # (below handles reaching end of fn body with no explicit return)
          move $sp, $fp         # pop callee frame off stack
          lw $ra, -4($fp)       # restore saved ra
          lw $fp, 0($fp)        # restore saved fp
          jr $ra                # return from function
