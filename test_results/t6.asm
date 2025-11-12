	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _foo:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# IfZ c Goto _L0
	  lw $t0, 8($fp)	# fill c to $t0 from $fp+8
	  beqz $t0, _L0	# branch if c is zero 
	# _tmp0 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# _tmp1 = a + _tmp0
	  lw $t0, 4($fp)	# fill a to $t0 from $fp+4
	  lw $t1, -8($fp)	# fill _tmp0 to $t1 from $fp-8
	  add $t2, $t0, $t1	
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# Return _tmp1
	  lw $t2, -12($fp)	# fill _tmp1 to $t2 from $fp-12
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto _L1
	  b _L1		# unconditional branch
  _L0:
	# PushParam a
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill a to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp2 = " wacky.\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz " wacky.\n"
	  .text
	  la $t2, _string1	# load label
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# PushParam _tmp2
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L1:
	# _tmp3 = 18
	  li $t2, 18		# load constant value 18 into $t2
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# Return _tmp3
	  lw $t2, -20($fp)	# fill _tmp3 to $t2 from $fp-20
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  main:
	# BeginFunc 88
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 88	# decrement sp to make space for locals/temps
	# _tmp4 = 10
	  li $t2, 10		# load constant value 10 into $t2
	  sw $t2, -12($fp)	# spill _tmp4 from $t2 to $fp-12
	# a = _tmp4
	  lw $t2, -12($fp)	# fill _tmp4 to $t2 from $fp-12
	  sw $t2, 0($gp)	# spill a from $t2 to $gp+0
	# _tmp5 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -16($fp)	# spill _tmp5 from $t2 to $fp-16
	# _tmp6 = a / _tmp5
	  lw $t0, 0($gp)	# fill a to $t0 from $gp+0
	  lw $t1, -16($fp)	# fill _tmp5 to $t1 from $fp-16
	  div $t2, $t0, $t1	
	  sw $t2, -20($fp)	# spill _tmp6 from $t2 to $fp-20
	# b = _tmp6
	  lw $t2, -20($fp)	# fill _tmp6 to $t2 from $fp-20
	  sw $t2, -8($fp)	# spill b from $t2 to $fp-8
	# _tmp7 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -24($fp)	# spill _tmp7 from $t2 to $fp-24
	# PushParam _tmp7
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp7 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam a
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 0($gp)	# fill a to $t0 from $gp+0
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp8 = LCall _foo
	  jal _foo           	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -28($fp)	# spill _tmp8 from $t2 to $fp-28
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp9 = b < a
	  lw $t0, -8($fp)	# fill b to $t0 from $fp-8
	  lw $t1, 0($gp)	# fill a to $t1 from $gp+0
	  slt $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp9 from $t2 to $fp-32
	# _tmp10 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -36($fp)	# spill _tmp10 from $t2 to $fp-36
	# _tmp11 = _tmp10 - _tmp9
	  lw $t0, -36($fp)	# fill _tmp10 to $t0 from $fp-36
	  lw $t1, -32($fp)	# fill _tmp9 to $t1 from $fp-32
	  sub $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp11 from $t2 to $fp-40
	# PushParam _tmp11
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -40($fp)	# fill _tmp11 to $t0 from $fp-40
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp12 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -44($fp)	# spill _tmp12 from $t2 to $fp-44
	# _tmp13 = b + _tmp12
	  lw $t0, -8($fp)	# fill b to $t0 from $fp-8
	  lw $t1, -44($fp)	# fill _tmp12 to $t1 from $fp-44
	  add $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp13 from $t2 to $fp-48
	# PushParam _tmp13
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -48($fp)	# fill _tmp13 to $t0 from $fp-48
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp14 = LCall _foo
	  jal _foo           	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -52($fp)	# spill _tmp14 from $t2 to $fp-52
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp15 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -56($fp)	# spill _tmp15 from $t2 to $fp-56
	# _tmp16 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -60($fp)	# spill _tmp16 from $t2 to $fp-60
	# _tmp17 = _tmp15 == _tmp16
	  lw $t0, -56($fp)	# fill _tmp15 to $t0 from $fp-56
	  lw $t1, -60($fp)	# fill _tmp16 to $t1 from $fp-60
	  seq $t2, $t0, $t1	
	  sw $t2, -64($fp)	# spill _tmp17 from $t2 to $fp-64
	# PushParam _tmp17
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -64($fp)	# fill _tmp17 to $t0 from $fp-64
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp19 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -72($fp)	# spill _tmp19 from $t2 to $fp-72
	# IfZ _tmp19 Goto _L2
	  lw $t0, -72($fp)	# fill _tmp19 to $t0 from $fp-72
	  beqz $t0, _L2	# branch if _tmp19 is zero 
	# _tmp20 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -76($fp)	# spill _tmp20 from $t2 to $fp-76
	# _tmp18 = _tmp20
	  lw $t2, -76($fp)	# fill _tmp20 to $t2 from $fp-76
	  sw $t2, -68($fp)	# spill _tmp18 from $t2 to $fp-68
	# Goto _L3
	  b _L3		# unconditional branch
  _L2:
	# _tmp21 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -80($fp)	# spill _tmp21 from $t2 to $fp-80
	# _tmp18 = _tmp21
	  lw $t2, -80($fp)	# fill _tmp21 to $t2 from $fp-80
	  sw $t2, -68($fp)	# spill _tmp18 from $t2 to $fp-68
  _L3:
	# PushParam _tmp18
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -68($fp)	# fill _tmp18 to $t0 from $fp-68
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp22 = 3
	  li $t2, 3		# load constant value 3 into $t2
	  sw $t2, -84($fp)	# spill _tmp22 from $t2 to $fp-84
	# PushParam _tmp22
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -84($fp)	# fill _tmp22 to $t0 from $fp-84
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp23 = LCall _foo
	  jal _foo           	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -88($fp)	# spill _tmp23 from $t2 to $fp-88
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# PushParam _tmp23
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -88($fp)	# fill _tmp23 to $t0 from $fp-88
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp24 = LCall _foo
	  jal _foo           	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -92($fp)	# spill _tmp24 from $t2 to $fp-92
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
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
