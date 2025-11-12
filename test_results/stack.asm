	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
	# VTable for class Stack
	  .data
	  .align 2
	  Stack:		# label for class Stack vtable
	  .word _Stack.Init
	  .word _Stack.Push
	  .word _Stack.Pop
	  .word _Stack.NumElems
	  .text
  _Stack.Init:
	# BeginFunc 56
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 56	# decrement sp to make space for locals/temps
	# _tmp0 = 100
	  li $t2, 100		# load constant value 100 into $t2
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# _tmp1 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# _tmp2 = _tmp0 < _tmp1
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  lw $t1, -12($fp)	# fill _tmp1 to $t1 from $fp-12
	  slt $t2, $t0, $t1	
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# IfZ _tmp2 Goto _L0
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  beqz $t0, _L0	# branch if _tmp2 is zero 
	# _tmp3 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t2, _string1	# load label
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L0:
	# _tmp4 = _tmp0 == _tmp1
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  lw $t1, -12($fp)	# fill _tmp1 to $t1 from $fp-12
	  seq $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# IfZ _tmp4 Goto _L1
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  beqz $t0, _L1	# branch if _tmp4 is zero 
	# PushParam _tmp3
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
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
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = _tmp0 + _tmp5
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  lw $t1, -28($fp)	# fill _tmp5 to $t1 from $fp-28
	  add $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = _tmp6 * _tmp7
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  lw $t1, -36($fp)	# fill _tmp7 to $t1 from $fp-36
	  mul $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# PushParam _tmp8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp9 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp9) = _tmp0
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  lw $t2, -44($fp)	# fill _tmp9 to $t2 from $fp-44
	  sw $t0, 0($t2) 	# store with offset
	# *(this + 8) = _tmp9
	  lw $t0, -44($fp)	# fill _tmp9 to $t0 from $fp-44
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 8($t2) 	# store with offset
	# _tmp10 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	# *(this + 4) = _tmp10
	  lw $t0, -48($fp)	# fill _tmp10 to $t0 from $fp-48
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 4($t2) 	# store with offset
	# _tmp11 = 3
	  li $t2, 3		# load constant value 3 into $t2
	  sw $t2, -52($fp)	# spill _tmp11 from $t2 to $fp-52
	# PushParam _tmp11
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -52($fp)	# fill _tmp11 to $t0 from $fp-52
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp12 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -56($fp)	# spill _tmp12 from $t2 to $fp-56
	# _tmp13 = *(_tmp12 + 4)
	  lw $t0, -56($fp)	# fill _tmp12 to $t0 from $fp-56
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -60($fp)	# spill _tmp13 from $t2 to $fp-60
	# ACall _tmp13
	  lw $t0, -60($fp)	# fill _tmp13 to $t0 from $fp-60
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Stack.Push:
	# BeginFunc 60
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 60	# decrement sp to make space for locals/temps
	# _tmp14 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -8($fp)	# spill _tmp14 from $t2 to $fp-8
	# _tmp15 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp15 from $t2 to $fp-12
	# _tmp16 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string2	# load label
	  sw $t2, -16($fp)	# spill _tmp16 from $t2 to $fp-16
	# _tmp17 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -20($fp)	# spill _tmp17 from $t2 to $fp-20
	# _tmp18 = _tmp15 < _tmp17
	  lw $t0, -12($fp)	# fill _tmp15 to $t0 from $fp-12
	  lw $t1, -20($fp)	# fill _tmp17 to $t1 from $fp-20
	  slt $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp18 from $t2 to $fp-24
	# IfZ _tmp18 Goto _L2
	  lw $t0, -24($fp)	# fill _tmp18 to $t0 from $fp-24
	  beqz $t0, _L2	# branch if _tmp18 is zero 
	# PushParam _tmp16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp16 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L2:
	# _tmp19 = *(_tmp14)
	  lw $t0, -8($fp)	# fill _tmp14 to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -28($fp)	# spill _tmp19 from $t2 to $fp-28
	# _tmp20 = _tmp15 < _tmp19
	  lw $t0, -12($fp)	# fill _tmp15 to $t0 from $fp-12
	  lw $t1, -28($fp)	# fill _tmp19 to $t1 from $fp-28
	  slt $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp20 from $t2 to $fp-32
	# IfZ _tmp20 Goto _L4
	  lw $t0, -32($fp)	# fill _tmp20 to $t0 from $fp-32
	  beqz $t0, _L4	# branch if _tmp20 is zero 
	# Goto _L3
	  b _L3		# unconditional branch
  _L4:
	# PushParam _tmp16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp16 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L3:
	# _tmp21 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -36($fp)	# spill _tmp21 from $t2 to $fp-36
	# _tmp22 = _tmp15 + _tmp21
	  lw $t0, -12($fp)	# fill _tmp15 to $t0 from $fp-12
	  lw $t1, -36($fp)	# fill _tmp21 to $t1 from $fp-36
	  add $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp22 from $t2 to $fp-40
	# _tmp23 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -44($fp)	# spill _tmp23 from $t2 to $fp-44
	# _tmp24 = _tmp22 * _tmp23
	  lw $t0, -40($fp)	# fill _tmp22 to $t0 from $fp-40
	  lw $t1, -44($fp)	# fill _tmp23 to $t1 from $fp-44
	  mul $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp24 from $t2 to $fp-48
	# _tmp25 = _tmp14 + _tmp24
	  lw $t0, -8($fp)	# fill _tmp14 to $t0 from $fp-8
	  lw $t1, -48($fp)	# fill _tmp24 to $t1 from $fp-48
	  add $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp25 from $t2 to $fp-52
	# *(_tmp25) = i
	  lw $t0, 8($fp)	# fill i to $t0 from $fp+8
	  lw $t2, -52($fp)	# fill _tmp25 to $t2 from $fp-52
	  sw $t0, 0($t2) 	# store with offset
	# _tmp26 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -56($fp)	# spill _tmp26 from $t2 to $fp-56
	# _tmp27 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -60($fp)	# spill _tmp27 from $t2 to $fp-60
	# _tmp28 = _tmp26 + _tmp27
	  lw $t0, -56($fp)	# fill _tmp26 to $t0 from $fp-56
	  lw $t1, -60($fp)	# fill _tmp27 to $t1 from $fp-60
	  add $t2, $t0, $t1	
	  sw $t2, -64($fp)	# spill _tmp28 from $t2 to $fp-64
	# *(this + 4) = _tmp28
	  lw $t0, -64($fp)	# fill _tmp28 to $t0 from $fp-64
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 4($t2) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Stack.Pop:
	# BeginFunc 80
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 80	# decrement sp to make space for locals/temps
	# _tmp29 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp29 from $t2 to $fp-12
	# _tmp30 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp30 from $t2 to $fp-16
	# _tmp31 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -20($fp)	# spill _tmp31 from $t2 to $fp-20
	# _tmp32 = _tmp30 - _tmp31
	  lw $t0, -16($fp)	# fill _tmp30 to $t0 from $fp-16
	  lw $t1, -20($fp)	# fill _tmp31 to $t1 from $fp-20
	  sub $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp32 from $t2 to $fp-24
	# _tmp33 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string3	# load label
	  sw $t2, -28($fp)	# spill _tmp33 from $t2 to $fp-28
	# _tmp34 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -32($fp)	# spill _tmp34 from $t2 to $fp-32
	# _tmp35 = _tmp29 == _tmp34
	  lw $t0, -12($fp)	# fill _tmp29 to $t0 from $fp-12
	  lw $t1, -32($fp)	# fill _tmp34 to $t1 from $fp-32
	  seq $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp35 from $t2 to $fp-36
	# IfZ _tmp35 Goto _L5
	  lw $t0, -36($fp)	# fill _tmp35 to $t0 from $fp-36
	  beqz $t0, _L5	# branch if _tmp35 is zero 
	# PushParam _tmp33
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -28($fp)	# fill _tmp33 to $t0 from $fp-28
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L5:
	# _tmp36 = _tmp32 < _tmp34
	  lw $t0, -24($fp)	# fill _tmp32 to $t0 from $fp-24
	  lw $t1, -32($fp)	# fill _tmp34 to $t1 from $fp-32
	  slt $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp36 from $t2 to $fp-40
	# IfZ _tmp36 Goto _L6
	  lw $t0, -40($fp)	# fill _tmp36 to $t0 from $fp-40
	  beqz $t0, _L6	# branch if _tmp36 is zero 
	# PushParam _tmp33
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -28($fp)	# fill _tmp33 to $t0 from $fp-28
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L6:
	# _tmp37 = *(_tmp29)
	  lw $t0, -12($fp)	# fill _tmp29 to $t0 from $fp-12
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -44($fp)	# spill _tmp37 from $t2 to $fp-44
	# _tmp38 = _tmp32 < _tmp37
	  lw $t0, -24($fp)	# fill _tmp32 to $t0 from $fp-24
	  lw $t1, -44($fp)	# fill _tmp37 to $t1 from $fp-44
	  slt $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp38 from $t2 to $fp-48
	# IfZ _tmp38 Goto _L8
	  lw $t0, -48($fp)	# fill _tmp38 to $t0 from $fp-48
	  beqz $t0, _L8	# branch if _tmp38 is zero 
	# Goto _L7
	  b _L7		# unconditional branch
  _L8:
	# PushParam _tmp33
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -28($fp)	# fill _tmp33 to $t0 from $fp-28
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L7:
	# _tmp39 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -52($fp)	# spill _tmp39 from $t2 to $fp-52
	# _tmp40 = _tmp32 + _tmp39
	  lw $t0, -24($fp)	# fill _tmp32 to $t0 from $fp-24
	  lw $t1, -52($fp)	# fill _tmp39 to $t1 from $fp-52
	  add $t2, $t0, $t1	
	  sw $t2, -56($fp)	# spill _tmp40 from $t2 to $fp-56
	# _tmp41 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -60($fp)	# spill _tmp41 from $t2 to $fp-60
	# _tmp42 = _tmp40 * _tmp41
	  lw $t0, -56($fp)	# fill _tmp40 to $t0 from $fp-56
	  lw $t1, -60($fp)	# fill _tmp41 to $t1 from $fp-60
	  mul $t2, $t0, $t1	
	  sw $t2, -64($fp)	# spill _tmp42 from $t2 to $fp-64
	# _tmp43 = _tmp29 + _tmp42
	  lw $t0, -12($fp)	# fill _tmp29 to $t0 from $fp-12
	  lw $t1, -64($fp)	# fill _tmp42 to $t1 from $fp-64
	  add $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp43 from $t2 to $fp-68
	# _tmp44 = *(_tmp43)
	  lw $t0, -68($fp)	# fill _tmp43 to $t0 from $fp-68
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -72($fp)	# spill _tmp44 from $t2 to $fp-72
	# val = _tmp44
	  lw $t2, -72($fp)	# fill _tmp44 to $t2 from $fp-72
	  sw $t2, -8($fp)	# spill val from $t2 to $fp-8
	# _tmp45 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -76($fp)	# spill _tmp45 from $t2 to $fp-76
	# _tmp46 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -80($fp)	# spill _tmp46 from $t2 to $fp-80
	# _tmp47 = _tmp45 - _tmp46
	  lw $t0, -76($fp)	# fill _tmp45 to $t0 from $fp-76
	  lw $t1, -80($fp)	# fill _tmp46 to $t1 from $fp-80
	  sub $t2, $t0, $t1	
	  sw $t2, -84($fp)	# spill _tmp47 from $t2 to $fp-84
	# *(this + 4) = _tmp47
	  lw $t0, -84($fp)	# fill _tmp47 to $t0 from $fp-84
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 4($t2) 	# store with offset
	# Return val
	  lw $t2, -8($fp)	# fill val to $t2 from $fp-8
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
  _Stack.NumElems:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp48 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -8($fp)	# spill _tmp48 from $t2 to $fp-8
	# Return _tmp48
	  lw $t2, -8($fp)	# fill _tmp48 to $t2 from $fp-8
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
	# BeginFunc 136
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 136	# decrement sp to make space for locals/temps
	# _tmp49 = 12
	  li $t2, 12		# load constant value 12 into $t2
	  sw $t2, -12($fp)	# spill _tmp49 from $t2 to $fp-12
	# PushParam _tmp49
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp49 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp50 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -16($fp)	# spill _tmp50 from $t2 to $fp-16
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp51 = Stack
	  la $t2, Stack	# load label
	  sw $t2, -20($fp)	# spill _tmp51 from $t2 to $fp-20
	# *(_tmp50) = _tmp51
	  lw $t0, -20($fp)	# fill _tmp51 to $t0 from $fp-20
	  lw $t2, -16($fp)	# fill _tmp50 to $t2 from $fp-16
	  sw $t0, 0($t2) 	# store with offset
	# s = _tmp50
	  lw $t2, -16($fp)	# fill _tmp50 to $t2 from $fp-16
	  sw $t2, -8($fp)	# spill s from $t2 to $fp-8
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp52 = *(s)
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -24($fp)	# spill _tmp52 from $t2 to $fp-24
	# _tmp53 = *(_tmp52)
	  lw $t0, -24($fp)	# fill _tmp52 to $t0 from $fp-24
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -28($fp)	# spill _tmp53 from $t2 to $fp-28
	# ACall _tmp53
	  lw $t0, -28($fp)	# fill _tmp53 to $t0 from $fp-28
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp54 = 3
	  li $t2, 3		# load constant value 3 into $t2
	  sw $t2, -32($fp)	# spill _tmp54 from $t2 to $fp-32
	# PushParam _tmp54
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp54 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp55 = *(s)
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -36($fp)	# spill _tmp55 from $t2 to $fp-36
	# _tmp56 = *(_tmp55 + 4)
	  lw $t0, -36($fp)	# fill _tmp55 to $t0 from $fp-36
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -40($fp)	# spill _tmp56 from $t2 to $fp-40
	# ACall _tmp56
	  lw $t0, -40($fp)	# fill _tmp56 to $t0 from $fp-40
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp57 = 7
	  li $t2, 7		# load constant value 7 into $t2
	  sw $t2, -44($fp)	# spill _tmp57 from $t2 to $fp-44
	# PushParam _tmp57
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -44($fp)	# fill _tmp57 to $t0 from $fp-44
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp58 = *(s)
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -48($fp)	# spill _tmp58 from $t2 to $fp-48
	# _tmp59 = *(_tmp58 + 4)
	  lw $t0, -48($fp)	# fill _tmp58 to $t0 from $fp-48
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -52($fp)	# spill _tmp59 from $t2 to $fp-52
	# ACall _tmp59
	  lw $t0, -52($fp)	# fill _tmp59 to $t0 from $fp-52
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp60 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -56($fp)	# spill _tmp60 from $t2 to $fp-56
	# PushParam _tmp60
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -56($fp)	# fill _tmp60 to $t0 from $fp-56
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp61 = *(s)
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -60($fp)	# spill _tmp61 from $t2 to $fp-60
	# _tmp62 = *(_tmp61 + 4)
	  lw $t0, -60($fp)	# fill _tmp61 to $t0 from $fp-60
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -64($fp)	# spill _tmp62 from $t2 to $fp-64
	# ACall _tmp62
	  lw $t0, -64($fp)	# fill _tmp62 to $t0 from $fp-64
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp63 = *(s)
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -68($fp)	# spill _tmp63 from $t2 to $fp-68
	# _tmp64 = *(_tmp63 + 12)
	  lw $t0, -68($fp)	# fill _tmp63 to $t0 from $fp-68
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -72($fp)	# spill _tmp64 from $t2 to $fp-72
	# _tmp65 = ACall _tmp64
	  lw $t0, -72($fp)	# fill _tmp64 to $t0 from $fp-72
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -76($fp)	# spill _tmp65 from $t2 to $fp-76
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp65
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -76($fp)	# fill _tmp65 to $t0 from $fp-76
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp66 = " "
	  .data			# create string constant marked with label
	  _string4: .asciiz " "
	  .text
	  la $t2, _string4	# load label
	  sw $t2, -80($fp)	# spill _tmp66 from $t2 to $fp-80
	# PushParam _tmp66
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -80($fp)	# fill _tmp66 to $t0 from $fp-80
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp67 = *(s)
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -84($fp)	# spill _tmp67 from $t2 to $fp-84
	# _tmp68 = *(_tmp67 + 8)
	  lw $t0, -84($fp)	# fill _tmp67 to $t0 from $fp-84
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -88($fp)	# spill _tmp68 from $t2 to $fp-88
	# _tmp69 = ACall _tmp68
	  lw $t0, -88($fp)	# fill _tmp68 to $t0 from $fp-88
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -92($fp)	# spill _tmp69 from $t2 to $fp-92
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp69
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -92($fp)	# fill _tmp69 to $t0 from $fp-92
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp70 = " "
	  .data			# create string constant marked with label
	  _string5: .asciiz " "
	  .text
	  la $t2, _string5	# load label
	  sw $t2, -96($fp)	# spill _tmp70 from $t2 to $fp-96
	# PushParam _tmp70
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -96($fp)	# fill _tmp70 to $t0 from $fp-96
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp71 = *(s)
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -100($fp)	# spill _tmp71 from $t2 to $fp-100
	# _tmp72 = *(_tmp71 + 8)
	  lw $t0, -100($fp)	# fill _tmp71 to $t0 from $fp-100
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -104($fp)	# spill _tmp72 from $t2 to $fp-104
	# _tmp73 = ACall _tmp72
	  lw $t0, -104($fp)	# fill _tmp72 to $t0 from $fp-104
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -108($fp)	# spill _tmp73 from $t2 to $fp-108
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp73
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -108($fp)	# fill _tmp73 to $t0 from $fp-108
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp74 = " "
	  .data			# create string constant marked with label
	  _string6: .asciiz " "
	  .text
	  la $t2, _string6	# load label
	  sw $t2, -112($fp)	# spill _tmp74 from $t2 to $fp-112
	# PushParam _tmp74
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -112($fp)	# fill _tmp74 to $t0 from $fp-112
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp75 = *(s)
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -116($fp)	# spill _tmp75 from $t2 to $fp-116
	# _tmp76 = *(_tmp75 + 8)
	  lw $t0, -116($fp)	# fill _tmp75 to $t0 from $fp-116
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -120($fp)	# spill _tmp76 from $t2 to $fp-120
	# _tmp77 = ACall _tmp76
	  lw $t0, -120($fp)	# fill _tmp76 to $t0 from $fp-120
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -124($fp)	# spill _tmp77 from $t2 to $fp-124
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp77
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -124($fp)	# fill _tmp77 to $t0 from $fp-124
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp78 = " "
	  .data			# create string constant marked with label
	  _string7: .asciiz " "
	  .text
	  la $t2, _string7	# load label
	  sw $t2, -128($fp)	# spill _tmp78 from $t2 to $fp-128
	# PushParam _tmp78
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -128($fp)	# fill _tmp78 to $t0 from $fp-128
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp79 = *(s)
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -132($fp)	# spill _tmp79 from $t2 to $fp-132
	# _tmp80 = *(_tmp79 + 12)
	  lw $t0, -132($fp)	# fill _tmp79 to $t0 from $fp-132
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -136($fp)	# spill _tmp80 from $t2 to $fp-136
	# _tmp81 = ACall _tmp80
	  lw $t0, -136($fp)	# fill _tmp80 to $t0 from $fp-136
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -140($fp)	# spill _tmp81 from $t2 to $fp-140
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp81
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -140($fp)	# fill _tmp81 to $t0 from $fp-140
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
