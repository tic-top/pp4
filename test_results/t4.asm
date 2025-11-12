	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _Binky:
	# BeginFunc 100
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 100	# decrement sp to make space for locals/temps
	# _tmp0 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# _tmp1 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string1: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string1	# load label
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# _tmp2 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# _tmp3 = c == _tmp2
	  lw $t0, 12($fp)	# fill c to $t0 from $fp+12
	  lw $t1, -16($fp)	# fill _tmp2 to $t1 from $fp-16
	  seq $t2, $t0, $t1	
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# IfZ _tmp3 Goto _L0
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
	  beqz $t0, _L0	# branch if _tmp3 is zero 
	# PushParam _tmp1
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L0:
	# _tmp4 = _tmp0 < _tmp2
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  lw $t1, -16($fp)	# fill _tmp2 to $t1 from $fp-16
	  slt $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# IfZ _tmp4 Goto _L1
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  beqz $t0, _L1	# branch if _tmp4 is zero 
	# PushParam _tmp1
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L1:
	# _tmp5 = *(c)
	  lw $t0, 12($fp)	# fill c to $t0 from $fp+12
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = _tmp0 < _tmp5
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  lw $t1, -28($fp)	# fill _tmp5 to $t1 from $fp-28
	  slt $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# IfZ _tmp6 Goto _L3
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  beqz $t0, _L3	# branch if _tmp6 is zero 
	# Goto _L2
	  b _L2		# unconditional branch
  _L3:
	# PushParam _tmp1
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L2:
	# _tmp7 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = _tmp0 + _tmp7
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  lw $t1, -36($fp)	# fill _tmp7 to $t1 from $fp-36
	  add $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# _tmp9 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# _tmp10 = _tmp8 * _tmp9
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  lw $t1, -44($fp)	# fill _tmp9 to $t1 from $fp-44
	  mul $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# _tmp11 = c + _tmp10
	  lw $t0, 12($fp)	# fill c to $t0 from $fp+12
	  lw $t1, -48($fp)	# fill _tmp10 to $t1 from $fp-48
	  add $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# _tmp12 = *(_tmp11)
	  lw $t0, -52($fp)	# fill _tmp11 to $t0 from $fp-52
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# _tmp13 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string2	# load label
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# _tmp14 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -64($fp)	# spill _tmp14 from $t2 to $fp-64
	# _tmp15 = b == _tmp14
	  lw $t0, 8($fp)	# fill b to $t0 from $fp+8
	  lw $t1, -64($fp)	# fill _tmp14 to $t1 from $fp-64
	  seq $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp15 from $t2 to $fp-68
	# IfZ _tmp15 Goto _L4
	  lw $t0, -68($fp)	# fill _tmp15 to $t0 from $fp-68
	  beqz $t0, _L4	# branch if _tmp15 is zero 
	# PushParam _tmp13
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L4:
	# _tmp16 = _tmp12 < _tmp14
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  lw $t1, -64($fp)	# fill _tmp14 to $t1 from $fp-64
	  slt $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp16 from $t2 to $fp-72
	# IfZ _tmp16 Goto _L5
	  lw $t0, -72($fp)	# fill _tmp16 to $t0 from $fp-72
	  beqz $t0, _L5	# branch if _tmp16 is zero 
	# PushParam _tmp13
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L5:
	# _tmp17 = *(b)
	  lw $t0, 8($fp)	# fill b to $t0 from $fp+8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -76($fp)	# spill _tmp17 from $t2 to $fp-76
	# _tmp18 = _tmp12 < _tmp17
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  lw $t1, -76($fp)	# fill _tmp17 to $t1 from $fp-76
	  slt $t2, $t0, $t1	
	  sw $t2, -80($fp)	# spill _tmp18 from $t2 to $fp-80
	# IfZ _tmp18 Goto _L7
	  lw $t0, -80($fp)	# fill _tmp18 to $t0 from $fp-80
	  beqz $t0, _L7	# branch if _tmp18 is zero 
	# Goto _L6
	  b _L6		# unconditional branch
  _L7:
	# PushParam _tmp13
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L6:
	# _tmp19 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -84($fp)	# spill _tmp19 from $t2 to $fp-84
	# _tmp20 = _tmp12 + _tmp19
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  lw $t1, -84($fp)	# fill _tmp19 to $t1 from $fp-84
	  add $t2, $t0, $t1	
	  sw $t2, -88($fp)	# spill _tmp20 from $t2 to $fp-88
	# _tmp21 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -92($fp)	# spill _tmp21 from $t2 to $fp-92
	# _tmp22 = _tmp20 * _tmp21
	  lw $t0, -88($fp)	# fill _tmp20 to $t0 from $fp-88
	  lw $t1, -92($fp)	# fill _tmp21 to $t1 from $fp-92
	  mul $t2, $t0, $t1	
	  sw $t2, -96($fp)	# spill _tmp22 from $t2 to $fp-96
	# _tmp23 = b + _tmp22
	  lw $t0, 8($fp)	# fill b to $t0 from $fp+8
	  lw $t1, -96($fp)	# fill _tmp22 to $t1 from $fp-96
	  add $t2, $t0, $t1	
	  sw $t2, -100($fp)	# spill _tmp23 from $t2 to $fp-100
	# _tmp24 = *(_tmp23)
	  lw $t0, -100($fp)	# fill _tmp23 to $t0 from $fp-100
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -104($fp)	# spill _tmp24 from $t2 to $fp-104
	# Return _tmp24
	  lw $t2, -104($fp)	# fill _tmp24 to $t2 from $fp-104
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
	# BeginFunc 524
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 524	# decrement sp to make space for locals/temps
	# _tmp25 = 5
	  li $t2, 5		# load constant value 5 into $t2
	  sw $t2, -16($fp)	# spill _tmp25 from $t2 to $fp-16
	# _tmp26 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -20($fp)	# spill _tmp26 from $t2 to $fp-20
	# _tmp27 = _tmp25 < _tmp26
	  lw $t0, -16($fp)	# fill _tmp25 to $t0 from $fp-16
	  lw $t1, -20($fp)	# fill _tmp26 to $t1 from $fp-20
	  slt $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp27 from $t2 to $fp-24
	# IfZ _tmp27 Goto _L8
	  lw $t0, -24($fp)	# fill _tmp27 to $t0 from $fp-24
	  beqz $t0, _L8	# branch if _tmp27 is zero 
	# _tmp28 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t2, _string3	# load label
	  sw $t2, -28($fp)	# spill _tmp28 from $t2 to $fp-28
	# PushParam _tmp28
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -28($fp)	# fill _tmp28 to $t0 from $fp-28
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L8:
	# _tmp29 = _tmp25 == _tmp26
	  lw $t0, -16($fp)	# fill _tmp25 to $t0 from $fp-16
	  lw $t1, -20($fp)	# fill _tmp26 to $t1 from $fp-20
	  seq $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp29 from $t2 to $fp-32
	# IfZ _tmp29 Goto _L9
	  lw $t0, -32($fp)	# fill _tmp29 to $t0 from $fp-32
	  beqz $t0, _L9	# branch if _tmp29 is zero 
	# PushParam _tmp28
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -28($fp)	# fill _tmp28 to $t0 from $fp-28
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L9:
	# _tmp30 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -36($fp)	# spill _tmp30 from $t2 to $fp-36
	# _tmp31 = _tmp25 + _tmp30
	  lw $t0, -16($fp)	# fill _tmp25 to $t0 from $fp-16
	  lw $t1, -36($fp)	# fill _tmp30 to $t1 from $fp-36
	  add $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp31 from $t2 to $fp-40
	# _tmp32 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -44($fp)	# spill _tmp32 from $t2 to $fp-44
	# _tmp33 = _tmp31 * _tmp32
	  lw $t0, -40($fp)	# fill _tmp31 to $t0 from $fp-40
	  lw $t1, -44($fp)	# fill _tmp32 to $t1 from $fp-44
	  mul $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp33 from $t2 to $fp-48
	# PushParam _tmp33
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -48($fp)	# fill _tmp33 to $t0 from $fp-48
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp34 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -52($fp)	# spill _tmp34 from $t2 to $fp-52
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp34) = _tmp25
	  lw $t0, -16($fp)	# fill _tmp25 to $t0 from $fp-16
	  lw $t2, -52($fp)	# fill _tmp34 to $t2 from $fp-52
	  sw $t0, 0($t2) 	# store with offset
	# d = _tmp34
	  lw $t2, -52($fp)	# fill _tmp34 to $t2 from $fp-52
	  sw $t2, -12($fp)	# spill d from $t2 to $fp-12
	# _tmp35 = 12
	  li $t2, 12		# load constant value 12 into $t2
	  sw $t2, -56($fp)	# spill _tmp35 from $t2 to $fp-56
	# _tmp36 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -60($fp)	# spill _tmp36 from $t2 to $fp-60
	# _tmp37 = _tmp35 < _tmp36
	  lw $t0, -56($fp)	# fill _tmp35 to $t0 from $fp-56
	  lw $t1, -60($fp)	# fill _tmp36 to $t1 from $fp-60
	  slt $t2, $t0, $t1	
	  sw $t2, -64($fp)	# spill _tmp37 from $t2 to $fp-64
	# IfZ _tmp37 Goto _L10
	  lw $t0, -64($fp)	# fill _tmp37 to $t0 from $fp-64
	  beqz $t0, _L10	# branch if _tmp37 is zero 
	# _tmp38 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string4: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t2, _string4	# load label
	  sw $t2, -68($fp)	# spill _tmp38 from $t2 to $fp-68
	# PushParam _tmp38
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -68($fp)	# fill _tmp38 to $t0 from $fp-68
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L10:
	# _tmp39 = _tmp35 == _tmp36
	  lw $t0, -56($fp)	# fill _tmp35 to $t0 from $fp-56
	  lw $t1, -60($fp)	# fill _tmp36 to $t1 from $fp-60
	  seq $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp39 from $t2 to $fp-72
	# IfZ _tmp39 Goto _L11
	  lw $t0, -72($fp)	# fill _tmp39 to $t0 from $fp-72
	  beqz $t0, _L11	# branch if _tmp39 is zero 
	# PushParam _tmp38
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -68($fp)	# fill _tmp38 to $t0 from $fp-68
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L11:
	# _tmp40 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -76($fp)	# spill _tmp40 from $t2 to $fp-76
	# _tmp41 = _tmp35 + _tmp40
	  lw $t0, -56($fp)	# fill _tmp35 to $t0 from $fp-56
	  lw $t1, -76($fp)	# fill _tmp40 to $t1 from $fp-76
	  add $t2, $t0, $t1	
	  sw $t2, -80($fp)	# spill _tmp41 from $t2 to $fp-80
	# _tmp42 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -84($fp)	# spill _tmp42 from $t2 to $fp-84
	# _tmp43 = _tmp41 * _tmp42
	  lw $t0, -80($fp)	# fill _tmp41 to $t0 from $fp-80
	  lw $t1, -84($fp)	# fill _tmp42 to $t1 from $fp-84
	  mul $t2, $t0, $t1	
	  sw $t2, -88($fp)	# spill _tmp43 from $t2 to $fp-88
	# PushParam _tmp43
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -88($fp)	# fill _tmp43 to $t0 from $fp-88
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp44 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -92($fp)	# spill _tmp44 from $t2 to $fp-92
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp44) = _tmp35
	  lw $t0, -56($fp)	# fill _tmp35 to $t0 from $fp-56
	  lw $t2, -92($fp)	# fill _tmp44 to $t2 from $fp-92
	  sw $t0, 0($t2) 	# store with offset
	# _tmp45 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -96($fp)	# spill _tmp45 from $t2 to $fp-96
	# _tmp46 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string5: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string5	# load label
	  sw $t2, -100($fp)	# spill _tmp46 from $t2 to $fp-100
	# _tmp47 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -104($fp)	# spill _tmp47 from $t2 to $fp-104
	# _tmp48 = _tmp45 < _tmp47
	  lw $t0, -96($fp)	# fill _tmp45 to $t0 from $fp-96
	  lw $t1, -104($fp)	# fill _tmp47 to $t1 from $fp-104
	  slt $t2, $t0, $t1	
	  sw $t2, -108($fp)	# spill _tmp48 from $t2 to $fp-108
	# IfZ _tmp48 Goto _L12
	  lw $t0, -108($fp)	# fill _tmp48 to $t0 from $fp-108
	  beqz $t0, _L12	# branch if _tmp48 is zero 
	# PushParam _tmp46
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -100($fp)	# fill _tmp46 to $t0 from $fp-100
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L12:
	# _tmp49 = *(d)
	  lw $t0, -12($fp)	# fill d to $t0 from $fp-12
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -112($fp)	# spill _tmp49 from $t2 to $fp-112
	# _tmp50 = _tmp45 < _tmp49
	  lw $t0, -96($fp)	# fill _tmp45 to $t0 from $fp-96
	  lw $t1, -112($fp)	# fill _tmp49 to $t1 from $fp-112
	  slt $t2, $t0, $t1	
	  sw $t2, -116($fp)	# spill _tmp50 from $t2 to $fp-116
	# IfZ _tmp50 Goto _L14
	  lw $t0, -116($fp)	# fill _tmp50 to $t0 from $fp-116
	  beqz $t0, _L14	# branch if _tmp50 is zero 
	# Goto _L13
	  b _L13		# unconditional branch
  _L14:
	# PushParam _tmp46
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -100($fp)	# fill _tmp46 to $t0 from $fp-100
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L13:
	# _tmp51 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -120($fp)	# spill _tmp51 from $t2 to $fp-120
	# _tmp52 = _tmp45 + _tmp51
	  lw $t0, -96($fp)	# fill _tmp45 to $t0 from $fp-96
	  lw $t1, -120($fp)	# fill _tmp51 to $t1 from $fp-120
	  add $t2, $t0, $t1	
	  sw $t2, -124($fp)	# spill _tmp52 from $t2 to $fp-124
	# _tmp53 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -128($fp)	# spill _tmp53 from $t2 to $fp-128
	# _tmp54 = _tmp52 * _tmp53
	  lw $t0, -124($fp)	# fill _tmp52 to $t0 from $fp-124
	  lw $t1, -128($fp)	# fill _tmp53 to $t1 from $fp-128
	  mul $t2, $t0, $t1	
	  sw $t2, -132($fp)	# spill _tmp54 from $t2 to $fp-132
	# _tmp55 = d + _tmp54
	  lw $t0, -12($fp)	# fill d to $t0 from $fp-12
	  lw $t1, -132($fp)	# fill _tmp54 to $t1 from $fp-132
	  add $t2, $t0, $t1	
	  sw $t2, -136($fp)	# spill _tmp55 from $t2 to $fp-136
	# *(_tmp55) = _tmp44
	  lw $t0, -92($fp)	# fill _tmp44 to $t0 from $fp-92
	  lw $t2, -136($fp)	# fill _tmp55 to $t2 from $fp-136
	  sw $t0, 0($t2) 	# store with offset
	# _tmp56 = 10
	  li $t2, 10		# load constant value 10 into $t2
	  sw $t2, -140($fp)	# spill _tmp56 from $t2 to $fp-140
	# _tmp57 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -144($fp)	# spill _tmp57 from $t2 to $fp-144
	# _tmp58 = _tmp56 < _tmp57
	  lw $t0, -140($fp)	# fill _tmp56 to $t0 from $fp-140
	  lw $t1, -144($fp)	# fill _tmp57 to $t1 from $fp-144
	  slt $t2, $t0, $t1	
	  sw $t2, -148($fp)	# spill _tmp58 from $t2 to $fp-148
	# IfZ _tmp58 Goto _L15
	  lw $t0, -148($fp)	# fill _tmp58 to $t0 from $fp-148
	  beqz $t0, _L15	# branch if _tmp58 is zero 
	# _tmp59 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t2, _string6	# load label
	  sw $t2, -152($fp)	# spill _tmp59 from $t2 to $fp-152
	# PushParam _tmp59
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -152($fp)	# fill _tmp59 to $t0 from $fp-152
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L15:
	# _tmp60 = _tmp56 == _tmp57
	  lw $t0, -140($fp)	# fill _tmp56 to $t0 from $fp-140
	  lw $t1, -144($fp)	# fill _tmp57 to $t1 from $fp-144
	  seq $t2, $t0, $t1	
	  sw $t2, -156($fp)	# spill _tmp60 from $t2 to $fp-156
	# IfZ _tmp60 Goto _L16
	  lw $t0, -156($fp)	# fill _tmp60 to $t0 from $fp-156
	  beqz $t0, _L16	# branch if _tmp60 is zero 
	# PushParam _tmp59
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -152($fp)	# fill _tmp59 to $t0 from $fp-152
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L16:
	# _tmp61 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -160($fp)	# spill _tmp61 from $t2 to $fp-160
	# _tmp62 = _tmp56 + _tmp61
	  lw $t0, -140($fp)	# fill _tmp56 to $t0 from $fp-140
	  lw $t1, -160($fp)	# fill _tmp61 to $t1 from $fp-160
	  add $t2, $t0, $t1	
	  sw $t2, -164($fp)	# spill _tmp62 from $t2 to $fp-164
	# _tmp63 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -168($fp)	# spill _tmp63 from $t2 to $fp-168
	# _tmp64 = _tmp62 * _tmp63
	  lw $t0, -164($fp)	# fill _tmp62 to $t0 from $fp-164
	  lw $t1, -168($fp)	# fill _tmp63 to $t1 from $fp-168
	  mul $t2, $t0, $t1	
	  sw $t2, -172($fp)	# spill _tmp64 from $t2 to $fp-172
	# PushParam _tmp64
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -172($fp)	# fill _tmp64 to $t0 from $fp-172
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp65 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -176($fp)	# spill _tmp65 from $t2 to $fp-176
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp65) = _tmp56
	  lw $t0, -140($fp)	# fill _tmp56 to $t0 from $fp-140
	  lw $t2, -176($fp)	# fill _tmp65 to $t2 from $fp-176
	  sw $t0, 0($t2) 	# store with offset
	# c = _tmp65
	  lw $t2, -176($fp)	# fill _tmp65 to $t2 from $fp-176
	  sw $t2, -8($fp)	# spill c from $t2 to $fp-8
	# _tmp66 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -180($fp)	# spill _tmp66 from $t2 to $fp-180
	# _tmp67 = 5
	  li $t2, 5		# load constant value 5 into $t2
	  sw $t2, -184($fp)	# spill _tmp67 from $t2 to $fp-184
	# _tmp68 = 3
	  li $t2, 3		# load constant value 3 into $t2
	  sw $t2, -188($fp)	# spill _tmp68 from $t2 to $fp-188
	# _tmp69 = _tmp67 * _tmp68
	  lw $t0, -184($fp)	# fill _tmp67 to $t0 from $fp-184
	  lw $t1, -188($fp)	# fill _tmp68 to $t1 from $fp-188
	  mul $t2, $t0, $t1	
	  sw $t2, -192($fp)	# spill _tmp69 from $t2 to $fp-192
	# _tmp70 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -196($fp)	# spill _tmp70 from $t2 to $fp-196
	# _tmp71 = _tmp69 / _tmp70
	  lw $t0, -192($fp)	# fill _tmp69 to $t0 from $fp-192
	  lw $t1, -196($fp)	# fill _tmp70 to $t1 from $fp-196
	  div $t2, $t0, $t1	
	  sw $t2, -200($fp)	# spill _tmp71 from $t2 to $fp-200
	# _tmp72 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -204($fp)	# spill _tmp72 from $t2 to $fp-204
	# _tmp73 = _tmp71 % _tmp72
	  lw $t0, -200($fp)	# fill _tmp71 to $t0 from $fp-200
	  lw $t1, -204($fp)	# fill _tmp72 to $t1 from $fp-204
	  rem $t2, $t0, $t1	
	  sw $t2, -208($fp)	# spill _tmp73 from $t2 to $fp-208
	# _tmp74 = _tmp66 + _tmp73
	  lw $t0, -180($fp)	# fill _tmp66 to $t0 from $fp-180
	  lw $t1, -208($fp)	# fill _tmp73 to $t1 from $fp-208
	  add $t2, $t0, $t1	
	  sw $t2, -212($fp)	# spill _tmp74 from $t2 to $fp-212
	# _tmp75 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -216($fp)	# spill _tmp75 from $t2 to $fp-216
	# _tmp76 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string7	# load label
	  sw $t2, -220($fp)	# spill _tmp76 from $t2 to $fp-220
	# _tmp77 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -224($fp)	# spill _tmp77 from $t2 to $fp-224
	# _tmp78 = _tmp75 < _tmp77
	  lw $t0, -216($fp)	# fill _tmp75 to $t0 from $fp-216
	  lw $t1, -224($fp)	# fill _tmp77 to $t1 from $fp-224
	  slt $t2, $t0, $t1	
	  sw $t2, -228($fp)	# spill _tmp78 from $t2 to $fp-228
	# IfZ _tmp78 Goto _L17
	  lw $t0, -228($fp)	# fill _tmp78 to $t0 from $fp-228
	  beqz $t0, _L17	# branch if _tmp78 is zero 
	# PushParam _tmp76
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -220($fp)	# fill _tmp76 to $t0 from $fp-220
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L17:
	# _tmp79 = *(c)
	  lw $t0, -8($fp)	# fill c to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -232($fp)	# spill _tmp79 from $t2 to $fp-232
	# _tmp80 = _tmp75 < _tmp79
	  lw $t0, -216($fp)	# fill _tmp75 to $t0 from $fp-216
	  lw $t1, -232($fp)	# fill _tmp79 to $t1 from $fp-232
	  slt $t2, $t0, $t1	
	  sw $t2, -236($fp)	# spill _tmp80 from $t2 to $fp-236
	# IfZ _tmp80 Goto _L19
	  lw $t0, -236($fp)	# fill _tmp80 to $t0 from $fp-236
	  beqz $t0, _L19	# branch if _tmp80 is zero 
	# Goto _L18
	  b _L18		# unconditional branch
  _L19:
	# PushParam _tmp76
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -220($fp)	# fill _tmp76 to $t0 from $fp-220
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L18:
	# _tmp81 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -240($fp)	# spill _tmp81 from $t2 to $fp-240
	# _tmp82 = _tmp75 + _tmp81
	  lw $t0, -216($fp)	# fill _tmp75 to $t0 from $fp-216
	  lw $t1, -240($fp)	# fill _tmp81 to $t1 from $fp-240
	  add $t2, $t0, $t1	
	  sw $t2, -244($fp)	# spill _tmp82 from $t2 to $fp-244
	# _tmp83 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -248($fp)	# spill _tmp83 from $t2 to $fp-248
	# _tmp84 = _tmp82 * _tmp83
	  lw $t0, -244($fp)	# fill _tmp82 to $t0 from $fp-244
	  lw $t1, -248($fp)	# fill _tmp83 to $t1 from $fp-248
	  mul $t2, $t0, $t1	
	  sw $t2, -252($fp)	# spill _tmp84 from $t2 to $fp-252
	# _tmp85 = c + _tmp84
	  lw $t0, -8($fp)	# fill c to $t0 from $fp-8
	  lw $t1, -252($fp)	# fill _tmp84 to $t1 from $fp-252
	  add $t2, $t0, $t1	
	  sw $t2, -256($fp)	# spill _tmp85 from $t2 to $fp-256
	# *(_tmp85) = _tmp74
	  lw $t0, -212($fp)	# fill _tmp74 to $t0 from $fp-212
	  lw $t2, -256($fp)	# fill _tmp85 to $t2 from $fp-256
	  sw $t0, 0($t2) 	# store with offset
	# _tmp86 = 55
	  li $t2, 55		# load constant value 55 into $t2
	  sw $t2, -260($fp)	# spill _tmp86 from $t2 to $fp-260
	# _tmp87 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -264($fp)	# spill _tmp87 from $t2 to $fp-264
	# _tmp88 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string8	# load label
	  sw $t2, -268($fp)	# spill _tmp88 from $t2 to $fp-268
	# _tmp89 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -272($fp)	# spill _tmp89 from $t2 to $fp-272
	# _tmp90 = d == _tmp89
	  lw $t0, -12($fp)	# fill d to $t0 from $fp-12
	  lw $t1, -272($fp)	# fill _tmp89 to $t1 from $fp-272
	  seq $t2, $t0, $t1	
	  sw $t2, -276($fp)	# spill _tmp90 from $t2 to $fp-276
	# IfZ _tmp90 Goto _L20
	  lw $t0, -276($fp)	# fill _tmp90 to $t0 from $fp-276
	  beqz $t0, _L20	# branch if _tmp90 is zero 
	# PushParam _tmp88
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -268($fp)	# fill _tmp88 to $t0 from $fp-268
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L20:
	# _tmp91 = _tmp87 < _tmp89
	  lw $t0, -264($fp)	# fill _tmp87 to $t0 from $fp-264
	  lw $t1, -272($fp)	# fill _tmp89 to $t1 from $fp-272
	  slt $t2, $t0, $t1	
	  sw $t2, -280($fp)	# spill _tmp91 from $t2 to $fp-280
	# IfZ _tmp91 Goto _L21
	  lw $t0, -280($fp)	# fill _tmp91 to $t0 from $fp-280
	  beqz $t0, _L21	# branch if _tmp91 is zero 
	# PushParam _tmp88
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -268($fp)	# fill _tmp88 to $t0 from $fp-268
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L21:
	# _tmp92 = *(d)
	  lw $t0, -12($fp)	# fill d to $t0 from $fp-12
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -284($fp)	# spill _tmp92 from $t2 to $fp-284
	# _tmp93 = _tmp87 < _tmp92
	  lw $t0, -264($fp)	# fill _tmp87 to $t0 from $fp-264
	  lw $t1, -284($fp)	# fill _tmp92 to $t1 from $fp-284
	  slt $t2, $t0, $t1	
	  sw $t2, -288($fp)	# spill _tmp93 from $t2 to $fp-288
	# IfZ _tmp93 Goto _L23
	  lw $t0, -288($fp)	# fill _tmp93 to $t0 from $fp-288
	  beqz $t0, _L23	# branch if _tmp93 is zero 
	# Goto _L22
	  b _L22		# unconditional branch
  _L23:
	# PushParam _tmp88
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -268($fp)	# fill _tmp88 to $t0 from $fp-268
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L22:
	# _tmp94 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -292($fp)	# spill _tmp94 from $t2 to $fp-292
	# _tmp95 = _tmp87 + _tmp94
	  lw $t0, -264($fp)	# fill _tmp87 to $t0 from $fp-264
	  lw $t1, -292($fp)	# fill _tmp94 to $t1 from $fp-292
	  add $t2, $t0, $t1	
	  sw $t2, -296($fp)	# spill _tmp95 from $t2 to $fp-296
	# _tmp96 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -300($fp)	# spill _tmp96 from $t2 to $fp-300
	# _tmp97 = _tmp95 * _tmp96
	  lw $t0, -296($fp)	# fill _tmp95 to $t0 from $fp-296
	  lw $t1, -300($fp)	# fill _tmp96 to $t1 from $fp-300
	  mul $t2, $t0, $t1	
	  sw $t2, -304($fp)	# spill _tmp97 from $t2 to $fp-304
	# _tmp98 = d + _tmp97
	  lw $t0, -12($fp)	# fill d to $t0 from $fp-12
	  lw $t1, -304($fp)	# fill _tmp97 to $t1 from $fp-304
	  add $t2, $t0, $t1	
	  sw $t2, -308($fp)	# spill _tmp98 from $t2 to $fp-308
	# _tmp99 = *(_tmp98)
	  lw $t0, -308($fp)	# fill _tmp98 to $t0 from $fp-308
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -312($fp)	# spill _tmp99 from $t2 to $fp-312
	# _tmp100 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -316($fp)	# spill _tmp100 from $t2 to $fp-316
	# _tmp101 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string9	# load label
	  sw $t2, -320($fp)	# spill _tmp101 from $t2 to $fp-320
	# _tmp102 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -324($fp)	# spill _tmp102 from $t2 to $fp-324
	# _tmp103 = c == _tmp102
	  lw $t0, -8($fp)	# fill c to $t0 from $fp-8
	  lw $t1, -324($fp)	# fill _tmp102 to $t1 from $fp-324
	  seq $t2, $t0, $t1	
	  sw $t2, -328($fp)	# spill _tmp103 from $t2 to $fp-328
	# IfZ _tmp103 Goto _L24
	  lw $t0, -328($fp)	# fill _tmp103 to $t0 from $fp-328
	  beqz $t0, _L24	# branch if _tmp103 is zero 
	# PushParam _tmp101
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -320($fp)	# fill _tmp101 to $t0 from $fp-320
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L24:
	# _tmp104 = _tmp100 < _tmp102
	  lw $t0, -316($fp)	# fill _tmp100 to $t0 from $fp-316
	  lw $t1, -324($fp)	# fill _tmp102 to $t1 from $fp-324
	  slt $t2, $t0, $t1	
	  sw $t2, -332($fp)	# spill _tmp104 from $t2 to $fp-332
	# IfZ _tmp104 Goto _L25
	  lw $t0, -332($fp)	# fill _tmp104 to $t0 from $fp-332
	  beqz $t0, _L25	# branch if _tmp104 is zero 
	# PushParam _tmp101
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -320($fp)	# fill _tmp101 to $t0 from $fp-320
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L25:
	# _tmp105 = *(c)
	  lw $t0, -8($fp)	# fill c to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -336($fp)	# spill _tmp105 from $t2 to $fp-336
	# _tmp106 = _tmp100 < _tmp105
	  lw $t0, -316($fp)	# fill _tmp100 to $t0 from $fp-316
	  lw $t1, -336($fp)	# fill _tmp105 to $t1 from $fp-336
	  slt $t2, $t0, $t1	
	  sw $t2, -340($fp)	# spill _tmp106 from $t2 to $fp-340
	# IfZ _tmp106 Goto _L27
	  lw $t0, -340($fp)	# fill _tmp106 to $t0 from $fp-340
	  beqz $t0, _L27	# branch if _tmp106 is zero 
	# Goto _L26
	  b _L26		# unconditional branch
  _L27:
	# PushParam _tmp101
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -320($fp)	# fill _tmp101 to $t0 from $fp-320
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L26:
	# _tmp107 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -344($fp)	# spill _tmp107 from $t2 to $fp-344
	# _tmp108 = _tmp100 + _tmp107
	  lw $t0, -316($fp)	# fill _tmp100 to $t0 from $fp-316
	  lw $t1, -344($fp)	# fill _tmp107 to $t1 from $fp-344
	  add $t2, $t0, $t1	
	  sw $t2, -348($fp)	# spill _tmp108 from $t2 to $fp-348
	# _tmp109 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -352($fp)	# spill _tmp109 from $t2 to $fp-352
	# _tmp110 = _tmp108 * _tmp109
	  lw $t0, -348($fp)	# fill _tmp108 to $t0 from $fp-348
	  lw $t1, -352($fp)	# fill _tmp109 to $t1 from $fp-352
	  mul $t2, $t0, $t1	
	  sw $t2, -356($fp)	# spill _tmp110 from $t2 to $fp-356
	# _tmp111 = c + _tmp110
	  lw $t0, -8($fp)	# fill c to $t0 from $fp-8
	  lw $t1, -356($fp)	# fill _tmp110 to $t1 from $fp-356
	  add $t2, $t0, $t1	
	  sw $t2, -360($fp)	# spill _tmp111 from $t2 to $fp-360
	# _tmp112 = *(_tmp111)
	  lw $t0, -360($fp)	# fill _tmp111 to $t0 from $fp-360
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -364($fp)	# spill _tmp112 from $t2 to $fp-364
	# _tmp113 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string10	# load label
	  sw $t2, -368($fp)	# spill _tmp113 from $t2 to $fp-368
	# _tmp114 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -372($fp)	# spill _tmp114 from $t2 to $fp-372
	# _tmp115 = _tmp112 < _tmp114
	  lw $t0, -364($fp)	# fill _tmp112 to $t0 from $fp-364
	  lw $t1, -372($fp)	# fill _tmp114 to $t1 from $fp-372
	  slt $t2, $t0, $t1	
	  sw $t2, -376($fp)	# spill _tmp115 from $t2 to $fp-376
	# IfZ _tmp115 Goto _L28
	  lw $t0, -376($fp)	# fill _tmp115 to $t0 from $fp-376
	  beqz $t0, _L28	# branch if _tmp115 is zero 
	# PushParam _tmp113
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -368($fp)	# fill _tmp113 to $t0 from $fp-368
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L28:
	# _tmp116 = *(_tmp99)
	  lw $t0, -312($fp)	# fill _tmp99 to $t0 from $fp-312
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -380($fp)	# spill _tmp116 from $t2 to $fp-380
	# _tmp117 = _tmp112 < _tmp116
	  lw $t0, -364($fp)	# fill _tmp112 to $t0 from $fp-364
	  lw $t1, -380($fp)	# fill _tmp116 to $t1 from $fp-380
	  slt $t2, $t0, $t1	
	  sw $t2, -384($fp)	# spill _tmp117 from $t2 to $fp-384
	# IfZ _tmp117 Goto _L30
	  lw $t0, -384($fp)	# fill _tmp117 to $t0 from $fp-384
	  beqz $t0, _L30	# branch if _tmp117 is zero 
	# Goto _L29
	  b _L29		# unconditional branch
  _L30:
	# PushParam _tmp113
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -368($fp)	# fill _tmp113 to $t0 from $fp-368
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L29:
	# _tmp118 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -388($fp)	# spill _tmp118 from $t2 to $fp-388
	# _tmp119 = _tmp112 + _tmp118
	  lw $t0, -364($fp)	# fill _tmp112 to $t0 from $fp-364
	  lw $t1, -388($fp)	# fill _tmp118 to $t1 from $fp-388
	  add $t2, $t0, $t1	
	  sw $t2, -392($fp)	# spill _tmp119 from $t2 to $fp-392
	# _tmp120 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -396($fp)	# spill _tmp120 from $t2 to $fp-396
	# _tmp121 = _tmp119 * _tmp120
	  lw $t0, -392($fp)	# fill _tmp119 to $t0 from $fp-392
	  lw $t1, -396($fp)	# fill _tmp120 to $t1 from $fp-396
	  mul $t2, $t0, $t1	
	  sw $t2, -400($fp)	# spill _tmp121 from $t2 to $fp-400
	# _tmp122 = _tmp99 + _tmp121
	  lw $t0, -312($fp)	# fill _tmp99 to $t0 from $fp-312
	  lw $t1, -400($fp)	# fill _tmp121 to $t1 from $fp-400
	  add $t2, $t0, $t1	
	  sw $t2, -404($fp)	# spill _tmp122 from $t2 to $fp-404
	# *(_tmp122) = _tmp86
	  lw $t0, -260($fp)	# fill _tmp86 to $t0 from $fp-260
	  lw $t2, -404($fp)	# fill _tmp122 to $t2 from $fp-404
	  sw $t0, 0($t2) 	# store with offset
	# _tmp123 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -408($fp)	# spill _tmp123 from $t2 to $fp-408
	# _tmp124 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string11: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string11	# load label
	  sw $t2, -412($fp)	# spill _tmp124 from $t2 to $fp-412
	# _tmp125 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -416($fp)	# spill _tmp125 from $t2 to $fp-416
	# _tmp126 = c == _tmp125
	  lw $t0, -8($fp)	# fill c to $t0 from $fp-8
	  lw $t1, -416($fp)	# fill _tmp125 to $t1 from $fp-416
	  seq $t2, $t0, $t1	
	  sw $t2, -420($fp)	# spill _tmp126 from $t2 to $fp-420
	# IfZ _tmp126 Goto _L31
	  lw $t0, -420($fp)	# fill _tmp126 to $t0 from $fp-420
	  beqz $t0, _L31	# branch if _tmp126 is zero 
	# PushParam _tmp124
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -412($fp)	# fill _tmp124 to $t0 from $fp-412
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L31:
	# _tmp127 = _tmp123 < _tmp125
	  lw $t0, -408($fp)	# fill _tmp123 to $t0 from $fp-408
	  lw $t1, -416($fp)	# fill _tmp125 to $t1 from $fp-416
	  slt $t2, $t0, $t1	
	  sw $t2, -424($fp)	# spill _tmp127 from $t2 to $fp-424
	# IfZ _tmp127 Goto _L32
	  lw $t0, -424($fp)	# fill _tmp127 to $t0 from $fp-424
	  beqz $t0, _L32	# branch if _tmp127 is zero 
	# PushParam _tmp124
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -412($fp)	# fill _tmp124 to $t0 from $fp-412
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L32:
	# _tmp128 = *(c)
	  lw $t0, -8($fp)	# fill c to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -428($fp)	# spill _tmp128 from $t2 to $fp-428
	# _tmp129 = _tmp123 < _tmp128
	  lw $t0, -408($fp)	# fill _tmp123 to $t0 from $fp-408
	  lw $t1, -428($fp)	# fill _tmp128 to $t1 from $fp-428
	  slt $t2, $t0, $t1	
	  sw $t2, -432($fp)	# spill _tmp129 from $t2 to $fp-432
	# IfZ _tmp129 Goto _L34
	  lw $t0, -432($fp)	# fill _tmp129 to $t0 from $fp-432
	  beqz $t0, _L34	# branch if _tmp129 is zero 
	# Goto _L33
	  b _L33		# unconditional branch
  _L34:
	# PushParam _tmp124
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -412($fp)	# fill _tmp124 to $t0 from $fp-412
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L33:
	# _tmp130 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -436($fp)	# spill _tmp130 from $t2 to $fp-436
	# _tmp131 = _tmp123 + _tmp130
	  lw $t0, -408($fp)	# fill _tmp123 to $t0 from $fp-408
	  lw $t1, -436($fp)	# fill _tmp130 to $t1 from $fp-436
	  add $t2, $t0, $t1	
	  sw $t2, -440($fp)	# spill _tmp131 from $t2 to $fp-440
	# _tmp132 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -444($fp)	# spill _tmp132 from $t2 to $fp-444
	# _tmp133 = _tmp131 * _tmp132
	  lw $t0, -440($fp)	# fill _tmp131 to $t0 from $fp-440
	  lw $t1, -444($fp)	# fill _tmp132 to $t1 from $fp-444
	  mul $t2, $t0, $t1	
	  sw $t2, -448($fp)	# spill _tmp133 from $t2 to $fp-448
	# _tmp134 = c + _tmp133
	  lw $t0, -8($fp)	# fill c to $t0 from $fp-8
	  lw $t1, -448($fp)	# fill _tmp133 to $t1 from $fp-448
	  add $t2, $t0, $t1	
	  sw $t2, -452($fp)	# spill _tmp134 from $t2 to $fp-452
	# _tmp135 = *(_tmp134)
	  lw $t0, -452($fp)	# fill _tmp134 to $t0 from $fp-452
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -456($fp)	# spill _tmp135 from $t2 to $fp-456
	# PushParam _tmp135
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -456($fp)	# fill _tmp135 to $t0 from $fp-456
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp136 = " "
	  .data			# create string constant marked with label
	  _string12: .asciiz " "
	  .text
	  la $t2, _string12	# load label
	  sw $t2, -460($fp)	# spill _tmp136 from $t2 to $fp-460
	# PushParam _tmp136
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -460($fp)	# fill _tmp136 to $t0 from $fp-460
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp137 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -464($fp)	# spill _tmp137 from $t2 to $fp-464
	# PushParam c
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill c to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp138 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -468($fp)	# spill _tmp138 from $t2 to $fp-468
	# _tmp139 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string13: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string13	# load label
	  sw $t2, -472($fp)	# spill _tmp139 from $t2 to $fp-472
	# _tmp140 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -476($fp)	# spill _tmp140 from $t2 to $fp-476
	# _tmp141 = d == _tmp140
	  lw $t0, -12($fp)	# fill d to $t0 from $fp-12
	  lw $t1, -476($fp)	# fill _tmp140 to $t1 from $fp-476
	  seq $t2, $t0, $t1	
	  sw $t2, -480($fp)	# spill _tmp141 from $t2 to $fp-480
	# IfZ _tmp141 Goto _L35
	  lw $t0, -480($fp)	# fill _tmp141 to $t0 from $fp-480
	  beqz $t0, _L35	# branch if _tmp141 is zero 
	# PushParam _tmp139
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -472($fp)	# fill _tmp139 to $t0 from $fp-472
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L35:
	# _tmp142 = _tmp138 < _tmp140
	  lw $t0, -468($fp)	# fill _tmp138 to $t0 from $fp-468
	  lw $t1, -476($fp)	# fill _tmp140 to $t1 from $fp-476
	  slt $t2, $t0, $t1	
	  sw $t2, -484($fp)	# spill _tmp142 from $t2 to $fp-484
	# IfZ _tmp142 Goto _L36
	  lw $t0, -484($fp)	# fill _tmp142 to $t0 from $fp-484
	  beqz $t0, _L36	# branch if _tmp142 is zero 
	# PushParam _tmp139
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -472($fp)	# fill _tmp139 to $t0 from $fp-472
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L36:
	# _tmp143 = *(d)
	  lw $t0, -12($fp)	# fill d to $t0 from $fp-12
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -488($fp)	# spill _tmp143 from $t2 to $fp-488
	# _tmp144 = _tmp138 < _tmp143
	  lw $t0, -468($fp)	# fill _tmp138 to $t0 from $fp-468
	  lw $t1, -488($fp)	# fill _tmp143 to $t1 from $fp-488
	  slt $t2, $t0, $t1	
	  sw $t2, -492($fp)	# spill _tmp144 from $t2 to $fp-492
	# IfZ _tmp144 Goto _L38
	  lw $t0, -492($fp)	# fill _tmp144 to $t0 from $fp-492
	  beqz $t0, _L38	# branch if _tmp144 is zero 
	# Goto _L37
	  b _L37		# unconditional branch
  _L38:
	# PushParam _tmp139
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -472($fp)	# fill _tmp139 to $t0 from $fp-472
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L37:
	# _tmp145 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -496($fp)	# spill _tmp145 from $t2 to $fp-496
	# _tmp146 = _tmp138 + _tmp145
	  lw $t0, -468($fp)	# fill _tmp138 to $t0 from $fp-468
	  lw $t1, -496($fp)	# fill _tmp145 to $t1 from $fp-496
	  add $t2, $t0, $t1	
	  sw $t2, -500($fp)	# spill _tmp146 from $t2 to $fp-500
	# _tmp147 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -504($fp)	# spill _tmp147 from $t2 to $fp-504
	# _tmp148 = _tmp146 * _tmp147
	  lw $t0, -500($fp)	# fill _tmp146 to $t0 from $fp-500
	  lw $t1, -504($fp)	# fill _tmp147 to $t1 from $fp-504
	  mul $t2, $t0, $t1	
	  sw $t2, -508($fp)	# spill _tmp148 from $t2 to $fp-508
	# _tmp149 = d + _tmp148
	  lw $t0, -12($fp)	# fill d to $t0 from $fp-12
	  lw $t1, -508($fp)	# fill _tmp148 to $t1 from $fp-508
	  add $t2, $t0, $t1	
	  sw $t2, -512($fp)	# spill _tmp149 from $t2 to $fp-512
	# _tmp150 = *(_tmp149)
	  lw $t0, -512($fp)	# fill _tmp149 to $t0 from $fp-512
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -516($fp)	# spill _tmp150 from $t2 to $fp-516
	# PushParam _tmp150
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -516($fp)	# fill _tmp150 to $t0 from $fp-516
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp151 = 100
	  li $t2, 100		# load constant value 100 into $t2
	  sw $t2, -520($fp)	# spill _tmp151 from $t2 to $fp-520
	# PushParam _tmp151
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -520($fp)	# fill _tmp151 to $t0 from $fp-520
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp152 = LCall _Binky
	  jal _Binky         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -524($fp)	# spill _tmp152 from $t2 to $fp-524
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# _tmp153 = _tmp137 * _tmp152
	  lw $t0, -464($fp)	# fill _tmp137 to $t0 from $fp-464
	  lw $t1, -524($fp)	# fill _tmp152 to $t1 from $fp-524
	  mul $t2, $t0, $t1	
	  sw $t2, -528($fp)	# spill _tmp153 from $t2 to $fp-528
	# PushParam _tmp153
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -528($fp)	# fill _tmp153 to $t0 from $fp-528
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
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
