	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _tester:
	# BeginFunc 188
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 188	# decrement sp to make space for locals/temps
	# _tmp0 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -16($fp)	# spill _tmp0 from $t2 to $fp-16
	# _tmp1 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -20($fp)	# spill _tmp1 from $t2 to $fp-20
	# _tmp2 = _tmp0 < _tmp1
	  lw $t0, -16($fp)	# fill _tmp0 to $t0 from $fp-16
	  lw $t1, -20($fp)	# fill _tmp1 to $t1 from $fp-20
	  slt $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp2 from $t2 to $fp-24
	# IfZ _tmp2 Goto _L0
	  lw $t0, -24($fp)	# fill _tmp2 to $t0 from $fp-24
	  beqz $t0, _L0	# branch if _tmp2 is zero 
	# _tmp3 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t2, _string1	# load label
	  sw $t2, -28($fp)	# spill _tmp3 from $t2 to $fp-28
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -28($fp)	# fill _tmp3 to $t0 from $fp-28
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L0:
	# _tmp4 = _tmp0 == _tmp1
	  lw $t0, -16($fp)	# fill _tmp0 to $t0 from $fp-16
	  lw $t1, -20($fp)	# fill _tmp1 to $t1 from $fp-20
	  seq $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp4 from $t2 to $fp-32
	# IfZ _tmp4 Goto _L1
	  lw $t0, -32($fp)	# fill _tmp4 to $t0 from $fp-32
	  beqz $t0, _L1	# branch if _tmp4 is zero 
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -28($fp)	# fill _tmp3 to $t0 from $fp-28
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L1:
	# _tmp5 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -36($fp)	# spill _tmp5 from $t2 to $fp-36
	# _tmp6 = _tmp0 + _tmp5
	  lw $t0, -16($fp)	# fill _tmp0 to $t0 from $fp-16
	  lw $t1, -36($fp)	# fill _tmp5 to $t1 from $fp-36
	  add $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp6 from $t2 to $fp-40
	# _tmp7 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -44($fp)	# spill _tmp7 from $t2 to $fp-44
	# _tmp8 = _tmp6 * _tmp7
	  lw $t0, -40($fp)	# fill _tmp6 to $t0 from $fp-40
	  lw $t1, -44($fp)	# fill _tmp7 to $t1 from $fp-44
	  mul $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp8 from $t2 to $fp-48
	# PushParam _tmp8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -48($fp)	# fill _tmp8 to $t0 from $fp-48
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp9 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -52($fp)	# spill _tmp9 from $t2 to $fp-52
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp9) = _tmp0
	  lw $t0, -16($fp)	# fill _tmp0 to $t0 from $fp-16
	  lw $t2, -52($fp)	# fill _tmp9 to $t2 from $fp-52
	  sw $t0, 0($t2) 	# store with offset
	# b = _tmp9
	  lw $t2, -52($fp)	# fill _tmp9 to $t2 from $fp-52
	  sw $t2, 4($gp)	# spill b from $t2 to $gp+4
	# _tmp10 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -56($fp)	# spill _tmp10 from $t2 to $fp-56
	# _tmp11 = sz < _tmp10
	  lw $t0, 4($fp)	# fill sz to $t0 from $fp+4
	  lw $t1, -56($fp)	# fill _tmp10 to $t1 from $fp-56
	  slt $t2, $t0, $t1	
	  sw $t2, -60($fp)	# spill _tmp11 from $t2 to $fp-60
	# IfZ _tmp11 Goto _L2
	  lw $t0, -60($fp)	# fill _tmp11 to $t0 from $fp-60
	  beqz $t0, _L2	# branch if _tmp11 is zero 
	# _tmp12 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array size is <= 0\n"
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
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L2:
	# _tmp13 = sz == _tmp10
	  lw $t0, 4($fp)	# fill sz to $t0 from $fp+4
	  lw $t1, -56($fp)	# fill _tmp10 to $t1 from $fp-56
	  seq $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp13 from $t2 to $fp-68
	# IfZ _tmp13 Goto _L3
	  lw $t0, -68($fp)	# fill _tmp13 to $t0 from $fp-68
	  beqz $t0, _L3	# branch if _tmp13 is zero 
	# PushParam _tmp12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -64($fp)	# fill _tmp12 to $t0 from $fp-64
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L3:
	# _tmp14 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -72($fp)	# spill _tmp14 from $t2 to $fp-72
	# _tmp15 = sz + _tmp14
	  lw $t0, 4($fp)	# fill sz to $t0 from $fp+4
	  lw $t1, -72($fp)	# fill _tmp14 to $t1 from $fp-72
	  add $t2, $t0, $t1	
	  sw $t2, -76($fp)	# spill _tmp15 from $t2 to $fp-76
	# _tmp16 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -80($fp)	# spill _tmp16 from $t2 to $fp-80
	# _tmp17 = _tmp15 * _tmp16
	  lw $t0, -76($fp)	# fill _tmp15 to $t0 from $fp-76
	  lw $t1, -80($fp)	# fill _tmp16 to $t1 from $fp-80
	  mul $t2, $t0, $t1	
	  sw $t2, -84($fp)	# spill _tmp17 from $t2 to $fp-84
	# PushParam _tmp17
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -84($fp)	# fill _tmp17 to $t0 from $fp-84
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp18 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -88($fp)	# spill _tmp18 from $t2 to $fp-88
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp18) = sz
	  lw $t0, 4($fp)	# fill sz to $t0 from $fp+4
	  lw $t2, -88($fp)	# fill _tmp18 to $t2 from $fp-88
	  sw $t0, 0($t2) 	# store with offset
	# result = _tmp18
	  lw $t2, -88($fp)	# fill _tmp18 to $t2 from $fp-88
	  sw $t2, -12($fp)	# spill result from $t2 to $fp-12
	# _tmp19 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -92($fp)	# spill _tmp19 from $t2 to $fp-92
	# i = _tmp19
	  lw $t2, -92($fp)	# fill _tmp19 to $t2 from $fp-92
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  _L4:
	# _tmp20 = i < sz
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, 4($fp)	# fill sz to $t1 from $fp+4
	  slt $t2, $t0, $t1	
	  sw $t2, -96($fp)	# spill _tmp20 from $t2 to $fp-96
	# IfZ _tmp20 Goto _L5
	  lw $t0, -96($fp)	# fill _tmp20 to $t0 from $fp-96
	  beqz $t0, _L5	# branch if _tmp20 is zero 
	# _tmp21 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string3	# load label
	  sw $t2, -100($fp)	# spill _tmp21 from $t2 to $fp-100
	# _tmp22 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -104($fp)	# spill _tmp22 from $t2 to $fp-104
	# _tmp23 = i < _tmp22
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -104($fp)	# fill _tmp22 to $t1 from $fp-104
	  slt $t2, $t0, $t1	
	  sw $t2, -108($fp)	# spill _tmp23 from $t2 to $fp-108
	# IfZ _tmp23 Goto _L6
	  lw $t0, -108($fp)	# fill _tmp23 to $t0 from $fp-108
	  beqz $t0, _L6	# branch if _tmp23 is zero 
	# PushParam _tmp21
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -100($fp)	# fill _tmp21 to $t0 from $fp-100
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L6:
	# _tmp24 = *(result)
	  lw $t0, -12($fp)	# fill result to $t0 from $fp-12
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -112($fp)	# spill _tmp24 from $t2 to $fp-112
	# _tmp25 = i < _tmp24
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -112($fp)	# fill _tmp24 to $t1 from $fp-112
	  slt $t2, $t0, $t1	
	  sw $t2, -116($fp)	# spill _tmp25 from $t2 to $fp-116
	# IfZ _tmp25 Goto _L8
	  lw $t0, -116($fp)	# fill _tmp25 to $t0 from $fp-116
	  beqz $t0, _L8	# branch if _tmp25 is zero 
	# Goto _L7
	  b _L7		# unconditional branch
  _L8:
	# PushParam _tmp21
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -100($fp)	# fill _tmp21 to $t0 from $fp-100
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L7:
	# _tmp26 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -120($fp)	# spill _tmp26 from $t2 to $fp-120
	# _tmp27 = i + _tmp26
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -120($fp)	# fill _tmp26 to $t1 from $fp-120
	  add $t2, $t0, $t1	
	  sw $t2, -124($fp)	# spill _tmp27 from $t2 to $fp-124
	# _tmp28 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -128($fp)	# spill _tmp28 from $t2 to $fp-128
	# _tmp29 = _tmp27 * _tmp28
	  lw $t0, -124($fp)	# fill _tmp27 to $t0 from $fp-124
	  lw $t1, -128($fp)	# fill _tmp28 to $t1 from $fp-128
	  mul $t2, $t0, $t1	
	  sw $t2, -132($fp)	# spill _tmp29 from $t2 to $fp-132
	# _tmp30 = result + _tmp29
	  lw $t0, -12($fp)	# fill result to $t0 from $fp-12
	  lw $t1, -132($fp)	# fill _tmp29 to $t1 from $fp-132
	  add $t2, $t0, $t1	
	  sw $t2, -136($fp)	# spill _tmp30 from $t2 to $fp-136
	# *(_tmp30) = i
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t2, -136($fp)	# fill _tmp30 to $t2 from $fp-136
	  sw $t0, 0($t2) 	# store with offset
	# _tmp31 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -140($fp)	# spill _tmp31 from $t2 to $fp-140
	# _tmp32 = i + _tmp31
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -140($fp)	# fill _tmp31 to $t1 from $fp-140
	  add $t2, $t0, $t1	
	  sw $t2, -144($fp)	# spill _tmp32 from $t2 to $fp-144
	# i = _tmp32
	  lw $t2, -144($fp)	# fill _tmp32 to $t2 from $fp-144
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# Goto _L4
	  b _L4		# unconditional branch
  _L5:
	# _tmp33 = "Done"
	  .data			# create string constant marked with label
	  _string4: .asciiz "Done"
	  .text
	  la $t2, _string4	# load label
	  sw $t2, -148($fp)	# spill _tmp33 from $t2 to $fp-148
	# _tmp34 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -152($fp)	# spill _tmp34 from $t2 to $fp-152
	# _tmp35 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string5: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string5	# load label
	  sw $t2, -156($fp)	# spill _tmp35 from $t2 to $fp-156
	# _tmp36 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -160($fp)	# spill _tmp36 from $t2 to $fp-160
	# _tmp37 = _tmp34 < _tmp36
	  lw $t0, -152($fp)	# fill _tmp34 to $t0 from $fp-152
	  lw $t1, -160($fp)	# fill _tmp36 to $t1 from $fp-160
	  slt $t2, $t0, $t1	
	  sw $t2, -164($fp)	# spill _tmp37 from $t2 to $fp-164
	# IfZ _tmp37 Goto _L9
	  lw $t0, -164($fp)	# fill _tmp37 to $t0 from $fp-164
	  beqz $t0, _L9	# branch if _tmp37 is zero 
	# PushParam _tmp35
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -156($fp)	# fill _tmp35 to $t0 from $fp-156
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L9:
	# _tmp38 = *(b)
	  lw $t0, 4($gp)	# fill b to $t0 from $gp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -168($fp)	# spill _tmp38 from $t2 to $fp-168
	# _tmp39 = _tmp34 < _tmp38
	  lw $t0, -152($fp)	# fill _tmp34 to $t0 from $fp-152
	  lw $t1, -168($fp)	# fill _tmp38 to $t1 from $fp-168
	  slt $t2, $t0, $t1	
	  sw $t2, -172($fp)	# spill _tmp39 from $t2 to $fp-172
	# IfZ _tmp39 Goto _L11
	  lw $t0, -172($fp)	# fill _tmp39 to $t0 from $fp-172
	  beqz $t0, _L11	# branch if _tmp39 is zero 
	# Goto _L10
	  b _L10		# unconditional branch
  _L11:
	# PushParam _tmp35
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -156($fp)	# fill _tmp35 to $t0 from $fp-156
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L10:
	# _tmp40 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -176($fp)	# spill _tmp40 from $t2 to $fp-176
	# _tmp41 = _tmp34 + _tmp40
	  lw $t0, -152($fp)	# fill _tmp34 to $t0 from $fp-152
	  lw $t1, -176($fp)	# fill _tmp40 to $t1 from $fp-176
	  add $t2, $t0, $t1	
	  sw $t2, -180($fp)	# spill _tmp41 from $t2 to $fp-180
	# _tmp42 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -184($fp)	# spill _tmp42 from $t2 to $fp-184
	# _tmp43 = _tmp41 * _tmp42
	  lw $t0, -180($fp)	# fill _tmp41 to $t0 from $fp-180
	  lw $t1, -184($fp)	# fill _tmp42 to $t1 from $fp-184
	  mul $t2, $t0, $t1	
	  sw $t2, -188($fp)	# spill _tmp43 from $t2 to $fp-188
	# _tmp44 = b + _tmp43
	  lw $t0, 4($gp)	# fill b to $t0 from $gp+4
	  lw $t1, -188($fp)	# fill _tmp43 to $t1 from $fp-188
	  add $t2, $t0, $t1	
	  sw $t2, -192($fp)	# spill _tmp44 from $t2 to $fp-192
	# *(_tmp44) = _tmp33
	  lw $t0, -148($fp)	# fill _tmp33 to $t0 from $fp-148
	  lw $t2, -192($fp)	# fill _tmp44 to $t2 from $fp-192
	  sw $t0, 0($t2) 	# store with offset
	# Return result
	  lw $t2, -12($fp)	# fill result to $t2 from $fp-12
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
	# BeginFunc 180
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 180	# decrement sp to make space for locals/temps
	# _tmp45 = 8
	  li $t2, 8		# load constant value 8 into $t2
	  sw $t2, -12($fp)	# spill _tmp45 from $t2 to $fp-12
	# PushParam _tmp45
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp45 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp46 = LCall _tester
	  jal _tester        	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -16($fp)	# spill _tmp46 from $t2 to $fp-16
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# d = _tmp46
	  lw $t2, -16($fp)	# fill _tmp46 to $t2 from $fp-16
	  sw $t2, -8($fp)	# spill d from $t2 to $fp-8
	# _tmp47 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -20($fp)	# spill _tmp47 from $t2 to $fp-20
	# _tmp48 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string6	# load label
	  sw $t2, -24($fp)	# spill _tmp48 from $t2 to $fp-24
	# _tmp49 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -28($fp)	# spill _tmp49 from $t2 to $fp-28
	# _tmp50 = d == _tmp49
	  lw $t0, -8($fp)	# fill d to $t0 from $fp-8
	  lw $t1, -28($fp)	# fill _tmp49 to $t1 from $fp-28
	  seq $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp50 from $t2 to $fp-32
	# IfZ _tmp50 Goto _L12
	  lw $t0, -32($fp)	# fill _tmp50 to $t0 from $fp-32
	  beqz $t0, _L12	# branch if _tmp50 is zero 
	# PushParam _tmp48
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp48 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L12:
	# _tmp51 = _tmp47 < _tmp49
	  lw $t0, -20($fp)	# fill _tmp47 to $t0 from $fp-20
	  lw $t1, -28($fp)	# fill _tmp49 to $t1 from $fp-28
	  slt $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp51 from $t2 to $fp-36
	# IfZ _tmp51 Goto _L13
	  lw $t0, -36($fp)	# fill _tmp51 to $t0 from $fp-36
	  beqz $t0, _L13	# branch if _tmp51 is zero 
	# PushParam _tmp48
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp48 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L13:
	# _tmp52 = *(d)
	  lw $t0, -8($fp)	# fill d to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -40($fp)	# spill _tmp52 from $t2 to $fp-40
	# _tmp53 = _tmp47 < _tmp52
	  lw $t0, -20($fp)	# fill _tmp47 to $t0 from $fp-20
	  lw $t1, -40($fp)	# fill _tmp52 to $t1 from $fp-40
	  slt $t2, $t0, $t1	
	  sw $t2, -44($fp)	# spill _tmp53 from $t2 to $fp-44
	# IfZ _tmp53 Goto _L15
	  lw $t0, -44($fp)	# fill _tmp53 to $t0 from $fp-44
	  beqz $t0, _L15	# branch if _tmp53 is zero 
	# Goto _L14
	  b _L14		# unconditional branch
  _L15:
	# PushParam _tmp48
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp48 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L14:
	# _tmp54 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -48($fp)	# spill _tmp54 from $t2 to $fp-48
	# _tmp55 = _tmp47 + _tmp54
	  lw $t0, -20($fp)	# fill _tmp47 to $t0 from $fp-20
	  lw $t1, -48($fp)	# fill _tmp54 to $t1 from $fp-48
	  add $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp55 from $t2 to $fp-52
	# _tmp56 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -56($fp)	# spill _tmp56 from $t2 to $fp-56
	# _tmp57 = _tmp55 * _tmp56
	  lw $t0, -52($fp)	# fill _tmp55 to $t0 from $fp-52
	  lw $t1, -56($fp)	# fill _tmp56 to $t1 from $fp-56
	  mul $t2, $t0, $t1	
	  sw $t2, -60($fp)	# spill _tmp57 from $t2 to $fp-60
	# _tmp58 = d + _tmp57
	  lw $t0, -8($fp)	# fill d to $t0 from $fp-8
	  lw $t1, -60($fp)	# fill _tmp57 to $t1 from $fp-60
	  add $t2, $t0, $t1	
	  sw $t2, -64($fp)	# spill _tmp58 from $t2 to $fp-64
	# _tmp59 = *(_tmp58)
	  lw $t0, -64($fp)	# fill _tmp58 to $t0 from $fp-64
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -68($fp)	# spill _tmp59 from $t2 to $fp-68
	# _tmp60 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string7	# load label
	  sw $t2, -72($fp)	# spill _tmp60 from $t2 to $fp-72
	# _tmp61 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -76($fp)	# spill _tmp61 from $t2 to $fp-76
	# _tmp62 = d == _tmp61
	  lw $t0, -8($fp)	# fill d to $t0 from $fp-8
	  lw $t1, -76($fp)	# fill _tmp61 to $t1 from $fp-76
	  seq $t2, $t0, $t1	
	  sw $t2, -80($fp)	# spill _tmp62 from $t2 to $fp-80
	# IfZ _tmp62 Goto _L16
	  lw $t0, -80($fp)	# fill _tmp62 to $t0 from $fp-80
	  beqz $t0, _L16	# branch if _tmp62 is zero 
	# PushParam _tmp60
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -72($fp)	# fill _tmp60 to $t0 from $fp-72
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L16:
	# _tmp63 = _tmp59 < _tmp61
	  lw $t0, -68($fp)	# fill _tmp59 to $t0 from $fp-68
	  lw $t1, -76($fp)	# fill _tmp61 to $t1 from $fp-76
	  slt $t2, $t0, $t1	
	  sw $t2, -84($fp)	# spill _tmp63 from $t2 to $fp-84
	# IfZ _tmp63 Goto _L17
	  lw $t0, -84($fp)	# fill _tmp63 to $t0 from $fp-84
	  beqz $t0, _L17	# branch if _tmp63 is zero 
	# PushParam _tmp60
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -72($fp)	# fill _tmp60 to $t0 from $fp-72
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L17:
	# _tmp64 = *(d)
	  lw $t0, -8($fp)	# fill d to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -88($fp)	# spill _tmp64 from $t2 to $fp-88
	# _tmp65 = _tmp59 < _tmp64
	  lw $t0, -68($fp)	# fill _tmp59 to $t0 from $fp-68
	  lw $t1, -88($fp)	# fill _tmp64 to $t1 from $fp-88
	  slt $t2, $t0, $t1	
	  sw $t2, -92($fp)	# spill _tmp65 from $t2 to $fp-92
	# IfZ _tmp65 Goto _L19
	  lw $t0, -92($fp)	# fill _tmp65 to $t0 from $fp-92
	  beqz $t0, _L19	# branch if _tmp65 is zero 
	# Goto _L18
	  b _L18		# unconditional branch
  _L19:
	# PushParam _tmp60
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -72($fp)	# fill _tmp60 to $t0 from $fp-72
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L18:
	# _tmp66 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -96($fp)	# spill _tmp66 from $t2 to $fp-96
	# _tmp67 = _tmp59 + _tmp66
	  lw $t0, -68($fp)	# fill _tmp59 to $t0 from $fp-68
	  lw $t1, -96($fp)	# fill _tmp66 to $t1 from $fp-96
	  add $t2, $t0, $t1	
	  sw $t2, -100($fp)	# spill _tmp67 from $t2 to $fp-100
	# _tmp68 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -104($fp)	# spill _tmp68 from $t2 to $fp-104
	# _tmp69 = _tmp67 * _tmp68
	  lw $t0, -100($fp)	# fill _tmp67 to $t0 from $fp-100
	  lw $t1, -104($fp)	# fill _tmp68 to $t1 from $fp-104
	  mul $t2, $t0, $t1	
	  sw $t2, -108($fp)	# spill _tmp69 from $t2 to $fp-108
	# _tmp70 = d + _tmp69
	  lw $t0, -8($fp)	# fill d to $t0 from $fp-8
	  lw $t1, -108($fp)	# fill _tmp69 to $t1 from $fp-108
	  add $t2, $t0, $t1	
	  sw $t2, -112($fp)	# spill _tmp70 from $t2 to $fp-112
	# _tmp71 = *(_tmp70)
	  lw $t0, -112($fp)	# fill _tmp70 to $t0 from $fp-112
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -116($fp)	# spill _tmp71 from $t2 to $fp-116
	# PushParam _tmp71
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -116($fp)	# fill _tmp71 to $t0 from $fp-116
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp72 = "\n"
	  .data			# create string constant marked with label
	  _string8: .asciiz "\n"
	  .text
	  la $t2, _string8	# load label
	  sw $t2, -120($fp)	# spill _tmp72 from $t2 to $fp-120
	# PushParam _tmp72
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -120($fp)	# fill _tmp72 to $t0 from $fp-120
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp73 = *(d)
	  lw $t0, -8($fp)	# fill d to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -124($fp)	# spill _tmp73 from $t2 to $fp-124
	# PushParam _tmp73
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -124($fp)	# fill _tmp73 to $t0 from $fp-124
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp74 = "\n"
	  .data			# create string constant marked with label
	  _string9: .asciiz "\n"
	  .text
	  la $t2, _string9	# load label
	  sw $t2, -128($fp)	# spill _tmp74 from $t2 to $fp-128
	# PushParam _tmp74
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -128($fp)	# fill _tmp74 to $t0 from $fp-128
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp75 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -132($fp)	# spill _tmp75 from $t2 to $fp-132
	# _tmp76 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string10	# load label
	  sw $t2, -136($fp)	# spill _tmp76 from $t2 to $fp-136
	# _tmp77 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -140($fp)	# spill _tmp77 from $t2 to $fp-140
	# _tmp78 = b == _tmp77
	  lw $t0, 4($gp)	# fill b to $t0 from $gp+4
	  lw $t1, -140($fp)	# fill _tmp77 to $t1 from $fp-140
	  seq $t2, $t0, $t1	
	  sw $t2, -144($fp)	# spill _tmp78 from $t2 to $fp-144
	# IfZ _tmp78 Goto _L20
	  lw $t0, -144($fp)	# fill _tmp78 to $t0 from $fp-144
	  beqz $t0, _L20	# branch if _tmp78 is zero 
	# PushParam _tmp76
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -136($fp)	# fill _tmp76 to $t0 from $fp-136
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L20:
	# _tmp79 = _tmp75 < _tmp77
	  lw $t0, -132($fp)	# fill _tmp75 to $t0 from $fp-132
	  lw $t1, -140($fp)	# fill _tmp77 to $t1 from $fp-140
	  slt $t2, $t0, $t1	
	  sw $t2, -148($fp)	# spill _tmp79 from $t2 to $fp-148
	# IfZ _tmp79 Goto _L21
	  lw $t0, -148($fp)	# fill _tmp79 to $t0 from $fp-148
	  beqz $t0, _L21	# branch if _tmp79 is zero 
	# PushParam _tmp76
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -136($fp)	# fill _tmp76 to $t0 from $fp-136
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L21:
	# _tmp80 = *(b)
	  lw $t0, 4($gp)	# fill b to $t0 from $gp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -152($fp)	# spill _tmp80 from $t2 to $fp-152
	# _tmp81 = _tmp75 < _tmp80
	  lw $t0, -132($fp)	# fill _tmp75 to $t0 from $fp-132
	  lw $t1, -152($fp)	# fill _tmp80 to $t1 from $fp-152
	  slt $t2, $t0, $t1	
	  sw $t2, -156($fp)	# spill _tmp81 from $t2 to $fp-156
	# IfZ _tmp81 Goto _L23
	  lw $t0, -156($fp)	# fill _tmp81 to $t0 from $fp-156
	  beqz $t0, _L23	# branch if _tmp81 is zero 
	# Goto _L22
	  b _L22		# unconditional branch
  _L23:
	# PushParam _tmp76
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -136($fp)	# fill _tmp76 to $t0 from $fp-136
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L22:
	# _tmp82 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -160($fp)	# spill _tmp82 from $t2 to $fp-160
	# _tmp83 = _tmp75 + _tmp82
	  lw $t0, -132($fp)	# fill _tmp75 to $t0 from $fp-132
	  lw $t1, -160($fp)	# fill _tmp82 to $t1 from $fp-160
	  add $t2, $t0, $t1	
	  sw $t2, -164($fp)	# spill _tmp83 from $t2 to $fp-164
	# _tmp84 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -168($fp)	# spill _tmp84 from $t2 to $fp-168
	# _tmp85 = _tmp83 * _tmp84
	  lw $t0, -164($fp)	# fill _tmp83 to $t0 from $fp-164
	  lw $t1, -168($fp)	# fill _tmp84 to $t1 from $fp-168
	  mul $t2, $t0, $t1	
	  sw $t2, -172($fp)	# spill _tmp85 from $t2 to $fp-172
	# _tmp86 = b + _tmp85
	  lw $t0, 4($gp)	# fill b to $t0 from $gp+4
	  lw $t1, -172($fp)	# fill _tmp85 to $t1 from $fp-172
	  add $t2, $t0, $t1	
	  sw $t2, -176($fp)	# spill _tmp86 from $t2 to $fp-176
	# _tmp87 = *(_tmp86)
	  lw $t0, -176($fp)	# fill _tmp86 to $t0 from $fp-176
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -180($fp)	# spill _tmp87 from $t2 to $fp-180
	# PushParam _tmp87
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -180($fp)	# fill _tmp87 to $t0 from $fp-180
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp88 = "\n"
	  .data			# create string constant marked with label
	  _string11: .asciiz "\n"
	  .text
	  la $t2, _string11	# load label
	  sw $t2, -184($fp)	# spill _tmp88 from $t2 to $fp-184
	# PushParam _tmp88
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -184($fp)	# fill _tmp88 to $t0 from $fp-184
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
