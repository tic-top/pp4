	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  main:
	# BeginFunc 56
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 56	# decrement sp to make space for locals/temps
	# _tmp0 = 5
	  li $t2, 5		# load constant value 5 into $t2
	  sw $t2, -12($fp)	# spill _tmp0 from $t2 to $fp-12
	# _tmp1 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -16($fp)	# spill _tmp1 from $t2 to $fp-16
	# _tmp2 = _tmp1 - _tmp0
	  lw $t0, -16($fp)	# fill _tmp1 to $t0 from $fp-16
	  lw $t1, -12($fp)	# fill _tmp0 to $t1 from $fp-12
	  sub $t2, $t0, $t1	
	  sw $t2, -20($fp)	# spill _tmp2 from $t2 to $fp-20
	# _tmp3 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -24($fp)	# spill _tmp3 from $t2 to $fp-24
	# _tmp4 = _tmp2 < _tmp3
	  lw $t0, -20($fp)	# fill _tmp2 to $t0 from $fp-20
	  lw $t1, -24($fp)	# fill _tmp3 to $t1 from $fp-24
	  slt $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp4 from $t2 to $fp-28
	# IfZ _tmp4 Goto _L0
	  lw $t0, -28($fp)	# fill _tmp4 to $t0 from $fp-28
	  beqz $t0, _L0	# branch if _tmp4 is zero 
	# _tmp5 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t2, _string1	# load label
	  sw $t2, -32($fp)	# spill _tmp5 from $t2 to $fp-32
	# PushParam _tmp5
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp5 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L0:
	# _tmp6 = _tmp2 == _tmp3
	  lw $t0, -20($fp)	# fill _tmp2 to $t0 from $fp-20
	  lw $t1, -24($fp)	# fill _tmp3 to $t1 from $fp-24
	  seq $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp6 from $t2 to $fp-36
	# IfZ _tmp6 Goto _L1
	  lw $t0, -36($fp)	# fill _tmp6 to $t0 from $fp-36
	  beqz $t0, _L1	# branch if _tmp6 is zero 
	# PushParam _tmp5
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp5 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L1:
	# _tmp7 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -40($fp)	# spill _tmp7 from $t2 to $fp-40
	# _tmp8 = _tmp2 + _tmp7
	  lw $t0, -20($fp)	# fill _tmp2 to $t0 from $fp-20
	  lw $t1, -40($fp)	# fill _tmp7 to $t1 from $fp-40
	  add $t2, $t0, $t1	
	  sw $t2, -44($fp)	# spill _tmp8 from $t2 to $fp-44
	# _tmp9 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -48($fp)	# spill _tmp9 from $t2 to $fp-48
	# _tmp10 = _tmp8 * _tmp9
	  lw $t0, -44($fp)	# fill _tmp8 to $t0 from $fp-44
	  lw $t1, -48($fp)	# fill _tmp9 to $t1 from $fp-48
	  mul $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp10 from $t2 to $fp-52
	# PushParam _tmp10
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -52($fp)	# fill _tmp10 to $t0 from $fp-52
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp11 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -56($fp)	# spill _tmp11 from $t2 to $fp-56
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp11) = _tmp2
	  lw $t0, -20($fp)	# fill _tmp2 to $t0 from $fp-20
	  lw $t2, -56($fp)	# fill _tmp11 to $t2 from $fp-56
	  sw $t0, 0($t2) 	# store with offset
	# arr = _tmp11
	  lw $t2, -56($fp)	# fill _tmp11 to $t2 from $fp-56
	  sw $t2, -8($fp)	# spill arr from $t2 to $fp-8
	# _tmp12 = "How did I get here?\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "How did I get here?\n"
	  .text
	  la $t2, _string2	# load label
	  sw $t2, -60($fp)	# spill _tmp12 from $t2 to $fp-60
	# PushParam _tmp12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -60($fp)	# fill _tmp12 to $t0 from $fp-60
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
