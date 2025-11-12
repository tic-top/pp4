	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
	# VTable for class Matrix
	  .data
	  .align 2
	  Matrix:		# label for class Matrix vtable
	  .word _Matrix.Init
	  .word _Matrix.Set
	  .word _Matrix.Get
	  .word _Matrix.PrintMatrix
	  .word _Matrix.SeedMatrix
	  .text
  _Matrix.Init:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Matrix.Set:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Matrix.Get:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Matrix.PrintMatrix:
	# BeginFunc 68
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 68	# decrement sp to make space for locals/temps
	# _tmp0 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -16($fp)	# spill _tmp0 from $t2 to $fp-16
	# i = _tmp0
	  lw $t2, -16($fp)	# fill _tmp0 to $t2 from $fp-16
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  _L0:
	# _tmp1 = 10
	  li $t2, 10		# load constant value 10 into $t2
	  sw $t2, -20($fp)	# spill _tmp1 from $t2 to $fp-20
	# _tmp2 = i < _tmp1
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -20($fp)	# fill _tmp1 to $t1 from $fp-20
	  slt $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp2 from $t2 to $fp-24
	# IfZ _tmp2 Goto _L1
	  lw $t0, -24($fp)	# fill _tmp2 to $t0 from $fp-24
	  beqz $t0, _L1	# branch if _tmp2 is zero 
	# _tmp3 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -28($fp)	# spill _tmp3 from $t2 to $fp-28
	# j = _tmp3
	  lw $t2, -28($fp)	# fill _tmp3 to $t2 from $fp-28
	  sw $t2, -12($fp)	# spill j from $t2 to $fp-12
  _L2:
	# _tmp4 = 10
	  li $t2, 10		# load constant value 10 into $t2
	  sw $t2, -32($fp)	# spill _tmp4 from $t2 to $fp-32
	# _tmp5 = j < _tmp4
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -32($fp)	# fill _tmp4 to $t1 from $fp-32
	  slt $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp5 from $t2 to $fp-36
	# IfZ _tmp5 Goto _L3
	  lw $t0, -36($fp)	# fill _tmp5 to $t0 from $fp-36
	  beqz $t0, _L3	# branch if _tmp5 is zero 
	# PushParam j
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam i
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp6 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -40($fp)	# spill _tmp6 from $t2 to $fp-40
	# _tmp7 = *(_tmp6 + 8)
	  lw $t0, -40($fp)	# fill _tmp6 to $t0 from $fp-40
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -44($fp)	# spill _tmp7 from $t2 to $fp-44
	# _tmp8 = ACall _tmp7
	  lw $t0, -44($fp)	# fill _tmp7 to $t0 from $fp-44
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -48($fp)	# spill _tmp8 from $t2 to $fp-48
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# PushParam _tmp8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -48($fp)	# fill _tmp8 to $t0 from $fp-48
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp9 = "\t"
	  .data			# create string constant marked with label
	  _string1: .asciiz "\t"
	  .text
	  la $t2, _string1	# load label
	  sw $t2, -52($fp)	# spill _tmp9 from $t2 to $fp-52
	# PushParam _tmp9
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -52($fp)	# fill _tmp9 to $t0 from $fp-52
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp10 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -56($fp)	# spill _tmp10 from $t2 to $fp-56
	# _tmp11 = j + _tmp10
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -56($fp)	# fill _tmp10 to $t1 from $fp-56
	  add $t2, $t0, $t1	
	  sw $t2, -60($fp)	# spill _tmp11 from $t2 to $fp-60
	# j = _tmp11
	  lw $t2, -60($fp)	# fill _tmp11 to $t2 from $fp-60
	  sw $t2, -12($fp)	# spill j from $t2 to $fp-12
	# Goto _L2
	  b _L2		# unconditional branch
  _L3:
	# _tmp12 = "\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "\n"
	  .text
	  la $t2, _string2	# load label
	  sw $t2, -64($fp)	# spill _tmp12 from $t2 to $fp-64
	# PushParam _tmp12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -64($fp)	# fill _tmp12 to $t0 from $fp-64
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp13 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -68($fp)	# spill _tmp13 from $t2 to $fp-68
	# _tmp14 = i + _tmp13
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -68($fp)	# fill _tmp13 to $t1 from $fp-68
	  add $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp14 from $t2 to $fp-72
	# i = _tmp14
	  lw $t2, -72($fp)	# fill _tmp14 to $t2 from $fp-72
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# Goto _L0
	  b _L0		# unconditional branch
  _L1:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Matrix.SeedMatrix:
	# BeginFunc 180
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 180	# decrement sp to make space for locals/temps
	# _tmp15 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -16($fp)	# spill _tmp15 from $t2 to $fp-16
	# i = _tmp15
	  lw $t2, -16($fp)	# fill _tmp15 to $t2 from $fp-16
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  _L4:
	# _tmp16 = 5
	  li $t2, 5		# load constant value 5 into $t2
	  sw $t2, -20($fp)	# spill _tmp16 from $t2 to $fp-20
	# _tmp17 = i < _tmp16
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -20($fp)	# fill _tmp16 to $t1 from $fp-20
	  slt $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp17 from $t2 to $fp-24
	# IfZ _tmp17 Goto _L5
	  lw $t0, -24($fp)	# fill _tmp17 to $t0 from $fp-24
	  beqz $t0, _L5	# branch if _tmp17 is zero 
	# _tmp18 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -28($fp)	# spill _tmp18 from $t2 to $fp-28
	# j = _tmp18
	  lw $t2, -28($fp)	# fill _tmp18 to $t2 from $fp-28
	  sw $t2, -12($fp)	# spill j from $t2 to $fp-12
  _L6:
	# _tmp19 = 5
	  li $t2, 5		# load constant value 5 into $t2
	  sw $t2, -32($fp)	# spill _tmp19 from $t2 to $fp-32
	# _tmp20 = j < _tmp19
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -32($fp)	# fill _tmp19 to $t1 from $fp-32
	  slt $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp20 from $t2 to $fp-36
	# IfZ _tmp20 Goto _L7
	  lw $t0, -36($fp)	# fill _tmp20 to $t0 from $fp-36
	  beqz $t0, _L7	# branch if _tmp20 is zero 
	# _tmp21 = i + j
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  add $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp21 from $t2 to $fp-40
	# PushParam _tmp21
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -40($fp)	# fill _tmp21 to $t0 from $fp-40
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam j
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam i
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp22 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -44($fp)	# spill _tmp22 from $t2 to $fp-44
	# _tmp23 = *(_tmp22 + 4)
	  lw $t0, -44($fp)	# fill _tmp22 to $t0 from $fp-44
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -48($fp)	# spill _tmp23 from $t2 to $fp-48
	# ACall _tmp23
	  lw $t0, -48($fp)	# fill _tmp23 to $t0 from $fp-48
	  jalr $t0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp24 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -52($fp)	# spill _tmp24 from $t2 to $fp-52
	# _tmp25 = j + _tmp24
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -52($fp)	# fill _tmp24 to $t1 from $fp-52
	  add $t2, $t0, $t1	
	  sw $t2, -56($fp)	# spill _tmp25 from $t2 to $fp-56
	# j = _tmp25
	  lw $t2, -56($fp)	# fill _tmp25 to $t2 from $fp-56
	  sw $t2, -12($fp)	# spill j from $t2 to $fp-12
	# Goto _L6
	  b _L6		# unconditional branch
  _L7:
	# _tmp26 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -60($fp)	# spill _tmp26 from $t2 to $fp-60
	# _tmp27 = i + _tmp26
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -60($fp)	# fill _tmp26 to $t1 from $fp-60
	  add $t2, $t0, $t1	
	  sw $t2, -64($fp)	# spill _tmp27 from $t2 to $fp-64
	# i = _tmp27
	  lw $t2, -64($fp)	# fill _tmp27 to $t2 from $fp-64
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# Goto _L4
	  b _L4		# unconditional branch
  _L5:
	# _tmp28 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -68($fp)	# spill _tmp28 from $t2 to $fp-68
	# PushParam _tmp28
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -68($fp)	# fill _tmp28 to $t0 from $fp-68
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp29 = 3
	  li $t2, 3		# load constant value 3 into $t2
	  sw $t2, -72($fp)	# spill _tmp29 from $t2 to $fp-72
	# PushParam _tmp29
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -72($fp)	# fill _tmp29 to $t0 from $fp-72
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp30 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -76($fp)	# spill _tmp30 from $t2 to $fp-76
	# PushParam _tmp30
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -76($fp)	# fill _tmp30 to $t0 from $fp-76
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp31 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -80($fp)	# spill _tmp31 from $t2 to $fp-80
	# _tmp32 = *(_tmp31 + 4)
	  lw $t0, -80($fp)	# fill _tmp31 to $t0 from $fp-80
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -84($fp)	# spill _tmp32 from $t2 to $fp-84
	# ACall _tmp32
	  lw $t0, -84($fp)	# fill _tmp32 to $t0 from $fp-84
	  jalr $t0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp33 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -88($fp)	# spill _tmp33 from $t2 to $fp-88
	# PushParam _tmp33
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -88($fp)	# fill _tmp33 to $t0 from $fp-88
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp34 = 6
	  li $t2, 6		# load constant value 6 into $t2
	  sw $t2, -92($fp)	# spill _tmp34 from $t2 to $fp-92
	# PushParam _tmp34
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -92($fp)	# fill _tmp34 to $t0 from $fp-92
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp35 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -96($fp)	# spill _tmp35 from $t2 to $fp-96
	# PushParam _tmp35
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -96($fp)	# fill _tmp35 to $t0 from $fp-96
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp36 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -100($fp)	# spill _tmp36 from $t2 to $fp-100
	# _tmp37 = *(_tmp36 + 4)
	  lw $t0, -100($fp)	# fill _tmp36 to $t0 from $fp-100
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -104($fp)	# spill _tmp37 from $t2 to $fp-104
	# ACall _tmp37
	  lw $t0, -104($fp)	# fill _tmp37 to $t0 from $fp-104
	  jalr $t0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp38 = 5
	  li $t2, 5		# load constant value 5 into $t2
	  sw $t2, -108($fp)	# spill _tmp38 from $t2 to $fp-108
	# PushParam _tmp38
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -108($fp)	# fill _tmp38 to $t0 from $fp-108
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp39 = 3
	  li $t2, 3		# load constant value 3 into $t2
	  sw $t2, -112($fp)	# spill _tmp39 from $t2 to $fp-112
	# PushParam _tmp39
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -112($fp)	# fill _tmp39 to $t0 from $fp-112
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp40 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -116($fp)	# spill _tmp40 from $t2 to $fp-116
	# PushParam _tmp40
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -116($fp)	# fill _tmp40 to $t0 from $fp-116
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp41 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -120($fp)	# spill _tmp41 from $t2 to $fp-120
	# _tmp42 = *(_tmp41 + 4)
	  lw $t0, -120($fp)	# fill _tmp41 to $t0 from $fp-120
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -124($fp)	# spill _tmp42 from $t2 to $fp-124
	# ACall _tmp42
	  lw $t0, -124($fp)	# fill _tmp42 to $t0 from $fp-124
	  jalr $t0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp43 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -128($fp)	# spill _tmp43 from $t2 to $fp-128
	# PushParam _tmp43
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -128($fp)	# fill _tmp43 to $t0 from $fp-128
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp44 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -132($fp)	# spill _tmp44 from $t2 to $fp-132
	# PushParam _tmp44
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -132($fp)	# fill _tmp44 to $t0 from $fp-132
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp45 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -136($fp)	# spill _tmp45 from $t2 to $fp-136
	# PushParam _tmp45
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -136($fp)	# fill _tmp45 to $t0 from $fp-136
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp46 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -140($fp)	# spill _tmp46 from $t2 to $fp-140
	# _tmp47 = *(_tmp46 + 4)
	  lw $t0, -140($fp)	# fill _tmp46 to $t0 from $fp-140
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -144($fp)	# spill _tmp47 from $t2 to $fp-144
	# ACall _tmp47
	  lw $t0, -144($fp)	# fill _tmp47 to $t0 from $fp-144
	  jalr $t0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp48 = 3
	  li $t2, 3		# load constant value 3 into $t2
	  sw $t2, -148($fp)	# spill _tmp48 from $t2 to $fp-148
	# PushParam _tmp48
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -148($fp)	# fill _tmp48 to $t0 from $fp-148
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp49 = 6
	  li $t2, 6		# load constant value 6 into $t2
	  sw $t2, -152($fp)	# spill _tmp49 from $t2 to $fp-152
	# PushParam _tmp49
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -152($fp)	# fill _tmp49 to $t0 from $fp-152
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp50 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -156($fp)	# spill _tmp50 from $t2 to $fp-156
	# PushParam _tmp50
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -156($fp)	# fill _tmp50 to $t0 from $fp-156
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp51 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -160($fp)	# spill _tmp51 from $t2 to $fp-160
	# _tmp52 = *(_tmp51 + 4)
	  lw $t0, -160($fp)	# fill _tmp51 to $t0 from $fp-160
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -164($fp)	# spill _tmp52 from $t2 to $fp-164
	# ACall _tmp52
	  lw $t0, -164($fp)	# fill _tmp52 to $t0 from $fp-164
	  jalr $t0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp53 = 7
	  li $t2, 7		# load constant value 7 into $t2
	  sw $t2, -168($fp)	# spill _tmp53 from $t2 to $fp-168
	# PushParam _tmp53
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -168($fp)	# fill _tmp53 to $t0 from $fp-168
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp54 = 7
	  li $t2, 7		# load constant value 7 into $t2
	  sw $t2, -172($fp)	# spill _tmp54 from $t2 to $fp-172
	# PushParam _tmp54
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -172($fp)	# fill _tmp54 to $t0 from $fp-172
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp55 = 7
	  li $t2, 7		# load constant value 7 into $t2
	  sw $t2, -176($fp)	# spill _tmp55 from $t2 to $fp-176
	# PushParam _tmp55
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -176($fp)	# fill _tmp55 to $t0 from $fp-176
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp56 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -180($fp)	# spill _tmp56 from $t2 to $fp-180
	# _tmp57 = *(_tmp56 + 4)
	  lw $t0, -180($fp)	# fill _tmp56 to $t0 from $fp-180
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -184($fp)	# spill _tmp57 from $t2 to $fp-184
	# ACall _tmp57
	  lw $t0, -184($fp)	# fill _tmp57 to $t0 from $fp-184
	  jalr $t0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class DenseMatrix
	  .data
	  .align 2
	  DenseMatrix:		# label for class DenseMatrix vtable
	  .word _DenseMatrix.Init
	  .word _DenseMatrix.Set
	  .word _DenseMatrix.Get
	  .word _Matrix.PrintMatrix
	  .word _Matrix.SeedMatrix
	  .text
  _DenseMatrix.Init:
	# BeginFunc 288
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 288	# decrement sp to make space for locals/temps
	# _tmp58 = 10
	  li $t2, 10		# load constant value 10 into $t2
	  sw $t2, -16($fp)	# spill _tmp58 from $t2 to $fp-16
	# _tmp59 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -20($fp)	# spill _tmp59 from $t2 to $fp-20
	# _tmp60 = _tmp58 < _tmp59
	  lw $t0, -16($fp)	# fill _tmp58 to $t0 from $fp-16
	  lw $t1, -20($fp)	# fill _tmp59 to $t1 from $fp-20
	  slt $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp60 from $t2 to $fp-24
	# IfZ _tmp60 Goto _L8
	  lw $t0, -24($fp)	# fill _tmp60 to $t0 from $fp-24
	  beqz $t0, _L8	# branch if _tmp60 is zero 
	# _tmp61 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t2, _string3	# load label
	  sw $t2, -28($fp)	# spill _tmp61 from $t2 to $fp-28
	# PushParam _tmp61
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -28($fp)	# fill _tmp61 to $t0 from $fp-28
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L8:
	# _tmp62 = _tmp58 == _tmp59
	  lw $t0, -16($fp)	# fill _tmp58 to $t0 from $fp-16
	  lw $t1, -20($fp)	# fill _tmp59 to $t1 from $fp-20
	  seq $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp62 from $t2 to $fp-32
	# IfZ _tmp62 Goto _L9
	  lw $t0, -32($fp)	# fill _tmp62 to $t0 from $fp-32
	  beqz $t0, _L9	# branch if _tmp62 is zero 
	# PushParam _tmp61
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -28($fp)	# fill _tmp61 to $t0 from $fp-28
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L9:
	# _tmp63 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -36($fp)	# spill _tmp63 from $t2 to $fp-36
	# _tmp64 = _tmp58 + _tmp63
	  lw $t0, -16($fp)	# fill _tmp58 to $t0 from $fp-16
	  lw $t1, -36($fp)	# fill _tmp63 to $t1 from $fp-36
	  add $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp64 from $t2 to $fp-40
	# _tmp65 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -44($fp)	# spill _tmp65 from $t2 to $fp-44
	# _tmp66 = _tmp64 * _tmp65
	  lw $t0, -40($fp)	# fill _tmp64 to $t0 from $fp-40
	  lw $t1, -44($fp)	# fill _tmp65 to $t1 from $fp-44
	  mul $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp66 from $t2 to $fp-48
	# PushParam _tmp66
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -48($fp)	# fill _tmp66 to $t0 from $fp-48
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp67 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -52($fp)	# spill _tmp67 from $t2 to $fp-52
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp67) = _tmp58
	  lw $t0, -16($fp)	# fill _tmp58 to $t0 from $fp-16
	  lw $t2, -52($fp)	# fill _tmp67 to $t2 from $fp-52
	  sw $t0, 0($t2) 	# store with offset
	# *(this + 4) = _tmp67
	  lw $t0, -52($fp)	# fill _tmp67 to $t0 from $fp-52
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 4($t2) 	# store with offset
	# _tmp68 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -56($fp)	# spill _tmp68 from $t2 to $fp-56
	# i = _tmp68
	  lw $t2, -56($fp)	# fill _tmp68 to $t2 from $fp-56
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  _L10:
	# _tmp69 = 10
	  li $t2, 10		# load constant value 10 into $t2
	  sw $t2, -60($fp)	# spill _tmp69 from $t2 to $fp-60
	# _tmp70 = i < _tmp69
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -60($fp)	# fill _tmp69 to $t1 from $fp-60
	  slt $t2, $t0, $t1	
	  sw $t2, -64($fp)	# spill _tmp70 from $t2 to $fp-64
	# IfZ _tmp70 Goto _L11
	  lw $t0, -64($fp)	# fill _tmp70 to $t0 from $fp-64
	  beqz $t0, _L11	# branch if _tmp70 is zero 
	# _tmp71 = 10
	  li $t2, 10		# load constant value 10 into $t2
	  sw $t2, -68($fp)	# spill _tmp71 from $t2 to $fp-68
	# _tmp72 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -72($fp)	# spill _tmp72 from $t2 to $fp-72
	# _tmp73 = _tmp71 < _tmp72
	  lw $t0, -68($fp)	# fill _tmp71 to $t0 from $fp-68
	  lw $t1, -72($fp)	# fill _tmp72 to $t1 from $fp-72
	  slt $t2, $t0, $t1	
	  sw $t2, -76($fp)	# spill _tmp73 from $t2 to $fp-76
	# IfZ _tmp73 Goto _L12
	  lw $t0, -76($fp)	# fill _tmp73 to $t0 from $fp-76
	  beqz $t0, _L12	# branch if _tmp73 is zero 
	# _tmp74 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string4: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t2, _string4	# load label
	  sw $t2, -80($fp)	# spill _tmp74 from $t2 to $fp-80
	# PushParam _tmp74
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -80($fp)	# fill _tmp74 to $t0 from $fp-80
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L12:
	# _tmp75 = _tmp71 == _tmp72
	  lw $t0, -68($fp)	# fill _tmp71 to $t0 from $fp-68
	  lw $t1, -72($fp)	# fill _tmp72 to $t1 from $fp-72
	  seq $t2, $t0, $t1	
	  sw $t2, -84($fp)	# spill _tmp75 from $t2 to $fp-84
	# IfZ _tmp75 Goto _L13
	  lw $t0, -84($fp)	# fill _tmp75 to $t0 from $fp-84
	  beqz $t0, _L13	# branch if _tmp75 is zero 
	# PushParam _tmp74
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -80($fp)	# fill _tmp74 to $t0 from $fp-80
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L13:
	# _tmp76 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -88($fp)	# spill _tmp76 from $t2 to $fp-88
	# _tmp77 = _tmp71 + _tmp76
	  lw $t0, -68($fp)	# fill _tmp71 to $t0 from $fp-68
	  lw $t1, -88($fp)	# fill _tmp76 to $t1 from $fp-88
	  add $t2, $t0, $t1	
	  sw $t2, -92($fp)	# spill _tmp77 from $t2 to $fp-92
	# _tmp78 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -96($fp)	# spill _tmp78 from $t2 to $fp-96
	# _tmp79 = _tmp77 * _tmp78
	  lw $t0, -92($fp)	# fill _tmp77 to $t0 from $fp-92
	  lw $t1, -96($fp)	# fill _tmp78 to $t1 from $fp-96
	  mul $t2, $t0, $t1	
	  sw $t2, -100($fp)	# spill _tmp79 from $t2 to $fp-100
	# PushParam _tmp79
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -100($fp)	# fill _tmp79 to $t0 from $fp-100
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp80 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -104($fp)	# spill _tmp80 from $t2 to $fp-104
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp80) = _tmp71
	  lw $t0, -68($fp)	# fill _tmp71 to $t0 from $fp-68
	  lw $t2, -104($fp)	# fill _tmp80 to $t2 from $fp-104
	  sw $t0, 0($t2) 	# store with offset
	# _tmp81 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -108($fp)	# spill _tmp81 from $t2 to $fp-108
	# _tmp82 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string5: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string5	# load label
	  sw $t2, -112($fp)	# spill _tmp82 from $t2 to $fp-112
	# _tmp83 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -116($fp)	# spill _tmp83 from $t2 to $fp-116
	# _tmp84 = i < _tmp83
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -116($fp)	# fill _tmp83 to $t1 from $fp-116
	  slt $t2, $t0, $t1	
	  sw $t2, -120($fp)	# spill _tmp84 from $t2 to $fp-120
	# IfZ _tmp84 Goto _L14
	  lw $t0, -120($fp)	# fill _tmp84 to $t0 from $fp-120
	  beqz $t0, _L14	# branch if _tmp84 is zero 
	# PushParam _tmp82
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -112($fp)	# fill _tmp82 to $t0 from $fp-112
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L14:
	# _tmp85 = *(_tmp81)
	  lw $t0, -108($fp)	# fill _tmp81 to $t0 from $fp-108
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -124($fp)	# spill _tmp85 from $t2 to $fp-124
	# _tmp86 = i < _tmp85
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -124($fp)	# fill _tmp85 to $t1 from $fp-124
	  slt $t2, $t0, $t1	
	  sw $t2, -128($fp)	# spill _tmp86 from $t2 to $fp-128
	# IfZ _tmp86 Goto _L16
	  lw $t0, -128($fp)	# fill _tmp86 to $t0 from $fp-128
	  beqz $t0, _L16	# branch if _tmp86 is zero 
	# Goto _L15
	  b _L15		# unconditional branch
  _L16:
	# PushParam _tmp82
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -112($fp)	# fill _tmp82 to $t0 from $fp-112
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L15:
	# _tmp87 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -132($fp)	# spill _tmp87 from $t2 to $fp-132
	# _tmp88 = i + _tmp87
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -132($fp)	# fill _tmp87 to $t1 from $fp-132
	  add $t2, $t0, $t1	
	  sw $t2, -136($fp)	# spill _tmp88 from $t2 to $fp-136
	# _tmp89 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -140($fp)	# spill _tmp89 from $t2 to $fp-140
	# _tmp90 = _tmp88 * _tmp89
	  lw $t0, -136($fp)	# fill _tmp88 to $t0 from $fp-136
	  lw $t1, -140($fp)	# fill _tmp89 to $t1 from $fp-140
	  mul $t2, $t0, $t1	
	  sw $t2, -144($fp)	# spill _tmp90 from $t2 to $fp-144
	# _tmp91 = _tmp81 + _tmp90
	  lw $t0, -108($fp)	# fill _tmp81 to $t0 from $fp-108
	  lw $t1, -144($fp)	# fill _tmp90 to $t1 from $fp-144
	  add $t2, $t0, $t1	
	  sw $t2, -148($fp)	# spill _tmp91 from $t2 to $fp-148
	# *(_tmp91) = _tmp80
	  lw $t0, -104($fp)	# fill _tmp80 to $t0 from $fp-104
	  lw $t2, -148($fp)	# fill _tmp91 to $t2 from $fp-148
	  sw $t0, 0($t2) 	# store with offset
	# _tmp92 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -152($fp)	# spill _tmp92 from $t2 to $fp-152
	# _tmp93 = i + _tmp92
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -152($fp)	# fill _tmp92 to $t1 from $fp-152
	  add $t2, $t0, $t1	
	  sw $t2, -156($fp)	# spill _tmp93 from $t2 to $fp-156
	# i = _tmp93
	  lw $t2, -156($fp)	# fill _tmp93 to $t2 from $fp-156
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# Goto _L10
	  b _L10		# unconditional branch
  _L11:
	# _tmp94 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -160($fp)	# spill _tmp94 from $t2 to $fp-160
	# i = _tmp94
	  lw $t2, -160($fp)	# fill _tmp94 to $t2 from $fp-160
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  _L17:
	# _tmp95 = 10
	  li $t2, 10		# load constant value 10 into $t2
	  sw $t2, -164($fp)	# spill _tmp95 from $t2 to $fp-164
	# _tmp96 = i < _tmp95
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -164($fp)	# fill _tmp95 to $t1 from $fp-164
	  slt $t2, $t0, $t1	
	  sw $t2, -168($fp)	# spill _tmp96 from $t2 to $fp-168
	# IfZ _tmp96 Goto _L18
	  lw $t0, -168($fp)	# fill _tmp96 to $t0 from $fp-168
	  beqz $t0, _L18	# branch if _tmp96 is zero 
	# _tmp97 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -172($fp)	# spill _tmp97 from $t2 to $fp-172
	# j = _tmp97
	  lw $t2, -172($fp)	# fill _tmp97 to $t2 from $fp-172
	  sw $t2, -12($fp)	# spill j from $t2 to $fp-12
  _L19:
	# _tmp98 = 10
	  li $t2, 10		# load constant value 10 into $t2
	  sw $t2, -176($fp)	# spill _tmp98 from $t2 to $fp-176
	# _tmp99 = j < _tmp98
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -176($fp)	# fill _tmp98 to $t1 from $fp-176
	  slt $t2, $t0, $t1	
	  sw $t2, -180($fp)	# spill _tmp99 from $t2 to $fp-180
	# IfZ _tmp99 Goto _L20
	  lw $t0, -180($fp)	# fill _tmp99 to $t0 from $fp-180
	  beqz $t0, _L20	# branch if _tmp99 is zero 
	# _tmp100 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -184($fp)	# spill _tmp100 from $t2 to $fp-184
	# _tmp101 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -188($fp)	# spill _tmp101 from $t2 to $fp-188
	# _tmp102 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string6	# load label
	  sw $t2, -192($fp)	# spill _tmp102 from $t2 to $fp-192
	# _tmp103 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -196($fp)	# spill _tmp103 from $t2 to $fp-196
	# _tmp104 = _tmp101 == _tmp103
	  lw $t0, -188($fp)	# fill _tmp101 to $t0 from $fp-188
	  lw $t1, -196($fp)	# fill _tmp103 to $t1 from $fp-196
	  seq $t2, $t0, $t1	
	  sw $t2, -200($fp)	# spill _tmp104 from $t2 to $fp-200
	# IfZ _tmp104 Goto _L21
	  lw $t0, -200($fp)	# fill _tmp104 to $t0 from $fp-200
	  beqz $t0, _L21	# branch if _tmp104 is zero 
	# PushParam _tmp102
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -192($fp)	# fill _tmp102 to $t0 from $fp-192
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L21:
	# _tmp105 = i < _tmp103
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -196($fp)	# fill _tmp103 to $t1 from $fp-196
	  slt $t2, $t0, $t1	
	  sw $t2, -204($fp)	# spill _tmp105 from $t2 to $fp-204
	# IfZ _tmp105 Goto _L22
	  lw $t0, -204($fp)	# fill _tmp105 to $t0 from $fp-204
	  beqz $t0, _L22	# branch if _tmp105 is zero 
	# PushParam _tmp102
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -192($fp)	# fill _tmp102 to $t0 from $fp-192
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L22:
	# _tmp106 = *(_tmp101)
	  lw $t0, -188($fp)	# fill _tmp101 to $t0 from $fp-188
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -208($fp)	# spill _tmp106 from $t2 to $fp-208
	# _tmp107 = i < _tmp106
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -208($fp)	# fill _tmp106 to $t1 from $fp-208
	  slt $t2, $t0, $t1	
	  sw $t2, -212($fp)	# spill _tmp107 from $t2 to $fp-212
	# IfZ _tmp107 Goto _L24
	  lw $t0, -212($fp)	# fill _tmp107 to $t0 from $fp-212
	  beqz $t0, _L24	# branch if _tmp107 is zero 
	# Goto _L23
	  b _L23		# unconditional branch
  _L24:
	# PushParam _tmp102
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -192($fp)	# fill _tmp102 to $t0 from $fp-192
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L23:
	# _tmp108 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -216($fp)	# spill _tmp108 from $t2 to $fp-216
	# _tmp109 = i + _tmp108
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -216($fp)	# fill _tmp108 to $t1 from $fp-216
	  add $t2, $t0, $t1	
	  sw $t2, -220($fp)	# spill _tmp109 from $t2 to $fp-220
	# _tmp110 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -224($fp)	# spill _tmp110 from $t2 to $fp-224
	# _tmp111 = _tmp109 * _tmp110
	  lw $t0, -220($fp)	# fill _tmp109 to $t0 from $fp-220
	  lw $t1, -224($fp)	# fill _tmp110 to $t1 from $fp-224
	  mul $t2, $t0, $t1	
	  sw $t2, -228($fp)	# spill _tmp111 from $t2 to $fp-228
	# _tmp112 = _tmp101 + _tmp111
	  lw $t0, -188($fp)	# fill _tmp101 to $t0 from $fp-188
	  lw $t1, -228($fp)	# fill _tmp111 to $t1 from $fp-228
	  add $t2, $t0, $t1	
	  sw $t2, -232($fp)	# spill _tmp112 from $t2 to $fp-232
	# _tmp113 = *(_tmp112)
	  lw $t0, -232($fp)	# fill _tmp112 to $t0 from $fp-232
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -236($fp)	# spill _tmp113 from $t2 to $fp-236
	# _tmp114 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string7	# load label
	  sw $t2, -240($fp)	# spill _tmp114 from $t2 to $fp-240
	# _tmp115 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -244($fp)	# spill _tmp115 from $t2 to $fp-244
	# _tmp116 = j < _tmp115
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -244($fp)	# fill _tmp115 to $t1 from $fp-244
	  slt $t2, $t0, $t1	
	  sw $t2, -248($fp)	# spill _tmp116 from $t2 to $fp-248
	# IfZ _tmp116 Goto _L25
	  lw $t0, -248($fp)	# fill _tmp116 to $t0 from $fp-248
	  beqz $t0, _L25	# branch if _tmp116 is zero 
	# PushParam _tmp114
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -240($fp)	# fill _tmp114 to $t0 from $fp-240
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L25:
	# _tmp117 = *(_tmp113)
	  lw $t0, -236($fp)	# fill _tmp113 to $t0 from $fp-236
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -252($fp)	# spill _tmp117 from $t2 to $fp-252
	# _tmp118 = j < _tmp117
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -252($fp)	# fill _tmp117 to $t1 from $fp-252
	  slt $t2, $t0, $t1	
	  sw $t2, -256($fp)	# spill _tmp118 from $t2 to $fp-256
	# IfZ _tmp118 Goto _L27
	  lw $t0, -256($fp)	# fill _tmp118 to $t0 from $fp-256
	  beqz $t0, _L27	# branch if _tmp118 is zero 
	# Goto _L26
	  b _L26		# unconditional branch
  _L27:
	# PushParam _tmp114
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -240($fp)	# fill _tmp114 to $t0 from $fp-240
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L26:
	# _tmp119 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -260($fp)	# spill _tmp119 from $t2 to $fp-260
	# _tmp120 = j + _tmp119
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -260($fp)	# fill _tmp119 to $t1 from $fp-260
	  add $t2, $t0, $t1	
	  sw $t2, -264($fp)	# spill _tmp120 from $t2 to $fp-264
	# _tmp121 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -268($fp)	# spill _tmp121 from $t2 to $fp-268
	# _tmp122 = _tmp120 * _tmp121
	  lw $t0, -264($fp)	# fill _tmp120 to $t0 from $fp-264
	  lw $t1, -268($fp)	# fill _tmp121 to $t1 from $fp-268
	  mul $t2, $t0, $t1	
	  sw $t2, -272($fp)	# spill _tmp122 from $t2 to $fp-272
	# _tmp123 = _tmp113 + _tmp122
	  lw $t0, -236($fp)	# fill _tmp113 to $t0 from $fp-236
	  lw $t1, -272($fp)	# fill _tmp122 to $t1 from $fp-272
	  add $t2, $t0, $t1	
	  sw $t2, -276($fp)	# spill _tmp123 from $t2 to $fp-276
	# *(_tmp123) = _tmp100
	  lw $t0, -184($fp)	# fill _tmp100 to $t0 from $fp-184
	  lw $t2, -276($fp)	# fill _tmp123 to $t2 from $fp-276
	  sw $t0, 0($t2) 	# store with offset
	# _tmp124 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -280($fp)	# spill _tmp124 from $t2 to $fp-280
	# _tmp125 = j + _tmp124
	  lw $t0, -12($fp)	# fill j to $t0 from $fp-12
	  lw $t1, -280($fp)	# fill _tmp124 to $t1 from $fp-280
	  add $t2, $t0, $t1	
	  sw $t2, -284($fp)	# spill _tmp125 from $t2 to $fp-284
	# j = _tmp125
	  lw $t2, -284($fp)	# fill _tmp125 to $t2 from $fp-284
	  sw $t2, -12($fp)	# spill j from $t2 to $fp-12
	# Goto _L19
	  b _L19		# unconditional branch
  _L20:
	# _tmp126 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -288($fp)	# spill _tmp126 from $t2 to $fp-288
	# _tmp127 = i + _tmp126
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -288($fp)	# fill _tmp126 to $t1 from $fp-288
	  add $t2, $t0, $t1	
	  sw $t2, -292($fp)	# spill _tmp127 from $t2 to $fp-292
	# i = _tmp127
	  lw $t2, -292($fp)	# fill _tmp127 to $t2 from $fp-292
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# Goto _L17
	  b _L17		# unconditional branch
  _L18:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _DenseMatrix.Set:
	# BeginFunc 92
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 92	# decrement sp to make space for locals/temps
	# _tmp128 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -8($fp)	# spill _tmp128 from $t2 to $fp-8
	# _tmp129 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string8	# load label
	  sw $t2, -12($fp)	# spill _tmp129 from $t2 to $fp-12
	# _tmp130 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -16($fp)	# spill _tmp130 from $t2 to $fp-16
	# _tmp131 = _tmp128 == _tmp130
	  lw $t0, -8($fp)	# fill _tmp128 to $t0 from $fp-8
	  lw $t1, -16($fp)	# fill _tmp130 to $t1 from $fp-16
	  seq $t2, $t0, $t1	
	  sw $t2, -20($fp)	# spill _tmp131 from $t2 to $fp-20
	# IfZ _tmp131 Goto _L28
	  lw $t0, -20($fp)	# fill _tmp131 to $t0 from $fp-20
	  beqz $t0, _L28	# branch if _tmp131 is zero 
	# PushParam _tmp129
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp129 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L28:
	# _tmp132 = x < _tmp130
	  lw $t0, 8($fp)	# fill x to $t0 from $fp+8
	  lw $t1, -16($fp)	# fill _tmp130 to $t1 from $fp-16
	  slt $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp132 from $t2 to $fp-24
	# IfZ _tmp132 Goto _L29
	  lw $t0, -24($fp)	# fill _tmp132 to $t0 from $fp-24
	  beqz $t0, _L29	# branch if _tmp132 is zero 
	# PushParam _tmp129
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp129 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L29:
	# _tmp133 = *(_tmp128)
	  lw $t0, -8($fp)	# fill _tmp128 to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -28($fp)	# spill _tmp133 from $t2 to $fp-28
	# _tmp134 = x < _tmp133
	  lw $t0, 8($fp)	# fill x to $t0 from $fp+8
	  lw $t1, -28($fp)	# fill _tmp133 to $t1 from $fp-28
	  slt $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp134 from $t2 to $fp-32
	# IfZ _tmp134 Goto _L31
	  lw $t0, -32($fp)	# fill _tmp134 to $t0 from $fp-32
	  beqz $t0, _L31	# branch if _tmp134 is zero 
	# Goto _L30
	  b _L30		# unconditional branch
  _L31:
	# PushParam _tmp129
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp129 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L30:
	# _tmp135 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -36($fp)	# spill _tmp135 from $t2 to $fp-36
	# _tmp136 = x + _tmp135
	  lw $t0, 8($fp)	# fill x to $t0 from $fp+8
	  lw $t1, -36($fp)	# fill _tmp135 to $t1 from $fp-36
	  add $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp136 from $t2 to $fp-40
	# _tmp137 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -44($fp)	# spill _tmp137 from $t2 to $fp-44
	# _tmp138 = _tmp136 * _tmp137
	  lw $t0, -40($fp)	# fill _tmp136 to $t0 from $fp-40
	  lw $t1, -44($fp)	# fill _tmp137 to $t1 from $fp-44
	  mul $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp138 from $t2 to $fp-48
	# _tmp139 = _tmp128 + _tmp138
	  lw $t0, -8($fp)	# fill _tmp128 to $t0 from $fp-8
	  lw $t1, -48($fp)	# fill _tmp138 to $t1 from $fp-48
	  add $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp139 from $t2 to $fp-52
	# _tmp140 = *(_tmp139)
	  lw $t0, -52($fp)	# fill _tmp139 to $t0 from $fp-52
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -56($fp)	# spill _tmp140 from $t2 to $fp-56
	# _tmp141 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string9	# load label
	  sw $t2, -60($fp)	# spill _tmp141 from $t2 to $fp-60
	# _tmp142 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -64($fp)	# spill _tmp142 from $t2 to $fp-64
	# _tmp143 = y < _tmp142
	  lw $t0, 12($fp)	# fill y to $t0 from $fp+12
	  lw $t1, -64($fp)	# fill _tmp142 to $t1 from $fp-64
	  slt $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp143 from $t2 to $fp-68
	# IfZ _tmp143 Goto _L32
	  lw $t0, -68($fp)	# fill _tmp143 to $t0 from $fp-68
	  beqz $t0, _L32	# branch if _tmp143 is zero 
	# PushParam _tmp141
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -60($fp)	# fill _tmp141 to $t0 from $fp-60
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L32:
	# _tmp144 = *(_tmp140)
	  lw $t0, -56($fp)	# fill _tmp140 to $t0 from $fp-56
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -72($fp)	# spill _tmp144 from $t2 to $fp-72
	# _tmp145 = y < _tmp144
	  lw $t0, 12($fp)	# fill y to $t0 from $fp+12
	  lw $t1, -72($fp)	# fill _tmp144 to $t1 from $fp-72
	  slt $t2, $t0, $t1	
	  sw $t2, -76($fp)	# spill _tmp145 from $t2 to $fp-76
	# IfZ _tmp145 Goto _L34
	  lw $t0, -76($fp)	# fill _tmp145 to $t0 from $fp-76
	  beqz $t0, _L34	# branch if _tmp145 is zero 
	# Goto _L33
	  b _L33		# unconditional branch
  _L34:
	# PushParam _tmp141
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -60($fp)	# fill _tmp141 to $t0 from $fp-60
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L33:
	# _tmp146 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -80($fp)	# spill _tmp146 from $t2 to $fp-80
	# _tmp147 = y + _tmp146
	  lw $t0, 12($fp)	# fill y to $t0 from $fp+12
	  lw $t1, -80($fp)	# fill _tmp146 to $t1 from $fp-80
	  add $t2, $t0, $t1	
	  sw $t2, -84($fp)	# spill _tmp147 from $t2 to $fp-84
	# _tmp148 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -88($fp)	# spill _tmp148 from $t2 to $fp-88
	# _tmp149 = _tmp147 * _tmp148
	  lw $t0, -84($fp)	# fill _tmp147 to $t0 from $fp-84
	  lw $t1, -88($fp)	# fill _tmp148 to $t1 from $fp-88
	  mul $t2, $t0, $t1	
	  sw $t2, -92($fp)	# spill _tmp149 from $t2 to $fp-92
	# _tmp150 = _tmp140 + _tmp149
	  lw $t0, -56($fp)	# fill _tmp140 to $t0 from $fp-56
	  lw $t1, -92($fp)	# fill _tmp149 to $t1 from $fp-92
	  add $t2, $t0, $t1	
	  sw $t2, -96($fp)	# spill _tmp150 from $t2 to $fp-96
	# *(_tmp150) = value
	  lw $t0, 16($fp)	# fill value to $t0 from $fp+16
	  lw $t2, -96($fp)	# fill _tmp150 to $t2 from $fp-96
	  sw $t0, 0($t2) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _DenseMatrix.Get:
	# BeginFunc 100
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 100	# decrement sp to make space for locals/temps
	# _tmp151 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -8($fp)	# spill _tmp151 from $t2 to $fp-8
	# _tmp152 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string10	# load label
	  sw $t2, -12($fp)	# spill _tmp152 from $t2 to $fp-12
	# _tmp153 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -16($fp)	# spill _tmp153 from $t2 to $fp-16
	# _tmp154 = _tmp151 == _tmp153
	  lw $t0, -8($fp)	# fill _tmp151 to $t0 from $fp-8
	  lw $t1, -16($fp)	# fill _tmp153 to $t1 from $fp-16
	  seq $t2, $t0, $t1	
	  sw $t2, -20($fp)	# spill _tmp154 from $t2 to $fp-20
	# IfZ _tmp154 Goto _L35
	  lw $t0, -20($fp)	# fill _tmp154 to $t0 from $fp-20
	  beqz $t0, _L35	# branch if _tmp154 is zero 
	# PushParam _tmp152
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp152 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L35:
	# _tmp155 = x < _tmp153
	  lw $t0, 8($fp)	# fill x to $t0 from $fp+8
	  lw $t1, -16($fp)	# fill _tmp153 to $t1 from $fp-16
	  slt $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp155 from $t2 to $fp-24
	# IfZ _tmp155 Goto _L36
	  lw $t0, -24($fp)	# fill _tmp155 to $t0 from $fp-24
	  beqz $t0, _L36	# branch if _tmp155 is zero 
	# PushParam _tmp152
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp152 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L36:
	# _tmp156 = *(_tmp151)
	  lw $t0, -8($fp)	# fill _tmp151 to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -28($fp)	# spill _tmp156 from $t2 to $fp-28
	# _tmp157 = x < _tmp156
	  lw $t0, 8($fp)	# fill x to $t0 from $fp+8
	  lw $t1, -28($fp)	# fill _tmp156 to $t1 from $fp-28
	  slt $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp157 from $t2 to $fp-32
	# IfZ _tmp157 Goto _L38
	  lw $t0, -32($fp)	# fill _tmp157 to $t0 from $fp-32
	  beqz $t0, _L38	# branch if _tmp157 is zero 
	# Goto _L37
	  b _L37		# unconditional branch
  _L38:
	# PushParam _tmp152
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp152 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L37:
	# _tmp158 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -36($fp)	# spill _tmp158 from $t2 to $fp-36
	# _tmp159 = x + _tmp158
	  lw $t0, 8($fp)	# fill x to $t0 from $fp+8
	  lw $t1, -36($fp)	# fill _tmp158 to $t1 from $fp-36
	  add $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp159 from $t2 to $fp-40
	# _tmp160 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -44($fp)	# spill _tmp160 from $t2 to $fp-44
	# _tmp161 = _tmp159 * _tmp160
	  lw $t0, -40($fp)	# fill _tmp159 to $t0 from $fp-40
	  lw $t1, -44($fp)	# fill _tmp160 to $t1 from $fp-44
	  mul $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp161 from $t2 to $fp-48
	# _tmp162 = _tmp151 + _tmp161
	  lw $t0, -8($fp)	# fill _tmp151 to $t0 from $fp-8
	  lw $t1, -48($fp)	# fill _tmp161 to $t1 from $fp-48
	  add $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp162 from $t2 to $fp-52
	# _tmp163 = *(_tmp162)
	  lw $t0, -52($fp)	# fill _tmp162 to $t0 from $fp-52
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -56($fp)	# spill _tmp163 from $t2 to $fp-56
	# _tmp164 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string11: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string11	# load label
	  sw $t2, -60($fp)	# spill _tmp164 from $t2 to $fp-60
	# _tmp165 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -64($fp)	# spill _tmp165 from $t2 to $fp-64
	# _tmp166 = _tmp163 == _tmp165
	  lw $t0, -56($fp)	# fill _tmp163 to $t0 from $fp-56
	  lw $t1, -64($fp)	# fill _tmp165 to $t1 from $fp-64
	  seq $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp166 from $t2 to $fp-68
	# IfZ _tmp166 Goto _L39
	  lw $t0, -68($fp)	# fill _tmp166 to $t0 from $fp-68
	  beqz $t0, _L39	# branch if _tmp166 is zero 
	# PushParam _tmp164
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -60($fp)	# fill _tmp164 to $t0 from $fp-60
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L39:
	# _tmp167 = y < _tmp165
	  lw $t0, 12($fp)	# fill y to $t0 from $fp+12
	  lw $t1, -64($fp)	# fill _tmp165 to $t1 from $fp-64
	  slt $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp167 from $t2 to $fp-72
	# IfZ _tmp167 Goto _L40
	  lw $t0, -72($fp)	# fill _tmp167 to $t0 from $fp-72
	  beqz $t0, _L40	# branch if _tmp167 is zero 
	# PushParam _tmp164
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -60($fp)	# fill _tmp164 to $t0 from $fp-60
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L40:
	# _tmp168 = *(_tmp163)
	  lw $t0, -56($fp)	# fill _tmp163 to $t0 from $fp-56
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -76($fp)	# spill _tmp168 from $t2 to $fp-76
	# _tmp169 = y < _tmp168
	  lw $t0, 12($fp)	# fill y to $t0 from $fp+12
	  lw $t1, -76($fp)	# fill _tmp168 to $t1 from $fp-76
	  slt $t2, $t0, $t1	
	  sw $t2, -80($fp)	# spill _tmp169 from $t2 to $fp-80
	# IfZ _tmp169 Goto _L42
	  lw $t0, -80($fp)	# fill _tmp169 to $t0 from $fp-80
	  beqz $t0, _L42	# branch if _tmp169 is zero 
	# Goto _L41
	  b _L41		# unconditional branch
  _L42:
	# PushParam _tmp164
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -60($fp)	# fill _tmp164 to $t0 from $fp-60
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L41:
	# _tmp170 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -84($fp)	# spill _tmp170 from $t2 to $fp-84
	# _tmp171 = y + _tmp170
	  lw $t0, 12($fp)	# fill y to $t0 from $fp+12
	  lw $t1, -84($fp)	# fill _tmp170 to $t1 from $fp-84
	  add $t2, $t0, $t1	
	  sw $t2, -88($fp)	# spill _tmp171 from $t2 to $fp-88
	# _tmp172 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -92($fp)	# spill _tmp172 from $t2 to $fp-92
	# _tmp173 = _tmp171 * _tmp172
	  lw $t0, -88($fp)	# fill _tmp171 to $t0 from $fp-88
	  lw $t1, -92($fp)	# fill _tmp172 to $t1 from $fp-92
	  mul $t2, $t0, $t1	
	  sw $t2, -96($fp)	# spill _tmp173 from $t2 to $fp-96
	# _tmp174 = _tmp163 + _tmp173
	  lw $t0, -56($fp)	# fill _tmp163 to $t0 from $fp-56
	  lw $t1, -96($fp)	# fill _tmp173 to $t1 from $fp-96
	  add $t2, $t0, $t1	
	  sw $t2, -100($fp)	# spill _tmp174 from $t2 to $fp-100
	# _tmp175 = *(_tmp174)
	  lw $t0, -100($fp)	# fill _tmp174 to $t0 from $fp-100
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -104($fp)	# spill _tmp175 from $t2 to $fp-104
	# Return _tmp175
	  lw $t2, -104($fp)	# fill _tmp175 to $t2 from $fp-104
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
	# VTable for class SparseItem
	  .data
	  .align 2
	  SparseItem:		# label for class SparseItem vtable
	  .word _SparseItem.Init
	  .word _SparseItem.GetNext
	  .word _SparseItem.GetY
	  .word _SparseItem.GetData
	  .word _SparseItem.SetData
	  .text
  _SparseItem.Init:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 4) = d
	  lw $t0, 8($fp)	# fill d to $t0 from $fp+8
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 4($t2) 	# store with offset
	# *(this + 8) = y
	  lw $t0, 12($fp)	# fill y to $t0 from $fp+12
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 8($t2) 	# store with offset
	# *(this + 12) = next
	  lw $t0, 16($fp)	# fill next to $t0 from $fp+16
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 12($t2) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _SparseItem.GetNext:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp176 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -8($fp)	# spill _tmp176 from $t2 to $fp-8
	# Return _tmp176
	  lw $t2, -8($fp)	# fill _tmp176 to $t2 from $fp-8
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
  _SparseItem.GetY:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp177 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -8($fp)	# spill _tmp177 from $t2 to $fp-8
	# Return _tmp177
	  lw $t2, -8($fp)	# fill _tmp177 to $t2 from $fp-8
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
  _SparseItem.GetData:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp178 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -8($fp)	# spill _tmp178 from $t2 to $fp-8
	# Return _tmp178
	  lw $t2, -8($fp)	# fill _tmp178 to $t2 from $fp-8
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
  _SparseItem.SetData:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 4) = val
	  lw $t0, 8($fp)	# fill val to $t0 from $fp+8
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 4($t2) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class SparseMatrix
	  .data
	  .align 2
	  SparseMatrix:		# label for class SparseMatrix vtable
	  .word _SparseMatrix.Init
	  .word _SparseMatrix.Set
	  .word _SparseMatrix.Get
	  .word _Matrix.PrintMatrix
	  .word _Matrix.SeedMatrix
	  .word _SparseMatrix.Find
	  .text
  _SparseMatrix.Init:
	# BeginFunc 112
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 112	# decrement sp to make space for locals/temps
	# _tmp179 = 10
	  li $t2, 10		# load constant value 10 into $t2
	  sw $t2, -12($fp)	# spill _tmp179 from $t2 to $fp-12
	# _tmp180 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -16($fp)	# spill _tmp180 from $t2 to $fp-16
	# _tmp181 = _tmp179 < _tmp180
	  lw $t0, -12($fp)	# fill _tmp179 to $t0 from $fp-12
	  lw $t1, -16($fp)	# fill _tmp180 to $t1 from $fp-16
	  slt $t2, $t0, $t1	
	  sw $t2, -20($fp)	# spill _tmp181 from $t2 to $fp-20
	# IfZ _tmp181 Goto _L43
	  lw $t0, -20($fp)	# fill _tmp181 to $t0 from $fp-20
	  beqz $t0, _L43	# branch if _tmp181 is zero 
	# _tmp182 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string12: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t2, _string12	# load label
	  sw $t2, -24($fp)	# spill _tmp182 from $t2 to $fp-24
	# PushParam _tmp182
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp182 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L43:
	# _tmp183 = _tmp179 == _tmp180
	  lw $t0, -12($fp)	# fill _tmp179 to $t0 from $fp-12
	  lw $t1, -16($fp)	# fill _tmp180 to $t1 from $fp-16
	  seq $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp183 from $t2 to $fp-28
	# IfZ _tmp183 Goto _L44
	  lw $t0, -28($fp)	# fill _tmp183 to $t0 from $fp-28
	  beqz $t0, _L44	# branch if _tmp183 is zero 
	# PushParam _tmp182
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp182 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L44:
	# _tmp184 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -32($fp)	# spill _tmp184 from $t2 to $fp-32
	# _tmp185 = _tmp179 + _tmp184
	  lw $t0, -12($fp)	# fill _tmp179 to $t0 from $fp-12
	  lw $t1, -32($fp)	# fill _tmp184 to $t1 from $fp-32
	  add $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp185 from $t2 to $fp-36
	# _tmp186 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -40($fp)	# spill _tmp186 from $t2 to $fp-40
	# _tmp187 = _tmp185 * _tmp186
	  lw $t0, -36($fp)	# fill _tmp185 to $t0 from $fp-36
	  lw $t1, -40($fp)	# fill _tmp186 to $t1 from $fp-40
	  mul $t2, $t0, $t1	
	  sw $t2, -44($fp)	# spill _tmp187 from $t2 to $fp-44
	# PushParam _tmp187
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -44($fp)	# fill _tmp187 to $t0 from $fp-44
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp188 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -48($fp)	# spill _tmp188 from $t2 to $fp-48
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp188) = _tmp179
	  lw $t0, -12($fp)	# fill _tmp179 to $t0 from $fp-12
	  lw $t2, -48($fp)	# fill _tmp188 to $t2 from $fp-48
	  sw $t0, 0($t2) 	# store with offset
	# *(this + 4) = _tmp188
	  lw $t0, -48($fp)	# fill _tmp188 to $t0 from $fp-48
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 4($t2) 	# store with offset
	# _tmp189 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -52($fp)	# spill _tmp189 from $t2 to $fp-52
	# i = _tmp189
	  lw $t2, -52($fp)	# fill _tmp189 to $t2 from $fp-52
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  _L45:
	# _tmp190 = 10
	  li $t2, 10		# load constant value 10 into $t2
	  sw $t2, -56($fp)	# spill _tmp190 from $t2 to $fp-56
	# _tmp191 = i < _tmp190
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -56($fp)	# fill _tmp190 to $t1 from $fp-56
	  slt $t2, $t0, $t1	
	  sw $t2, -60($fp)	# spill _tmp191 from $t2 to $fp-60
	# IfZ _tmp191 Goto _L46
	  lw $t0, -60($fp)	# fill _tmp191 to $t0 from $fp-60
	  beqz $t0, _L46	# branch if _tmp191 is zero 
	# _tmp192 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -64($fp)	# spill _tmp192 from $t2 to $fp-64
	# _tmp193 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -68($fp)	# spill _tmp193 from $t2 to $fp-68
	# _tmp194 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string13: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string13	# load label
	  sw $t2, -72($fp)	# spill _tmp194 from $t2 to $fp-72
	# _tmp195 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -76($fp)	# spill _tmp195 from $t2 to $fp-76
	# _tmp196 = i < _tmp195
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -76($fp)	# fill _tmp195 to $t1 from $fp-76
	  slt $t2, $t0, $t1	
	  sw $t2, -80($fp)	# spill _tmp196 from $t2 to $fp-80
	# IfZ _tmp196 Goto _L47
	  lw $t0, -80($fp)	# fill _tmp196 to $t0 from $fp-80
	  beqz $t0, _L47	# branch if _tmp196 is zero 
	# PushParam _tmp194
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -72($fp)	# fill _tmp194 to $t0 from $fp-72
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L47:
	# _tmp197 = *(_tmp193)
	  lw $t0, -68($fp)	# fill _tmp193 to $t0 from $fp-68
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -84($fp)	# spill _tmp197 from $t2 to $fp-84
	# _tmp198 = i < _tmp197
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -84($fp)	# fill _tmp197 to $t1 from $fp-84
	  slt $t2, $t0, $t1	
	  sw $t2, -88($fp)	# spill _tmp198 from $t2 to $fp-88
	# IfZ _tmp198 Goto _L49
	  lw $t0, -88($fp)	# fill _tmp198 to $t0 from $fp-88
	  beqz $t0, _L49	# branch if _tmp198 is zero 
	# Goto _L48
	  b _L48		# unconditional branch
  _L49:
	# PushParam _tmp194
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -72($fp)	# fill _tmp194 to $t0 from $fp-72
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L48:
	# _tmp199 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -92($fp)	# spill _tmp199 from $t2 to $fp-92
	# _tmp200 = i + _tmp199
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -92($fp)	# fill _tmp199 to $t1 from $fp-92
	  add $t2, $t0, $t1	
	  sw $t2, -96($fp)	# spill _tmp200 from $t2 to $fp-96
	# _tmp201 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -100($fp)	# spill _tmp201 from $t2 to $fp-100
	# _tmp202 = _tmp200 * _tmp201
	  lw $t0, -96($fp)	# fill _tmp200 to $t0 from $fp-96
	  lw $t1, -100($fp)	# fill _tmp201 to $t1 from $fp-100
	  mul $t2, $t0, $t1	
	  sw $t2, -104($fp)	# spill _tmp202 from $t2 to $fp-104
	# _tmp203 = _tmp193 + _tmp202
	  lw $t0, -68($fp)	# fill _tmp193 to $t0 from $fp-68
	  lw $t1, -104($fp)	# fill _tmp202 to $t1 from $fp-104
	  add $t2, $t0, $t1	
	  sw $t2, -108($fp)	# spill _tmp203 from $t2 to $fp-108
	# *(_tmp203) = _tmp192
	  lw $t0, -64($fp)	# fill _tmp192 to $t0 from $fp-64
	  lw $t2, -108($fp)	# fill _tmp203 to $t2 from $fp-108
	  sw $t0, 0($t2) 	# store with offset
	# _tmp204 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -112($fp)	# spill _tmp204 from $t2 to $fp-112
	# _tmp205 = i + _tmp204
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -112($fp)	# fill _tmp204 to $t1 from $fp-112
	  add $t2, $t0, $t1	
	  sw $t2, -116($fp)	# spill _tmp205 from $t2 to $fp-116
	# i = _tmp205
	  lw $t2, -116($fp)	# fill _tmp205 to $t2 from $fp-116
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# Goto _L45
	  b _L45		# unconditional branch
  _L46:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _SparseMatrix.Find:
	# BeginFunc 104
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 104	# decrement sp to make space for locals/temps
	# _tmp206 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp206 from $t2 to $fp-12
	# _tmp207 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string14: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string14	# load label
	  sw $t2, -16($fp)	# spill _tmp207 from $t2 to $fp-16
	# _tmp208 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -20($fp)	# spill _tmp208 from $t2 to $fp-20
	# _tmp209 = _tmp206 == _tmp208
	  lw $t0, -12($fp)	# fill _tmp206 to $t0 from $fp-12
	  lw $t1, -20($fp)	# fill _tmp208 to $t1 from $fp-20
	  seq $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp209 from $t2 to $fp-24
	# IfZ _tmp209 Goto _L50
	  lw $t0, -24($fp)	# fill _tmp209 to $t0 from $fp-24
	  beqz $t0, _L50	# branch if _tmp209 is zero 
	# PushParam _tmp207
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp207 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L50:
	# _tmp210 = x < _tmp208
	  lw $t0, 8($fp)	# fill x to $t0 from $fp+8
	  lw $t1, -20($fp)	# fill _tmp208 to $t1 from $fp-20
	  slt $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp210 from $t2 to $fp-28
	# IfZ _tmp210 Goto _L51
	  lw $t0, -28($fp)	# fill _tmp210 to $t0 from $fp-28
	  beqz $t0, _L51	# branch if _tmp210 is zero 
	# PushParam _tmp207
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp207 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L51:
	# _tmp211 = *(_tmp206)
	  lw $t0, -12($fp)	# fill _tmp206 to $t0 from $fp-12
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -32($fp)	# spill _tmp211 from $t2 to $fp-32
	# _tmp212 = x < _tmp211
	  lw $t0, 8($fp)	# fill x to $t0 from $fp+8
	  lw $t1, -32($fp)	# fill _tmp211 to $t1 from $fp-32
	  slt $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp212 from $t2 to $fp-36
	# IfZ _tmp212 Goto _L53
	  lw $t0, -36($fp)	# fill _tmp212 to $t0 from $fp-36
	  beqz $t0, _L53	# branch if _tmp212 is zero 
	# Goto _L52
	  b _L52		# unconditional branch
  _L53:
	# PushParam _tmp207
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp207 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L52:
	# _tmp213 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -40($fp)	# spill _tmp213 from $t2 to $fp-40
	# _tmp214 = x + _tmp213
	  lw $t0, 8($fp)	# fill x to $t0 from $fp+8
	  lw $t1, -40($fp)	# fill _tmp213 to $t1 from $fp-40
	  add $t2, $t0, $t1	
	  sw $t2, -44($fp)	# spill _tmp214 from $t2 to $fp-44
	# _tmp215 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -48($fp)	# spill _tmp215 from $t2 to $fp-48
	# _tmp216 = _tmp214 * _tmp215
	  lw $t0, -44($fp)	# fill _tmp214 to $t0 from $fp-44
	  lw $t1, -48($fp)	# fill _tmp215 to $t1 from $fp-48
	  mul $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp216 from $t2 to $fp-52
	# _tmp217 = _tmp206 + _tmp216
	  lw $t0, -12($fp)	# fill _tmp206 to $t0 from $fp-12
	  lw $t1, -52($fp)	# fill _tmp216 to $t1 from $fp-52
	  add $t2, $t0, $t1	
	  sw $t2, -56($fp)	# spill _tmp217 from $t2 to $fp-56
	# _tmp218 = *(_tmp217)
	  lw $t0, -56($fp)	# fill _tmp217 to $t0 from $fp-56
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -60($fp)	# spill _tmp218 from $t2 to $fp-60
	# elem = _tmp218
	  lw $t2, -60($fp)	# fill _tmp218 to $t2 from $fp-60
	  sw $t2, -8($fp)	# spill elem from $t2 to $fp-8
  _L54:
	# _tmp219 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -64($fp)	# spill _tmp219 from $t2 to $fp-64
	# _tmp220 = elem == _tmp219
	  lw $t0, -8($fp)	# fill elem to $t0 from $fp-8
	  lw $t1, -64($fp)	# fill _tmp219 to $t1 from $fp-64
	  seq $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp220 from $t2 to $fp-68
	# _tmp221 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -72($fp)	# spill _tmp221 from $t2 to $fp-72
	# _tmp222 = _tmp221 - _tmp220
	  lw $t0, -72($fp)	# fill _tmp221 to $t0 from $fp-72
	  lw $t1, -68($fp)	# fill _tmp220 to $t1 from $fp-68
	  sub $t2, $t0, $t1	
	  sw $t2, -76($fp)	# spill _tmp222 from $t2 to $fp-76
	# IfZ _tmp222 Goto _L55
	  lw $t0, -76($fp)	# fill _tmp222 to $t0 from $fp-76
	  beqz $t0, _L55	# branch if _tmp222 is zero 
	# PushParam elem
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill elem to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp223 = *(elem)
	  lw $t0, -8($fp)	# fill elem to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -80($fp)	# spill _tmp223 from $t2 to $fp-80
	# _tmp224 = *(_tmp223 + 8)
	  lw $t0, -80($fp)	# fill _tmp223 to $t0 from $fp-80
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -84($fp)	# spill _tmp224 from $t2 to $fp-84
	# _tmp225 = ACall _tmp224
	  lw $t0, -84($fp)	# fill _tmp224 to $t0 from $fp-84
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -88($fp)	# spill _tmp225 from $t2 to $fp-88
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp226 = _tmp225 == y
	  lw $t0, -88($fp)	# fill _tmp225 to $t0 from $fp-88
	  lw $t1, 12($fp)	# fill y to $t1 from $fp+12
	  seq $t2, $t0, $t1	
	  sw $t2, -92($fp)	# spill _tmp226 from $t2 to $fp-92
	# IfZ _tmp226 Goto _L56
	  lw $t0, -92($fp)	# fill _tmp226 to $t0 from $fp-92
	  beqz $t0, _L56	# branch if _tmp226 is zero 
	# Return elem
	  lw $t2, -8($fp)	# fill elem to $t2 from $fp-8
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto _L57
	  b _L57		# unconditional branch
  _L56:
  _L57:
	# PushParam elem
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill elem to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp227 = *(elem)
	  lw $t0, -8($fp)	# fill elem to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -96($fp)	# spill _tmp227 from $t2 to $fp-96
	# _tmp228 = *(_tmp227 + 4)
	  lw $t0, -96($fp)	# fill _tmp227 to $t0 from $fp-96
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -100($fp)	# spill _tmp228 from $t2 to $fp-100
	# _tmp229 = ACall _tmp228
	  lw $t0, -100($fp)	# fill _tmp228 to $t0 from $fp-100
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -104($fp)	# spill _tmp229 from $t2 to $fp-104
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# elem = _tmp229
	  lw $t2, -104($fp)	# fill _tmp229 to $t2 from $fp-104
	  sw $t2, -8($fp)	# spill elem from $t2 to $fp-8
	# Goto _L54
	  b _L54		# unconditional branch
  _L55:
	# _tmp230 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -108($fp)	# spill _tmp230 from $t2 to $fp-108
	# Return _tmp230
	  lw $t2, -108($fp)	# fill _tmp230 to $t2 from $fp-108
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
  _SparseMatrix.Set:
	# BeginFunc 156
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 156	# decrement sp to make space for locals/temps
	# PushParam y
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 12($fp)	# fill y to $t0 from $fp+12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam x
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill x to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp231 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp231 from $t2 to $fp-12
	# _tmp232 = *(_tmp231 + 20)
	  lw $t0, -12($fp)	# fill _tmp231 to $t0 from $fp-12
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp232 from $t2 to $fp-16
	# _tmp233 = ACall _tmp232
	  lw $t0, -16($fp)	# fill _tmp232 to $t0 from $fp-16
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -20($fp)	# spill _tmp233 from $t2 to $fp-20
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# elem = _tmp233
	  lw $t2, -20($fp)	# fill _tmp233 to $t2 from $fp-20
	  sw $t2, -8($fp)	# spill elem from $t2 to $fp-8
	# _tmp234 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -24($fp)	# spill _tmp234 from $t2 to $fp-24
	# _tmp235 = elem == _tmp234
	  lw $t0, -8($fp)	# fill elem to $t0 from $fp-8
	  lw $t1, -24($fp)	# fill _tmp234 to $t1 from $fp-24
	  seq $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp235 from $t2 to $fp-28
	# _tmp236 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -32($fp)	# spill _tmp236 from $t2 to $fp-32
	# _tmp237 = _tmp236 - _tmp235
	  lw $t0, -32($fp)	# fill _tmp236 to $t0 from $fp-32
	  lw $t1, -28($fp)	# fill _tmp235 to $t1 from $fp-28
	  sub $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp237 from $t2 to $fp-36
	# IfZ _tmp237 Goto _L58
	  lw $t0, -36($fp)	# fill _tmp237 to $t0 from $fp-36
	  beqz $t0, _L58	# branch if _tmp237 is zero 
	# PushParam value
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 16($fp)	# fill value to $t0 from $fp+16
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam elem
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill elem to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp238 = *(elem)
	  lw $t0, -8($fp)	# fill elem to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -40($fp)	# spill _tmp238 from $t2 to $fp-40
	# _tmp239 = *(_tmp238 + 16)
	  lw $t0, -40($fp)	# fill _tmp238 to $t0 from $fp-40
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -44($fp)	# spill _tmp239 from $t2 to $fp-44
	# ACall _tmp239
	  lw $t0, -44($fp)	# fill _tmp239 to $t0 from $fp-44
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# Goto _L59
	  b _L59		# unconditional branch
  _L58:
	# _tmp240 = 16
	  li $t2, 16		# load constant value 16 into $t2
	  sw $t2, -48($fp)	# spill _tmp240 from $t2 to $fp-48
	# PushParam _tmp240
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -48($fp)	# fill _tmp240 to $t0 from $fp-48
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp241 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -52($fp)	# spill _tmp241 from $t2 to $fp-52
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp242 = SparseItem
	  la $t2, SparseItem	# load label
	  sw $t2, -56($fp)	# spill _tmp242 from $t2 to $fp-56
	# *(_tmp241) = _tmp242
	  lw $t0, -56($fp)	# fill _tmp242 to $t0 from $fp-56
	  lw $t2, -52($fp)	# fill _tmp241 to $t2 from $fp-52
	  sw $t0, 0($t2) 	# store with offset
	# elem = _tmp241
	  lw $t2, -52($fp)	# fill _tmp241 to $t2 from $fp-52
	  sw $t2, -8($fp)	# spill elem from $t2 to $fp-8
	# _tmp243 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -60($fp)	# spill _tmp243 from $t2 to $fp-60
	# _tmp244 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string15: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string15	# load label
	  sw $t2, -64($fp)	# spill _tmp244 from $t2 to $fp-64
	# _tmp245 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -68($fp)	# spill _tmp245 from $t2 to $fp-68
	# _tmp246 = _tmp243 == _tmp245
	  lw $t0, -60($fp)	# fill _tmp243 to $t0 from $fp-60
	  lw $t1, -68($fp)	# fill _tmp245 to $t1 from $fp-68
	  seq $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp246 from $t2 to $fp-72
	# IfZ _tmp246 Goto _L60
	  lw $t0, -72($fp)	# fill _tmp246 to $t0 from $fp-72
	  beqz $t0, _L60	# branch if _tmp246 is zero 
	# PushParam _tmp244
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -64($fp)	# fill _tmp244 to $t0 from $fp-64
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L60:
	# _tmp247 = x < _tmp245
	  lw $t0, 8($fp)	# fill x to $t0 from $fp+8
	  lw $t1, -68($fp)	# fill _tmp245 to $t1 from $fp-68
	  slt $t2, $t0, $t1	
	  sw $t2, -76($fp)	# spill _tmp247 from $t2 to $fp-76
	# IfZ _tmp247 Goto _L61
	  lw $t0, -76($fp)	# fill _tmp247 to $t0 from $fp-76
	  beqz $t0, _L61	# branch if _tmp247 is zero 
	# PushParam _tmp244
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -64($fp)	# fill _tmp244 to $t0 from $fp-64
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L61:
	# _tmp248 = *(_tmp243)
	  lw $t0, -60($fp)	# fill _tmp243 to $t0 from $fp-60
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -80($fp)	# spill _tmp248 from $t2 to $fp-80
	# _tmp249 = x < _tmp248
	  lw $t0, 8($fp)	# fill x to $t0 from $fp+8
	  lw $t1, -80($fp)	# fill _tmp248 to $t1 from $fp-80
	  slt $t2, $t0, $t1	
	  sw $t2, -84($fp)	# spill _tmp249 from $t2 to $fp-84
	# IfZ _tmp249 Goto _L63
	  lw $t0, -84($fp)	# fill _tmp249 to $t0 from $fp-84
	  beqz $t0, _L63	# branch if _tmp249 is zero 
	# Goto _L62
	  b _L62		# unconditional branch
  _L63:
	# PushParam _tmp244
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -64($fp)	# fill _tmp244 to $t0 from $fp-64
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L62:
	# _tmp250 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -88($fp)	# spill _tmp250 from $t2 to $fp-88
	# _tmp251 = x + _tmp250
	  lw $t0, 8($fp)	# fill x to $t0 from $fp+8
	  lw $t1, -88($fp)	# fill _tmp250 to $t1 from $fp-88
	  add $t2, $t0, $t1	
	  sw $t2, -92($fp)	# spill _tmp251 from $t2 to $fp-92
	# _tmp252 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -96($fp)	# spill _tmp252 from $t2 to $fp-96
	# _tmp253 = _tmp251 * _tmp252
	  lw $t0, -92($fp)	# fill _tmp251 to $t0 from $fp-92
	  lw $t1, -96($fp)	# fill _tmp252 to $t1 from $fp-96
	  mul $t2, $t0, $t1	
	  sw $t2, -100($fp)	# spill _tmp253 from $t2 to $fp-100
	# _tmp254 = _tmp243 + _tmp253
	  lw $t0, -60($fp)	# fill _tmp243 to $t0 from $fp-60
	  lw $t1, -100($fp)	# fill _tmp253 to $t1 from $fp-100
	  add $t2, $t0, $t1	
	  sw $t2, -104($fp)	# spill _tmp254 from $t2 to $fp-104
	# _tmp255 = *(_tmp254)
	  lw $t0, -104($fp)	# fill _tmp254 to $t0 from $fp-104
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -108($fp)	# spill _tmp255 from $t2 to $fp-108
	# PushParam _tmp255
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -108($fp)	# fill _tmp255 to $t0 from $fp-108
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam y
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 12($fp)	# fill y to $t0 from $fp+12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam value
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 16($fp)	# fill value to $t0 from $fp+16
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam elem
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill elem to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp256 = *(elem)
	  lw $t0, -8($fp)	# fill elem to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -112($fp)	# spill _tmp256 from $t2 to $fp-112
	# _tmp257 = *(_tmp256)
	  lw $t0, -112($fp)	# fill _tmp256 to $t0 from $fp-112
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -116($fp)	# spill _tmp257 from $t2 to $fp-116
	# ACall _tmp257
	  lw $t0, -116($fp)	# fill _tmp257 to $t0 from $fp-116
	  jalr $t0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp258 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -120($fp)	# spill _tmp258 from $t2 to $fp-120
	# _tmp259 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string16: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string16	# load label
	  sw $t2, -124($fp)	# spill _tmp259 from $t2 to $fp-124
	# _tmp260 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -128($fp)	# spill _tmp260 from $t2 to $fp-128
	# _tmp261 = x < _tmp260
	  lw $t0, 8($fp)	# fill x to $t0 from $fp+8
	  lw $t1, -128($fp)	# fill _tmp260 to $t1 from $fp-128
	  slt $t2, $t0, $t1	
	  sw $t2, -132($fp)	# spill _tmp261 from $t2 to $fp-132
	# IfZ _tmp261 Goto _L64
	  lw $t0, -132($fp)	# fill _tmp261 to $t0 from $fp-132
	  beqz $t0, _L64	# branch if _tmp261 is zero 
	# PushParam _tmp259
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -124($fp)	# fill _tmp259 to $t0 from $fp-124
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L64:
	# _tmp262 = *(_tmp258)
	  lw $t0, -120($fp)	# fill _tmp258 to $t0 from $fp-120
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -136($fp)	# spill _tmp262 from $t2 to $fp-136
	# _tmp263 = x < _tmp262
	  lw $t0, 8($fp)	# fill x to $t0 from $fp+8
	  lw $t1, -136($fp)	# fill _tmp262 to $t1 from $fp-136
	  slt $t2, $t0, $t1	
	  sw $t2, -140($fp)	# spill _tmp263 from $t2 to $fp-140
	# IfZ _tmp263 Goto _L66
	  lw $t0, -140($fp)	# fill _tmp263 to $t0 from $fp-140
	  beqz $t0, _L66	# branch if _tmp263 is zero 
	# Goto _L65
	  b _L65		# unconditional branch
  _L66:
	# PushParam _tmp259
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -124($fp)	# fill _tmp259 to $t0 from $fp-124
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L65:
	# _tmp264 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -144($fp)	# spill _tmp264 from $t2 to $fp-144
	# _tmp265 = x + _tmp264
	  lw $t0, 8($fp)	# fill x to $t0 from $fp+8
	  lw $t1, -144($fp)	# fill _tmp264 to $t1 from $fp-144
	  add $t2, $t0, $t1	
	  sw $t2, -148($fp)	# spill _tmp265 from $t2 to $fp-148
	# _tmp266 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -152($fp)	# spill _tmp266 from $t2 to $fp-152
	# _tmp267 = _tmp265 * _tmp266
	  lw $t0, -148($fp)	# fill _tmp265 to $t0 from $fp-148
	  lw $t1, -152($fp)	# fill _tmp266 to $t1 from $fp-152
	  mul $t2, $t0, $t1	
	  sw $t2, -156($fp)	# spill _tmp267 from $t2 to $fp-156
	# _tmp268 = _tmp258 + _tmp267
	  lw $t0, -120($fp)	# fill _tmp258 to $t0 from $fp-120
	  lw $t1, -156($fp)	# fill _tmp267 to $t1 from $fp-156
	  add $t2, $t0, $t1	
	  sw $t2, -160($fp)	# spill _tmp268 from $t2 to $fp-160
	# *(_tmp268) = elem
	  lw $t0, -8($fp)	# fill elem to $t0 from $fp-8
	  lw $t2, -160($fp)	# fill _tmp268 to $t2 from $fp-160
	  sw $t0, 0($t2) 	# store with offset
  _L59:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _SparseMatrix.Get:
	# BeginFunc 48
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 48	# decrement sp to make space for locals/temps
	# PushParam y
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 12($fp)	# fill y to $t0 from $fp+12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam x
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill x to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp269 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp269 from $t2 to $fp-12
	# _tmp270 = *(_tmp269 + 20)
	  lw $t0, -12($fp)	# fill _tmp269 to $t0 from $fp-12
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp270 from $t2 to $fp-16
	# _tmp271 = ACall _tmp270
	  lw $t0, -16($fp)	# fill _tmp270 to $t0 from $fp-16
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -20($fp)	# spill _tmp271 from $t2 to $fp-20
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# elem = _tmp271
	  lw $t2, -20($fp)	# fill _tmp271 to $t2 from $fp-20
	  sw $t2, -8($fp)	# spill elem from $t2 to $fp-8
	# _tmp272 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -24($fp)	# spill _tmp272 from $t2 to $fp-24
	# _tmp273 = elem == _tmp272
	  lw $t0, -8($fp)	# fill elem to $t0 from $fp-8
	  lw $t1, -24($fp)	# fill _tmp272 to $t1 from $fp-24
	  seq $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp273 from $t2 to $fp-28
	# _tmp274 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -32($fp)	# spill _tmp274 from $t2 to $fp-32
	# _tmp275 = _tmp274 - _tmp273
	  lw $t0, -32($fp)	# fill _tmp274 to $t0 from $fp-32
	  lw $t1, -28($fp)	# fill _tmp273 to $t1 from $fp-28
	  sub $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp275 from $t2 to $fp-36
	# IfZ _tmp275 Goto _L67
	  lw $t0, -36($fp)	# fill _tmp275 to $t0 from $fp-36
	  beqz $t0, _L67	# branch if _tmp275 is zero 
	# PushParam elem
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill elem to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp276 = *(elem)
	  lw $t0, -8($fp)	# fill elem to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -40($fp)	# spill _tmp276 from $t2 to $fp-40
	# _tmp277 = *(_tmp276 + 12)
	  lw $t0, -40($fp)	# fill _tmp276 to $t0 from $fp-40
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -44($fp)	# spill _tmp277 from $t2 to $fp-44
	# _tmp278 = ACall _tmp277
	  lw $t0, -44($fp)	# fill _tmp277 to $t0 from $fp-44
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -48($fp)	# spill _tmp278 from $t2 to $fp-48
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Return _tmp278
	  lw $t2, -48($fp)	# fill _tmp278 to $t2 from $fp-48
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto _L68
	  b _L68		# unconditional branch
  _L67:
	# _tmp279 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -52($fp)	# spill _tmp279 from $t2 to $fp-52
	# Return _tmp279
	  lw $t2, -52($fp)	# fill _tmp279 to $t2 from $fp-52
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L68:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  main:
	# BeginFunc 84
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 84	# decrement sp to make space for locals/temps
	# _tmp280 = "Dense Rep \n"
	  .data			# create string constant marked with label
	  _string17: .asciiz "Dense Rep \n"
	  .text
	  la $t2, _string17	# load label
	  sw $t2, -12($fp)	# spill _tmp280 from $t2 to $fp-12
	# PushParam _tmp280
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp280 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp281 = 8
	  li $t2, 8		# load constant value 8 into $t2
	  sw $t2, -16($fp)	# spill _tmp281 from $t2 to $fp-16
	# PushParam _tmp281
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp281 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp282 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -20($fp)	# spill _tmp282 from $t2 to $fp-20
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp283 = DenseMatrix
	  la $t2, DenseMatrix	# load label
	  sw $t2, -24($fp)	# spill _tmp283 from $t2 to $fp-24
	# *(_tmp282) = _tmp283
	  lw $t0, -24($fp)	# fill _tmp283 to $t0 from $fp-24
	  lw $t2, -20($fp)	# fill _tmp282 to $t2 from $fp-20
	  sw $t0, 0($t2) 	# store with offset
	# m = _tmp282
	  lw $t2, -20($fp)	# fill _tmp282 to $t2 from $fp-20
	  sw $t2, -8($fp)	# spill m from $t2 to $fp-8
	# PushParam m
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill m to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp284 = *(m)
	  lw $t0, -8($fp)	# fill m to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -28($fp)	# spill _tmp284 from $t2 to $fp-28
	# _tmp285 = *(_tmp284)
	  lw $t0, -28($fp)	# fill _tmp284 to $t0 from $fp-28
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -32($fp)	# spill _tmp285 from $t2 to $fp-32
	# ACall _tmp285
	  lw $t0, -32($fp)	# fill _tmp285 to $t0 from $fp-32
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam m
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill m to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp286 = *(m)
	  lw $t0, -8($fp)	# fill m to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -36($fp)	# spill _tmp286 from $t2 to $fp-36
	# _tmp287 = *(_tmp286 + 16)
	  lw $t0, -36($fp)	# fill _tmp286 to $t0 from $fp-36
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -40($fp)	# spill _tmp287 from $t2 to $fp-40
	# ACall _tmp287
	  lw $t0, -40($fp)	# fill _tmp287 to $t0 from $fp-40
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam m
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill m to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp288 = *(m)
	  lw $t0, -8($fp)	# fill m to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -44($fp)	# spill _tmp288 from $t2 to $fp-44
	# _tmp289 = *(_tmp288 + 12)
	  lw $t0, -44($fp)	# fill _tmp288 to $t0 from $fp-44
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -48($fp)	# spill _tmp289 from $t2 to $fp-48
	# ACall _tmp289
	  lw $t0, -48($fp)	# fill _tmp289 to $t0 from $fp-48
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp290 = "Sparse Rep \n"
	  .data			# create string constant marked with label
	  _string18: .asciiz "Sparse Rep \n"
	  .text
	  la $t2, _string18	# load label
	  sw $t2, -52($fp)	# spill _tmp290 from $t2 to $fp-52
	# PushParam _tmp290
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -52($fp)	# fill _tmp290 to $t0 from $fp-52
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp291 = 8
	  li $t2, 8		# load constant value 8 into $t2
	  sw $t2, -56($fp)	# spill _tmp291 from $t2 to $fp-56
	# PushParam _tmp291
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -56($fp)	# fill _tmp291 to $t0 from $fp-56
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp292 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -60($fp)	# spill _tmp292 from $t2 to $fp-60
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp293 = SparseMatrix
	  la $t2, SparseMatrix	# load label
	  sw $t2, -64($fp)	# spill _tmp293 from $t2 to $fp-64
	# *(_tmp292) = _tmp293
	  lw $t0, -64($fp)	# fill _tmp293 to $t0 from $fp-64
	  lw $t2, -60($fp)	# fill _tmp292 to $t2 from $fp-60
	  sw $t0, 0($t2) 	# store with offset
	# m = _tmp292
	  lw $t2, -60($fp)	# fill _tmp292 to $t2 from $fp-60
	  sw $t2, -8($fp)	# spill m from $t2 to $fp-8
	# PushParam m
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill m to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp294 = *(m)
	  lw $t0, -8($fp)	# fill m to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -68($fp)	# spill _tmp294 from $t2 to $fp-68
	# _tmp295 = *(_tmp294)
	  lw $t0, -68($fp)	# fill _tmp294 to $t0 from $fp-68
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -72($fp)	# spill _tmp295 from $t2 to $fp-72
	# ACall _tmp295
	  lw $t0, -72($fp)	# fill _tmp295 to $t0 from $fp-72
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam m
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill m to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp296 = *(m)
	  lw $t0, -8($fp)	# fill m to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -76($fp)	# spill _tmp296 from $t2 to $fp-76
	# _tmp297 = *(_tmp296 + 16)
	  lw $t0, -76($fp)	# fill _tmp296 to $t0 from $fp-76
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -80($fp)	# spill _tmp297 from $t2 to $fp-80
	# ACall _tmp297
	  lw $t0, -80($fp)	# fill _tmp297 to $t0 from $fp-80
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam m
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill m to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp298 = *(m)
	  lw $t0, -8($fp)	# fill m to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -84($fp)	# spill _tmp298 from $t2 to $fp-84
	# _tmp299 = *(_tmp298 + 12)
	  lw $t0, -84($fp)	# fill _tmp298 to $t0 from $fp-84
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -88($fp)	# spill _tmp299 from $t2 to $fp-88
	# ACall _tmp299
	  lw $t0, -88($fp)	# fill _tmp299 to $t0 from $fp-88
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
