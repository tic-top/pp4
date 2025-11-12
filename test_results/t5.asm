	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _Wild:
	# BeginFunc 84
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 84	# decrement sp to make space for locals/temps
	# _tmp0 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -12($fp)	# spill _tmp0 from $t2 to $fp-12
	# i = _tmp0
	  lw $t2, -12($fp)	# fill _tmp0 to $t2 from $fp-12
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  _L0:
	# _tmp1 = *(names)
	  lw $t0, 4($fp)	# fill names to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp1 from $t2 to $fp-16
	# _tmp2 = i < _tmp1
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -16($fp)	# fill _tmp1 to $t1 from $fp-16
	  slt $t2, $t0, $t1	
	  sw $t2, -20($fp)	# spill _tmp2 from $t2 to $fp-20
	# IfZ _tmp2 Goto _L1
	  lw $t0, -20($fp)	# fill _tmp2 to $t0 from $fp-20
	  beqz $t0, _L1	# branch if _tmp2 is zero 
	# _tmp3 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string1: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string1	# load label
	  sw $t2, -24($fp)	# spill _tmp3 from $t2 to $fp-24
	# _tmp4 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -28($fp)	# spill _tmp4 from $t2 to $fp-28
	# _tmp5 = names == _tmp4
	  lw $t0, 4($fp)	# fill names to $t0 from $fp+4
	  lw $t1, -28($fp)	# fill _tmp4 to $t1 from $fp-28
	  seq $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp5 from $t2 to $fp-32
	# IfZ _tmp5 Goto _L2
	  lw $t0, -32($fp)	# fill _tmp5 to $t0 from $fp-32
	  beqz $t0, _L2	# branch if _tmp5 is zero 
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp3 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L2:
	# _tmp6 = i < _tmp4
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -28($fp)	# fill _tmp4 to $t1 from $fp-28
	  slt $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp6 from $t2 to $fp-36
	# IfZ _tmp6 Goto _L3
	  lw $t0, -36($fp)	# fill _tmp6 to $t0 from $fp-36
	  beqz $t0, _L3	# branch if _tmp6 is zero 
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp3 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L3:
	# _tmp7 = *(names)
	  lw $t0, 4($fp)	# fill names to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -40($fp)	# spill _tmp7 from $t2 to $fp-40
	# _tmp8 = i < _tmp7
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -40($fp)	# fill _tmp7 to $t1 from $fp-40
	  slt $t2, $t0, $t1	
	  sw $t2, -44($fp)	# spill _tmp8 from $t2 to $fp-44
	# IfZ _tmp8 Goto _L5
	  lw $t0, -44($fp)	# fill _tmp8 to $t0 from $fp-44
	  beqz $t0, _L5	# branch if _tmp8 is zero 
	# Goto _L4
	  b _L4		# unconditional branch
  _L5:
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp3 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L4:
	# _tmp9 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -48($fp)	# spill _tmp9 from $t2 to $fp-48
	# _tmp10 = i + _tmp9
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -48($fp)	# fill _tmp9 to $t1 from $fp-48
	  add $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp10 from $t2 to $fp-52
	# _tmp11 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -56($fp)	# spill _tmp11 from $t2 to $fp-56
	# _tmp12 = _tmp10 * _tmp11
	  lw $t0, -52($fp)	# fill _tmp10 to $t0 from $fp-52
	  lw $t1, -56($fp)	# fill _tmp11 to $t1 from $fp-56
	  mul $t2, $t0, $t1	
	  sw $t2, -60($fp)	# spill _tmp12 from $t2 to $fp-60
	# _tmp13 = names + _tmp12
	  lw $t0, 4($fp)	# fill names to $t0 from $fp+4
	  lw $t1, -60($fp)	# fill _tmp12 to $t1 from $fp-60
	  add $t2, $t0, $t1	
	  sw $t2, -64($fp)	# spill _tmp13 from $t2 to $fp-64
	# _tmp14 = *(_tmp13)
	  lw $t0, -64($fp)	# fill _tmp13 to $t0 from $fp-64
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -68($fp)	# spill _tmp14 from $t2 to $fp-68
	# PushParam answer
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill answer to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp14
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -68($fp)	# fill _tmp14 to $t0 from $fp-68
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp15 = LCall _StringEqual
	  jal _StringEqual   	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -72($fp)	# spill _tmp15 from $t2 to $fp-72
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# IfZ _tmp15 Goto _L6
	  lw $t0, -72($fp)	# fill _tmp15 to $t0 from $fp-72
	  beqz $t0, _L6	# branch if _tmp15 is zero 
	# _tmp16 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -76($fp)	# spill _tmp16 from $t2 to $fp-76
	# Return _tmp16
	  lw $t2, -76($fp)	# fill _tmp16 to $t2 from $fp-76
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto _L7
	  b _L7		# unconditional branch
  _L6:
  _L7:
	# _tmp17 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -80($fp)	# spill _tmp17 from $t2 to $fp-80
	# _tmp18 = i + _tmp17
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -80($fp)	# fill _tmp17 to $t1 from $fp-80
	  add $t2, $t0, $t1	
	  sw $t2, -84($fp)	# spill _tmp18 from $t2 to $fp-84
	# i = _tmp18
	  lw $t2, -84($fp)	# fill _tmp18 to $t2 from $fp-84
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# Goto _L0
	  b _L0		# unconditional branch
  _L1:
	# _tmp19 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -88($fp)	# spill _tmp19 from $t2 to $fp-88
	# Return _tmp19
	  lw $t2, -88($fp)	# fill _tmp19 to $t2 from $fp-88
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
	# BeginFunc 212
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 212	# decrement sp to make space for locals/temps
	# _tmp20 = 3
	  li $t2, 3		# load constant value 3 into $t2
	  sw $t2, -12($fp)	# spill _tmp20 from $t2 to $fp-12
	# _tmp21 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -16($fp)	# spill _tmp21 from $t2 to $fp-16
	# _tmp22 = _tmp20 < _tmp21
	  lw $t0, -12($fp)	# fill _tmp20 to $t0 from $fp-12
	  lw $t1, -16($fp)	# fill _tmp21 to $t1 from $fp-16
	  slt $t2, $t0, $t1	
	  sw $t2, -20($fp)	# spill _tmp22 from $t2 to $fp-20
	# IfZ _tmp22 Goto _L8
	  lw $t0, -20($fp)	# fill _tmp22 to $t0 from $fp-20
	  beqz $t0, _L8	# branch if _tmp22 is zero 
	# _tmp23 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t2, _string2	# load label
	  sw $t2, -24($fp)	# spill _tmp23 from $t2 to $fp-24
	# PushParam _tmp23
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp23 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L8:
	# _tmp24 = _tmp20 == _tmp21
	  lw $t0, -12($fp)	# fill _tmp20 to $t0 from $fp-12
	  lw $t1, -16($fp)	# fill _tmp21 to $t1 from $fp-16
	  seq $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp24 from $t2 to $fp-28
	# IfZ _tmp24 Goto _L9
	  lw $t0, -28($fp)	# fill _tmp24 to $t0 from $fp-28
	  beqz $t0, _L9	# branch if _tmp24 is zero 
	# PushParam _tmp23
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp23 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L9:
	# _tmp25 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -32($fp)	# spill _tmp25 from $t2 to $fp-32
	# _tmp26 = _tmp20 + _tmp25
	  lw $t0, -12($fp)	# fill _tmp20 to $t0 from $fp-12
	  lw $t1, -32($fp)	# fill _tmp25 to $t1 from $fp-32
	  add $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp26 from $t2 to $fp-36
	# _tmp27 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -40($fp)	# spill _tmp27 from $t2 to $fp-40
	# _tmp28 = _tmp26 * _tmp27
	  lw $t0, -36($fp)	# fill _tmp26 to $t0 from $fp-36
	  lw $t1, -40($fp)	# fill _tmp27 to $t1 from $fp-40
	  mul $t2, $t0, $t1	
	  sw $t2, -44($fp)	# spill _tmp28 from $t2 to $fp-44
	# PushParam _tmp28
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -44($fp)	# fill _tmp28 to $t0 from $fp-44
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp29 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -48($fp)	# spill _tmp29 from $t2 to $fp-48
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp29) = _tmp20
	  lw $t0, -12($fp)	# fill _tmp20 to $t0 from $fp-12
	  lw $t2, -48($fp)	# fill _tmp29 to $t2 from $fp-48
	  sw $t0, 0($t2) 	# store with offset
	# names = _tmp29
	  lw $t2, -48($fp)	# fill _tmp29 to $t2 from $fp-48
	  sw $t2, -8($fp)	# spill names from $t2 to $fp-8
	# _tmp30 = "Satish"
	  .data			# create string constant marked with label
	  _string3: .asciiz "Satish"
	  .text
	  la $t2, _string3	# load label
	  sw $t2, -52($fp)	# spill _tmp30 from $t2 to $fp-52
	# _tmp31 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -56($fp)	# spill _tmp31 from $t2 to $fp-56
	# _tmp32 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string4: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string4	# load label
	  sw $t2, -60($fp)	# spill _tmp32 from $t2 to $fp-60
	# _tmp33 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -64($fp)	# spill _tmp33 from $t2 to $fp-64
	# _tmp34 = _tmp31 < _tmp33
	  lw $t0, -56($fp)	# fill _tmp31 to $t0 from $fp-56
	  lw $t1, -64($fp)	# fill _tmp33 to $t1 from $fp-64
	  slt $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp34 from $t2 to $fp-68
	# IfZ _tmp34 Goto _L10
	  lw $t0, -68($fp)	# fill _tmp34 to $t0 from $fp-68
	  beqz $t0, _L10	# branch if _tmp34 is zero 
	# PushParam _tmp32
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -60($fp)	# fill _tmp32 to $t0 from $fp-60
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L10:
	# _tmp35 = *(names)
	  lw $t0, -8($fp)	# fill names to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -72($fp)	# spill _tmp35 from $t2 to $fp-72
	# _tmp36 = _tmp31 < _tmp35
	  lw $t0, -56($fp)	# fill _tmp31 to $t0 from $fp-56
	  lw $t1, -72($fp)	# fill _tmp35 to $t1 from $fp-72
	  slt $t2, $t0, $t1	
	  sw $t2, -76($fp)	# spill _tmp36 from $t2 to $fp-76
	# IfZ _tmp36 Goto _L12
	  lw $t0, -76($fp)	# fill _tmp36 to $t0 from $fp-76
	  beqz $t0, _L12	# branch if _tmp36 is zero 
	# Goto _L11
	  b _L11		# unconditional branch
  _L12:
	# PushParam _tmp32
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -60($fp)	# fill _tmp32 to $t0 from $fp-60
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L11:
	# _tmp37 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -80($fp)	# spill _tmp37 from $t2 to $fp-80
	# _tmp38 = _tmp31 + _tmp37
	  lw $t0, -56($fp)	# fill _tmp31 to $t0 from $fp-56
	  lw $t1, -80($fp)	# fill _tmp37 to $t1 from $fp-80
	  add $t2, $t0, $t1	
	  sw $t2, -84($fp)	# spill _tmp38 from $t2 to $fp-84
	# _tmp39 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -88($fp)	# spill _tmp39 from $t2 to $fp-88
	# _tmp40 = _tmp38 * _tmp39
	  lw $t0, -84($fp)	# fill _tmp38 to $t0 from $fp-84
	  lw $t1, -88($fp)	# fill _tmp39 to $t1 from $fp-88
	  mul $t2, $t0, $t1	
	  sw $t2, -92($fp)	# spill _tmp40 from $t2 to $fp-92
	# _tmp41 = names + _tmp40
	  lw $t0, -8($fp)	# fill names to $t0 from $fp-8
	  lw $t1, -92($fp)	# fill _tmp40 to $t1 from $fp-92
	  add $t2, $t0, $t1	
	  sw $t2, -96($fp)	# spill _tmp41 from $t2 to $fp-96
	# *(_tmp41) = _tmp30
	  lw $t0, -52($fp)	# fill _tmp30 to $t0 from $fp-52
	  lw $t2, -96($fp)	# fill _tmp41 to $t2 from $fp-96
	  sw $t0, 0($t2) 	# store with offset
	# _tmp42 = "Chun"
	  .data			# create string constant marked with label
	  _string5: .asciiz "Chun"
	  .text
	  la $t2, _string5	# load label
	  sw $t2, -100($fp)	# spill _tmp42 from $t2 to $fp-100
	# _tmp43 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -104($fp)	# spill _tmp43 from $t2 to $fp-104
	# _tmp44 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string6	# load label
	  sw $t2, -108($fp)	# spill _tmp44 from $t2 to $fp-108
	# _tmp45 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -112($fp)	# spill _tmp45 from $t2 to $fp-112
	# _tmp46 = _tmp43 < _tmp45
	  lw $t0, -104($fp)	# fill _tmp43 to $t0 from $fp-104
	  lw $t1, -112($fp)	# fill _tmp45 to $t1 from $fp-112
	  slt $t2, $t0, $t1	
	  sw $t2, -116($fp)	# spill _tmp46 from $t2 to $fp-116
	# IfZ _tmp46 Goto _L13
	  lw $t0, -116($fp)	# fill _tmp46 to $t0 from $fp-116
	  beqz $t0, _L13	# branch if _tmp46 is zero 
	# PushParam _tmp44
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -108($fp)	# fill _tmp44 to $t0 from $fp-108
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L13:
	# _tmp47 = *(names)
	  lw $t0, -8($fp)	# fill names to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -120($fp)	# spill _tmp47 from $t2 to $fp-120
	# _tmp48 = _tmp43 < _tmp47
	  lw $t0, -104($fp)	# fill _tmp43 to $t0 from $fp-104
	  lw $t1, -120($fp)	# fill _tmp47 to $t1 from $fp-120
	  slt $t2, $t0, $t1	
	  sw $t2, -124($fp)	# spill _tmp48 from $t2 to $fp-124
	# IfZ _tmp48 Goto _L15
	  lw $t0, -124($fp)	# fill _tmp48 to $t0 from $fp-124
	  beqz $t0, _L15	# branch if _tmp48 is zero 
	# Goto _L14
	  b _L14		# unconditional branch
  _L15:
	# PushParam _tmp44
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -108($fp)	# fill _tmp44 to $t0 from $fp-108
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L14:
	# _tmp49 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -128($fp)	# spill _tmp49 from $t2 to $fp-128
	# _tmp50 = _tmp43 + _tmp49
	  lw $t0, -104($fp)	# fill _tmp43 to $t0 from $fp-104
	  lw $t1, -128($fp)	# fill _tmp49 to $t1 from $fp-128
	  add $t2, $t0, $t1	
	  sw $t2, -132($fp)	# spill _tmp50 from $t2 to $fp-132
	# _tmp51 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -136($fp)	# spill _tmp51 from $t2 to $fp-136
	# _tmp52 = _tmp50 * _tmp51
	  lw $t0, -132($fp)	# fill _tmp50 to $t0 from $fp-132
	  lw $t1, -136($fp)	# fill _tmp51 to $t1 from $fp-136
	  mul $t2, $t0, $t1	
	  sw $t2, -140($fp)	# spill _tmp52 from $t2 to $fp-140
	# _tmp53 = names + _tmp52
	  lw $t0, -8($fp)	# fill names to $t0 from $fp-8
	  lw $t1, -140($fp)	# fill _tmp52 to $t1 from $fp-140
	  add $t2, $t0, $t1	
	  sw $t2, -144($fp)	# spill _tmp53 from $t2 to $fp-144
	# *(_tmp53) = _tmp42
	  lw $t0, -100($fp)	# fill _tmp42 to $t0 from $fp-100
	  lw $t2, -144($fp)	# fill _tmp53 to $t2 from $fp-144
	  sw $t0, 0($t2) 	# store with offset
	# _tmp54 = "Supriya"
	  .data			# create string constant marked with label
	  _string7: .asciiz "Supriya"
	  .text
	  la $t2, _string7	# load label
	  sw $t2, -148($fp)	# spill _tmp54 from $t2 to $fp-148
	# _tmp55 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -152($fp)	# spill _tmp55 from $t2 to $fp-152
	# _tmp56 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string8	# load label
	  sw $t2, -156($fp)	# spill _tmp56 from $t2 to $fp-156
	# _tmp57 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -160($fp)	# spill _tmp57 from $t2 to $fp-160
	# _tmp58 = _tmp55 < _tmp57
	  lw $t0, -152($fp)	# fill _tmp55 to $t0 from $fp-152
	  lw $t1, -160($fp)	# fill _tmp57 to $t1 from $fp-160
	  slt $t2, $t0, $t1	
	  sw $t2, -164($fp)	# spill _tmp58 from $t2 to $fp-164
	# IfZ _tmp58 Goto _L16
	  lw $t0, -164($fp)	# fill _tmp58 to $t0 from $fp-164
	  beqz $t0, _L16	# branch if _tmp58 is zero 
	# PushParam _tmp56
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -156($fp)	# fill _tmp56 to $t0 from $fp-156
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L16:
	# _tmp59 = *(names)
	  lw $t0, -8($fp)	# fill names to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -168($fp)	# spill _tmp59 from $t2 to $fp-168
	# _tmp60 = _tmp55 < _tmp59
	  lw $t0, -152($fp)	# fill _tmp55 to $t0 from $fp-152
	  lw $t1, -168($fp)	# fill _tmp59 to $t1 from $fp-168
	  slt $t2, $t0, $t1	
	  sw $t2, -172($fp)	# spill _tmp60 from $t2 to $fp-172
	# IfZ _tmp60 Goto _L18
	  lw $t0, -172($fp)	# fill _tmp60 to $t0 from $fp-172
	  beqz $t0, _L18	# branch if _tmp60 is zero 
	# Goto _L17
	  b _L17		# unconditional branch
  _L18:
	# PushParam _tmp56
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -156($fp)	# fill _tmp56 to $t0 from $fp-156
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L17:
	# _tmp61 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -176($fp)	# spill _tmp61 from $t2 to $fp-176
	# _tmp62 = _tmp55 + _tmp61
	  lw $t0, -152($fp)	# fill _tmp55 to $t0 from $fp-152
	  lw $t1, -176($fp)	# fill _tmp61 to $t1 from $fp-176
	  add $t2, $t0, $t1	
	  sw $t2, -180($fp)	# spill _tmp62 from $t2 to $fp-180
	# _tmp63 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -184($fp)	# spill _tmp63 from $t2 to $fp-184
	# _tmp64 = _tmp62 * _tmp63
	  lw $t0, -180($fp)	# fill _tmp62 to $t0 from $fp-180
	  lw $t1, -184($fp)	# fill _tmp63 to $t1 from $fp-184
	  mul $t2, $t0, $t1	
	  sw $t2, -188($fp)	# spill _tmp64 from $t2 to $fp-188
	# _tmp65 = names + _tmp64
	  lw $t0, -8($fp)	# fill names to $t0 from $fp-8
	  lw $t1, -188($fp)	# fill _tmp64 to $t1 from $fp-188
	  add $t2, $t0, $t1	
	  sw $t2, -192($fp)	# spill _tmp65 from $t2 to $fp-192
	# *(_tmp65) = _tmp54
	  lw $t0, -148($fp)	# fill _tmp54 to $t0 from $fp-148
	  lw $t2, -192($fp)	# fill _tmp65 to $t2 from $fp-192
	  sw $t0, 0($t2) 	# store with offset
  _L19:
	# _tmp66 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -196($fp)	# spill _tmp66 from $t2 to $fp-196
	# IfZ _tmp66 Goto _L20
	  lw $t0, -196($fp)	# fill _tmp66 to $t0 from $fp-196
	  beqz $t0, _L20	# branch if _tmp66 is zero 
	# _tmp67 = "\nWho is your favorite EECS483 staff member? "
	  .data			# create string constant marked with label
	  _string9: .asciiz "\nWho is your favorite EECS483 staff member? "
	  .text
	  la $t2, _string9	# load label
	  sw $t2, -200($fp)	# spill _tmp67 from $t2 to $fp-200
	# PushParam _tmp67
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -200($fp)	# fill _tmp67 to $t0 from $fp-200
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp68 = LCall _ReadLine
	  jal _ReadLine      	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -204($fp)	# spill _tmp68 from $t2 to $fp-204
	# PushParam _tmp68
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -204($fp)	# fill _tmp68 to $t0 from $fp-204
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam names
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill names to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp69 = LCall _Wild
	  jal _Wild          	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -208($fp)	# spill _tmp69 from $t2 to $fp-208
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# IfZ _tmp69 Goto _L21
	  lw $t0, -208($fp)	# fill _tmp69 to $t0 from $fp-208
	  beqz $t0, _L21	# branch if _tmp69 is zero 
	# _tmp70 = "You just earned 1000 bonus points!\n"
	  .data			# create string constant marked with label
	  _string10: .asciiz "You just earned 1000 bonus points!\n"
	  .text
	  la $t2, _string10	# load label
	  sw $t2, -212($fp)	# spill _tmp70 from $t2 to $fp-212
	# PushParam _tmp70
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -212($fp)	# fill _tmp70 to $t0 from $fp-212
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L20
	  b _L20		# unconditional branch
	# Goto _L22
	  b _L22		# unconditional branch
  _L21:
  _L22:
	# _tmp71 = "That's not a good way to make points. Try again!\..."
	  .data			# create string constant marked with label
	  _string11: .asciiz "That's not a good way to make points. Try again!\n"
	  .text
	  la $t2, _string11	# load label
	  sw $t2, -216($fp)	# spill _tmp71 from $t2 to $fp-216
	# PushParam _tmp71
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -216($fp)	# fill _tmp71 to $t0 from $fp-216
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L19
	  b _L19		# unconditional branch
  _L20:
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
