	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
	# VTable for class Random
	  .data
	  .align 2
	  Random:		# label for class Random vtable
	  .word _Random.Init
	  .word _Random.GenRandom
	  .word _Random.RndInt
	  .text
  _Random.Init:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 4) = seedVal
	  lw $t0, 8($fp)	# fill seedVal to $t0 from $fp+8
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 4($t2) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Random.GenRandom:
	# BeginFunc 40
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 40	# decrement sp to make space for locals/temps
	# _tmp0 = 15625
	  li $t2, 15625		# load constant value 15625 into $t2
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# _tmp1 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# _tmp2 = 10000
	  li $t2, 10000		# load constant value 10000 into $t2
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# _tmp3 = _tmp1 % _tmp2
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  lw $t1, -16($fp)	# fill _tmp2 to $t1 from $fp-16
	  rem $t2, $t0, $t1	
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# _tmp4 = _tmp0 * _tmp3
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  lw $t1, -20($fp)	# fill _tmp3 to $t1 from $fp-20
	  mul $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# _tmp5 = 22221
	  li $t2, 22221		# load constant value 22221 into $t2
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = _tmp4 + _tmp5
	  lw $t0, -24($fp)	# fill _tmp4 to $t0 from $fp-24
	  lw $t1, -28($fp)	# fill _tmp5 to $t1 from $fp-28
	  add $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# _tmp7 = 65536
	  li $t2, 65536		# load constant value 65536 into $t2
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# _tmp8 = _tmp6 % _tmp7
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  lw $t1, -36($fp)	# fill _tmp7 to $t1 from $fp-36
	  rem $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# *(this + 4) = _tmp8
	  lw $t0, -40($fp)	# fill _tmp8 to $t0 from $fp-40
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 4($t2) 	# store with offset
	# _tmp9 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -44($fp)	# spill _tmp9 from $t2 to $fp-44
	# Return _tmp9
	  lw $t2, -44($fp)	# fill _tmp9 to $t2 from $fp-44
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
  _Random.RndInt:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp10 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -8($fp)	# spill _tmp10 from $t2 to $fp-8
	# _tmp11 = *(_tmp10 + 4)
	  lw $t0, -8($fp)	# fill _tmp10 to $t0 from $fp-8
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp11 from $t2 to $fp-12
	# _tmp12 = ACall _tmp11
	  lw $t0, -12($fp)	# fill _tmp11 to $t0 from $fp-12
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -16($fp)	# spill _tmp12 from $t2 to $fp-16
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp13 = _tmp12 % max
	  lw $t0, -16($fp)	# fill _tmp12 to $t0 from $fp-16
	  lw $t1, 8($fp)	# fill max to $t1 from $fp+8
	  rem $t2, $t0, $t1	
	  sw $t2, -20($fp)	# spill _tmp13 from $t2 to $fp-20
	# Return _tmp13
	  lw $t2, -20($fp)	# fill _tmp13 to $t2 from $fp-20
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
	# VTable for class Deck
	  .data
	  .align 2
	  Deck:		# label for class Deck vtable
	  .word _Deck.Init
	  .word _Deck.Shuffle
	  .word _Deck.GetCard
	  .text
  _Deck.Init:
	# BeginFunc 40
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 40	# decrement sp to make space for locals/temps
	# _tmp14 = 52
	  li $t2, 52		# load constant value 52 into $t2
	  sw $t2, -8($fp)	# spill _tmp14 from $t2 to $fp-8
	# _tmp15 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -12($fp)	# spill _tmp15 from $t2 to $fp-12
	# _tmp16 = _tmp14 < _tmp15
	  lw $t0, -8($fp)	# fill _tmp14 to $t0 from $fp-8
	  lw $t1, -12($fp)	# fill _tmp15 to $t1 from $fp-12
	  slt $t2, $t0, $t1	
	  sw $t2, -16($fp)	# spill _tmp16 from $t2 to $fp-16
	# IfZ _tmp16 Goto _L0
	  lw $t0, -16($fp)	# fill _tmp16 to $t0 from $fp-16
	  beqz $t0, _L0	# branch if _tmp16 is zero 
	# _tmp17 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t2, _string1	# load label
	  sw $t2, -20($fp)	# spill _tmp17 from $t2 to $fp-20
	# PushParam _tmp17
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -20($fp)	# fill _tmp17 to $t0 from $fp-20
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L0:
	# _tmp18 = _tmp14 == _tmp15
	  lw $t0, -8($fp)	# fill _tmp14 to $t0 from $fp-8
	  lw $t1, -12($fp)	# fill _tmp15 to $t1 from $fp-12
	  seq $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp18 from $t2 to $fp-24
	# IfZ _tmp18 Goto _L1
	  lw $t0, -24($fp)	# fill _tmp18 to $t0 from $fp-24
	  beqz $t0, _L1	# branch if _tmp18 is zero 
	# PushParam _tmp17
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -20($fp)	# fill _tmp17 to $t0 from $fp-20
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L1:
	# _tmp19 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -28($fp)	# spill _tmp19 from $t2 to $fp-28
	# _tmp20 = _tmp14 + _tmp19
	  lw $t0, -8($fp)	# fill _tmp14 to $t0 from $fp-8
	  lw $t1, -28($fp)	# fill _tmp19 to $t1 from $fp-28
	  add $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp20 from $t2 to $fp-32
	# _tmp21 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -36($fp)	# spill _tmp21 from $t2 to $fp-36
	# _tmp22 = _tmp20 * _tmp21
	  lw $t0, -32($fp)	# fill _tmp20 to $t0 from $fp-32
	  lw $t1, -36($fp)	# fill _tmp21 to $t1 from $fp-36
	  mul $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp22 from $t2 to $fp-40
	# PushParam _tmp22
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -40($fp)	# fill _tmp22 to $t0 from $fp-40
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp23 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -44($fp)	# spill _tmp23 from $t2 to $fp-44
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp23) = _tmp14
	  lw $t0, -8($fp)	# fill _tmp14 to $t0 from $fp-8
	  lw $t2, -44($fp)	# fill _tmp23 to $t2 from $fp-44
	  sw $t0, 0($t2) 	# store with offset
	# *(this + 8) = _tmp23
	  lw $t0, -44($fp)	# fill _tmp23 to $t0 from $fp-44
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 8($t2) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Deck.Shuffle:
	# BeginFunc 344
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 344	# decrement sp to make space for locals/temps
	# _tmp24 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -8($fp)	# spill _tmp24 from $t2 to $fp-8
	# *(this + 4) = _tmp24
	  lw $t0, -8($fp)	# fill _tmp24 to $t0 from $fp-8
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 4($t2) 	# store with offset
  _L2:
	# _tmp25 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp25 from $t2 to $fp-12
	# _tmp26 = 52
	  li $t2, 52		# load constant value 52 into $t2
	  sw $t2, -16($fp)	# spill _tmp26 from $t2 to $fp-16
	# _tmp27 = _tmp25 < _tmp26
	  lw $t0, -12($fp)	# fill _tmp25 to $t0 from $fp-12
	  lw $t1, -16($fp)	# fill _tmp26 to $t1 from $fp-16
	  slt $t2, $t0, $t1	
	  sw $t2, -20($fp)	# spill _tmp27 from $t2 to $fp-20
	# IfZ _tmp27 Goto _L3
	  lw $t0, -20($fp)	# fill _tmp27 to $t0 from $fp-20
	  beqz $t0, _L3	# branch if _tmp27 is zero 
	# _tmp28 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -24($fp)	# spill _tmp28 from $t2 to $fp-24
	# _tmp29 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -28($fp)	# spill _tmp29 from $t2 to $fp-28
	# _tmp30 = _tmp28 + _tmp29
	  lw $t0, -24($fp)	# fill _tmp28 to $t0 from $fp-24
	  lw $t1, -28($fp)	# fill _tmp29 to $t1 from $fp-28
	  add $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp30 from $t2 to $fp-32
	# _tmp31 = 13
	  li $t2, 13		# load constant value 13 into $t2
	  sw $t2, -36($fp)	# spill _tmp31 from $t2 to $fp-36
	# _tmp32 = _tmp30 % _tmp31
	  lw $t0, -32($fp)	# fill _tmp30 to $t0 from $fp-32
	  lw $t1, -36($fp)	# fill _tmp31 to $t1 from $fp-36
	  rem $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp32 from $t2 to $fp-40
	# _tmp33 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -44($fp)	# spill _tmp33 from $t2 to $fp-44
	# _tmp34 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -48($fp)	# spill _tmp34 from $t2 to $fp-48
	# _tmp35 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string2	# load label
	  sw $t2, -52($fp)	# spill _tmp35 from $t2 to $fp-52
	# _tmp36 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -56($fp)	# spill _tmp36 from $t2 to $fp-56
	# _tmp37 = _tmp34 < _tmp36
	  lw $t0, -48($fp)	# fill _tmp34 to $t0 from $fp-48
	  lw $t1, -56($fp)	# fill _tmp36 to $t1 from $fp-56
	  slt $t2, $t0, $t1	
	  sw $t2, -60($fp)	# spill _tmp37 from $t2 to $fp-60
	# IfZ _tmp37 Goto _L4
	  lw $t0, -60($fp)	# fill _tmp37 to $t0 from $fp-60
	  beqz $t0, _L4	# branch if _tmp37 is zero 
	# PushParam _tmp35
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -52($fp)	# fill _tmp35 to $t0 from $fp-52
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L4:
	# _tmp38 = *(_tmp33)
	  lw $t0, -44($fp)	# fill _tmp33 to $t0 from $fp-44
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -64($fp)	# spill _tmp38 from $t2 to $fp-64
	# _tmp39 = _tmp34 < _tmp38
	  lw $t0, -48($fp)	# fill _tmp34 to $t0 from $fp-48
	  lw $t1, -64($fp)	# fill _tmp38 to $t1 from $fp-64
	  slt $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp39 from $t2 to $fp-68
	# IfZ _tmp39 Goto _L6
	  lw $t0, -68($fp)	# fill _tmp39 to $t0 from $fp-68
	  beqz $t0, _L6	# branch if _tmp39 is zero 
	# Goto _L5
	  b _L5		# unconditional branch
  _L6:
	# PushParam _tmp35
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -52($fp)	# fill _tmp35 to $t0 from $fp-52
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L5:
	# _tmp40 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -72($fp)	# spill _tmp40 from $t2 to $fp-72
	# _tmp41 = _tmp34 + _tmp40
	  lw $t0, -48($fp)	# fill _tmp34 to $t0 from $fp-48
	  lw $t1, -72($fp)	# fill _tmp40 to $t1 from $fp-72
	  add $t2, $t0, $t1	
	  sw $t2, -76($fp)	# spill _tmp41 from $t2 to $fp-76
	# _tmp42 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -80($fp)	# spill _tmp42 from $t2 to $fp-80
	# _tmp43 = _tmp41 * _tmp42
	  lw $t0, -76($fp)	# fill _tmp41 to $t0 from $fp-76
	  lw $t1, -80($fp)	# fill _tmp42 to $t1 from $fp-80
	  mul $t2, $t0, $t1	
	  sw $t2, -84($fp)	# spill _tmp43 from $t2 to $fp-84
	# _tmp44 = _tmp33 + _tmp43
	  lw $t0, -44($fp)	# fill _tmp33 to $t0 from $fp-44
	  lw $t1, -84($fp)	# fill _tmp43 to $t1 from $fp-84
	  add $t2, $t0, $t1	
	  sw $t2, -88($fp)	# spill _tmp44 from $t2 to $fp-88
	# *(_tmp44) = _tmp32
	  lw $t0, -40($fp)	# fill _tmp32 to $t0 from $fp-40
	  lw $t2, -88($fp)	# fill _tmp44 to $t2 from $fp-88
	  sw $t0, 0($t2) 	# store with offset
	# _tmp45 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -92($fp)	# spill _tmp45 from $t2 to $fp-92
	# _tmp46 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -96($fp)	# spill _tmp46 from $t2 to $fp-96
	# _tmp47 = _tmp45 + _tmp46
	  lw $t0, -92($fp)	# fill _tmp45 to $t0 from $fp-92
	  lw $t1, -96($fp)	# fill _tmp46 to $t1 from $fp-96
	  add $t2, $t0, $t1	
	  sw $t2, -100($fp)	# spill _tmp47 from $t2 to $fp-100
	# *(this + 4) = _tmp47
	  lw $t0, -100($fp)	# fill _tmp47 to $t0 from $fp-100
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 4($t2) 	# store with offset
	# Goto _L2
	  b _L2		# unconditional branch
  _L3:
  _L7:
	# _tmp48 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -104($fp)	# spill _tmp48 from $t2 to $fp-104
	# _tmp49 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -108($fp)	# spill _tmp49 from $t2 to $fp-108
	# _tmp50 = _tmp49 < _tmp48
	  lw $t0, -108($fp)	# fill _tmp49 to $t0 from $fp-108
	  lw $t1, -104($fp)	# fill _tmp48 to $t1 from $fp-104
	  slt $t2, $t0, $t1	
	  sw $t2, -112($fp)	# spill _tmp50 from $t2 to $fp-112
	# IfZ _tmp50 Goto _L8
	  lw $t0, -112($fp)	# fill _tmp50 to $t0 from $fp-112
	  beqz $t0, _L8	# branch if _tmp50 is zero 
	# _tmp51 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -124($fp)	# spill _tmp51 from $t2 to $fp-124
	# PushParam _tmp51
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -124($fp)	# fill _tmp51 to $t0 from $fp-124
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam gRnd
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 0($gp)	# fill gRnd to $t0 from $gp+0
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp52 = *(gRnd)
	  lw $t0, 0($gp)	# fill gRnd to $t0 from $gp+0
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -128($fp)	# spill _tmp52 from $t2 to $fp-128
	# _tmp53 = *(_tmp52 + 8)
	  lw $t0, -128($fp)	# fill _tmp52 to $t0 from $fp-128
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -132($fp)	# spill _tmp53 from $t2 to $fp-132
	# _tmp54 = ACall _tmp53
	  lw $t0, -132($fp)	# fill _tmp53 to $t0 from $fp-132
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -136($fp)	# spill _tmp54 from $t2 to $fp-136
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# r = _tmp54
	  lw $t2, -136($fp)	# fill _tmp54 to $t2 from $fp-136
	  sw $t2, -116($fp)	# spill r from $t2 to $fp-116
	# _tmp55 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -140($fp)	# spill _tmp55 from $t2 to $fp-140
	# _tmp56 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -144($fp)	# spill _tmp56 from $t2 to $fp-144
	# _tmp57 = _tmp55 - _tmp56
	  lw $t0, -140($fp)	# fill _tmp55 to $t0 from $fp-140
	  lw $t1, -144($fp)	# fill _tmp56 to $t1 from $fp-144
	  sub $t2, $t0, $t1	
	  sw $t2, -148($fp)	# spill _tmp57 from $t2 to $fp-148
	# *(this + 4) = _tmp57
	  lw $t0, -148($fp)	# fill _tmp57 to $t0 from $fp-148
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 4($t2) 	# store with offset
	# _tmp58 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -152($fp)	# spill _tmp58 from $t2 to $fp-152
	# _tmp59 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -156($fp)	# spill _tmp59 from $t2 to $fp-156
	# _tmp60 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string3	# load label
	  sw $t2, -160($fp)	# spill _tmp60 from $t2 to $fp-160
	# _tmp61 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -164($fp)	# spill _tmp61 from $t2 to $fp-164
	# _tmp62 = _tmp58 == _tmp61
	  lw $t0, -152($fp)	# fill _tmp58 to $t0 from $fp-152
	  lw $t1, -164($fp)	# fill _tmp61 to $t1 from $fp-164
	  seq $t2, $t0, $t1	
	  sw $t2, -168($fp)	# spill _tmp62 from $t2 to $fp-168
	# IfZ _tmp62 Goto _L9
	  lw $t0, -168($fp)	# fill _tmp62 to $t0 from $fp-168
	  beqz $t0, _L9	# branch if _tmp62 is zero 
	# PushParam _tmp60
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -160($fp)	# fill _tmp60 to $t0 from $fp-160
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L9:
	# _tmp63 = _tmp59 < _tmp61
	  lw $t0, -156($fp)	# fill _tmp59 to $t0 from $fp-156
	  lw $t1, -164($fp)	# fill _tmp61 to $t1 from $fp-164
	  slt $t2, $t0, $t1	
	  sw $t2, -172($fp)	# spill _tmp63 from $t2 to $fp-172
	# IfZ _tmp63 Goto _L10
	  lw $t0, -172($fp)	# fill _tmp63 to $t0 from $fp-172
	  beqz $t0, _L10	# branch if _tmp63 is zero 
	# PushParam _tmp60
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -160($fp)	# fill _tmp60 to $t0 from $fp-160
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L10:
	# _tmp64 = *(_tmp58)
	  lw $t0, -152($fp)	# fill _tmp58 to $t0 from $fp-152
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -176($fp)	# spill _tmp64 from $t2 to $fp-176
	# _tmp65 = _tmp59 < _tmp64
	  lw $t0, -156($fp)	# fill _tmp59 to $t0 from $fp-156
	  lw $t1, -176($fp)	# fill _tmp64 to $t1 from $fp-176
	  slt $t2, $t0, $t1	
	  sw $t2, -180($fp)	# spill _tmp65 from $t2 to $fp-180
	# IfZ _tmp65 Goto _L12
	  lw $t0, -180($fp)	# fill _tmp65 to $t0 from $fp-180
	  beqz $t0, _L12	# branch if _tmp65 is zero 
	# Goto _L11
	  b _L11		# unconditional branch
  _L12:
	# PushParam _tmp60
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -160($fp)	# fill _tmp60 to $t0 from $fp-160
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L11:
	# _tmp66 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -184($fp)	# spill _tmp66 from $t2 to $fp-184
	# _tmp67 = _tmp59 + _tmp66
	  lw $t0, -156($fp)	# fill _tmp59 to $t0 from $fp-156
	  lw $t1, -184($fp)	# fill _tmp66 to $t1 from $fp-184
	  add $t2, $t0, $t1	
	  sw $t2, -188($fp)	# spill _tmp67 from $t2 to $fp-188
	# _tmp68 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -192($fp)	# spill _tmp68 from $t2 to $fp-192
	# _tmp69 = _tmp67 * _tmp68
	  lw $t0, -188($fp)	# fill _tmp67 to $t0 from $fp-188
	  lw $t1, -192($fp)	# fill _tmp68 to $t1 from $fp-192
	  mul $t2, $t0, $t1	
	  sw $t2, -196($fp)	# spill _tmp69 from $t2 to $fp-196
	# _tmp70 = _tmp58 + _tmp69
	  lw $t0, -152($fp)	# fill _tmp58 to $t0 from $fp-152
	  lw $t1, -196($fp)	# fill _tmp69 to $t1 from $fp-196
	  add $t2, $t0, $t1	
	  sw $t2, -200($fp)	# spill _tmp70 from $t2 to $fp-200
	# _tmp71 = *(_tmp70)
	  lw $t0, -200($fp)	# fill _tmp70 to $t0 from $fp-200
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -204($fp)	# spill _tmp71 from $t2 to $fp-204
	# temp = _tmp71
	  lw $t2, -204($fp)	# fill _tmp71 to $t2 from $fp-204
	  sw $t2, -120($fp)	# spill temp from $t2 to $fp-120
	# _tmp72 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -208($fp)	# spill _tmp72 from $t2 to $fp-208
	# _tmp73 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string4: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string4	# load label
	  sw $t2, -212($fp)	# spill _tmp73 from $t2 to $fp-212
	# _tmp74 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -216($fp)	# spill _tmp74 from $t2 to $fp-216
	# _tmp75 = _tmp72 == _tmp74
	  lw $t0, -208($fp)	# fill _tmp72 to $t0 from $fp-208
	  lw $t1, -216($fp)	# fill _tmp74 to $t1 from $fp-216
	  seq $t2, $t0, $t1	
	  sw $t2, -220($fp)	# spill _tmp75 from $t2 to $fp-220
	# IfZ _tmp75 Goto _L13
	  lw $t0, -220($fp)	# fill _tmp75 to $t0 from $fp-220
	  beqz $t0, _L13	# branch if _tmp75 is zero 
	# PushParam _tmp73
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -212($fp)	# fill _tmp73 to $t0 from $fp-212
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L13:
	# _tmp76 = r < _tmp74
	  lw $t0, -116($fp)	# fill r to $t0 from $fp-116
	  lw $t1, -216($fp)	# fill _tmp74 to $t1 from $fp-216
	  slt $t2, $t0, $t1	
	  sw $t2, -224($fp)	# spill _tmp76 from $t2 to $fp-224
	# IfZ _tmp76 Goto _L14
	  lw $t0, -224($fp)	# fill _tmp76 to $t0 from $fp-224
	  beqz $t0, _L14	# branch if _tmp76 is zero 
	# PushParam _tmp73
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -212($fp)	# fill _tmp73 to $t0 from $fp-212
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L14:
	# _tmp77 = *(_tmp72)
	  lw $t0, -208($fp)	# fill _tmp72 to $t0 from $fp-208
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -228($fp)	# spill _tmp77 from $t2 to $fp-228
	# _tmp78 = r < _tmp77
	  lw $t0, -116($fp)	# fill r to $t0 from $fp-116
	  lw $t1, -228($fp)	# fill _tmp77 to $t1 from $fp-228
	  slt $t2, $t0, $t1	
	  sw $t2, -232($fp)	# spill _tmp78 from $t2 to $fp-232
	# IfZ _tmp78 Goto _L16
	  lw $t0, -232($fp)	# fill _tmp78 to $t0 from $fp-232
	  beqz $t0, _L16	# branch if _tmp78 is zero 
	# Goto _L15
	  b _L15		# unconditional branch
  _L16:
	# PushParam _tmp73
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -212($fp)	# fill _tmp73 to $t0 from $fp-212
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L15:
	# _tmp79 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -236($fp)	# spill _tmp79 from $t2 to $fp-236
	# _tmp80 = r + _tmp79
	  lw $t0, -116($fp)	# fill r to $t0 from $fp-116
	  lw $t1, -236($fp)	# fill _tmp79 to $t1 from $fp-236
	  add $t2, $t0, $t1	
	  sw $t2, -240($fp)	# spill _tmp80 from $t2 to $fp-240
	# _tmp81 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -244($fp)	# spill _tmp81 from $t2 to $fp-244
	# _tmp82 = _tmp80 * _tmp81
	  lw $t0, -240($fp)	# fill _tmp80 to $t0 from $fp-240
	  lw $t1, -244($fp)	# fill _tmp81 to $t1 from $fp-244
	  mul $t2, $t0, $t1	
	  sw $t2, -248($fp)	# spill _tmp82 from $t2 to $fp-248
	# _tmp83 = _tmp72 + _tmp82
	  lw $t0, -208($fp)	# fill _tmp72 to $t0 from $fp-208
	  lw $t1, -248($fp)	# fill _tmp82 to $t1 from $fp-248
	  add $t2, $t0, $t1	
	  sw $t2, -252($fp)	# spill _tmp83 from $t2 to $fp-252
	# _tmp84 = *(_tmp83)
	  lw $t0, -252($fp)	# fill _tmp83 to $t0 from $fp-252
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -256($fp)	# spill _tmp84 from $t2 to $fp-256
	# _tmp85 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -260($fp)	# spill _tmp85 from $t2 to $fp-260
	# _tmp86 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -264($fp)	# spill _tmp86 from $t2 to $fp-264
	# _tmp87 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string5: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string5	# load label
	  sw $t2, -268($fp)	# spill _tmp87 from $t2 to $fp-268
	# _tmp88 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -272($fp)	# spill _tmp88 from $t2 to $fp-272
	# _tmp89 = _tmp86 < _tmp88
	  lw $t0, -264($fp)	# fill _tmp86 to $t0 from $fp-264
	  lw $t1, -272($fp)	# fill _tmp88 to $t1 from $fp-272
	  slt $t2, $t0, $t1	
	  sw $t2, -276($fp)	# spill _tmp89 from $t2 to $fp-276
	# IfZ _tmp89 Goto _L17
	  lw $t0, -276($fp)	# fill _tmp89 to $t0 from $fp-276
	  beqz $t0, _L17	# branch if _tmp89 is zero 
	# PushParam _tmp87
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -268($fp)	# fill _tmp87 to $t0 from $fp-268
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L17:
	# _tmp90 = *(_tmp85)
	  lw $t0, -260($fp)	# fill _tmp85 to $t0 from $fp-260
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -280($fp)	# spill _tmp90 from $t2 to $fp-280
	# _tmp91 = _tmp86 < _tmp90
	  lw $t0, -264($fp)	# fill _tmp86 to $t0 from $fp-264
	  lw $t1, -280($fp)	# fill _tmp90 to $t1 from $fp-280
	  slt $t2, $t0, $t1	
	  sw $t2, -284($fp)	# spill _tmp91 from $t2 to $fp-284
	# IfZ _tmp91 Goto _L19
	  lw $t0, -284($fp)	# fill _tmp91 to $t0 from $fp-284
	  beqz $t0, _L19	# branch if _tmp91 is zero 
	# Goto _L18
	  b _L18		# unconditional branch
  _L19:
	# PushParam _tmp87
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -268($fp)	# fill _tmp87 to $t0 from $fp-268
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L18:
	# _tmp92 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -288($fp)	# spill _tmp92 from $t2 to $fp-288
	# _tmp93 = _tmp86 + _tmp92
	  lw $t0, -264($fp)	# fill _tmp86 to $t0 from $fp-264
	  lw $t1, -288($fp)	# fill _tmp92 to $t1 from $fp-288
	  add $t2, $t0, $t1	
	  sw $t2, -292($fp)	# spill _tmp93 from $t2 to $fp-292
	# _tmp94 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -296($fp)	# spill _tmp94 from $t2 to $fp-296
	# _tmp95 = _tmp93 * _tmp94
	  lw $t0, -292($fp)	# fill _tmp93 to $t0 from $fp-292
	  lw $t1, -296($fp)	# fill _tmp94 to $t1 from $fp-296
	  mul $t2, $t0, $t1	
	  sw $t2, -300($fp)	# spill _tmp95 from $t2 to $fp-300
	# _tmp96 = _tmp85 + _tmp95
	  lw $t0, -260($fp)	# fill _tmp85 to $t0 from $fp-260
	  lw $t1, -300($fp)	# fill _tmp95 to $t1 from $fp-300
	  add $t2, $t0, $t1	
	  sw $t2, -304($fp)	# spill _tmp96 from $t2 to $fp-304
	# *(_tmp96) = _tmp84
	  lw $t0, -256($fp)	# fill _tmp84 to $t0 from $fp-256
	  lw $t2, -304($fp)	# fill _tmp96 to $t2 from $fp-304
	  sw $t0, 0($t2) 	# store with offset
	# _tmp97 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -308($fp)	# spill _tmp97 from $t2 to $fp-308
	# _tmp98 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string6	# load label
	  sw $t2, -312($fp)	# spill _tmp98 from $t2 to $fp-312
	# _tmp99 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -316($fp)	# spill _tmp99 from $t2 to $fp-316
	# _tmp100 = r < _tmp99
	  lw $t0, -116($fp)	# fill r to $t0 from $fp-116
	  lw $t1, -316($fp)	# fill _tmp99 to $t1 from $fp-316
	  slt $t2, $t0, $t1	
	  sw $t2, -320($fp)	# spill _tmp100 from $t2 to $fp-320
	# IfZ _tmp100 Goto _L20
	  lw $t0, -320($fp)	# fill _tmp100 to $t0 from $fp-320
	  beqz $t0, _L20	# branch if _tmp100 is zero 
	# PushParam _tmp98
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -312($fp)	# fill _tmp98 to $t0 from $fp-312
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L20:
	# _tmp101 = *(_tmp97)
	  lw $t0, -308($fp)	# fill _tmp97 to $t0 from $fp-308
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -324($fp)	# spill _tmp101 from $t2 to $fp-324
	# _tmp102 = r < _tmp101
	  lw $t0, -116($fp)	# fill r to $t0 from $fp-116
	  lw $t1, -324($fp)	# fill _tmp101 to $t1 from $fp-324
	  slt $t2, $t0, $t1	
	  sw $t2, -328($fp)	# spill _tmp102 from $t2 to $fp-328
	# IfZ _tmp102 Goto _L22
	  lw $t0, -328($fp)	# fill _tmp102 to $t0 from $fp-328
	  beqz $t0, _L22	# branch if _tmp102 is zero 
	# Goto _L21
	  b _L21		# unconditional branch
  _L22:
	# PushParam _tmp98
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -312($fp)	# fill _tmp98 to $t0 from $fp-312
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L21:
	# _tmp103 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -332($fp)	# spill _tmp103 from $t2 to $fp-332
	# _tmp104 = r + _tmp103
	  lw $t0, -116($fp)	# fill r to $t0 from $fp-116
	  lw $t1, -332($fp)	# fill _tmp103 to $t1 from $fp-332
	  add $t2, $t0, $t1	
	  sw $t2, -336($fp)	# spill _tmp104 from $t2 to $fp-336
	# _tmp105 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -340($fp)	# spill _tmp105 from $t2 to $fp-340
	# _tmp106 = _tmp104 * _tmp105
	  lw $t0, -336($fp)	# fill _tmp104 to $t0 from $fp-336
	  lw $t1, -340($fp)	# fill _tmp105 to $t1 from $fp-340
	  mul $t2, $t0, $t1	
	  sw $t2, -344($fp)	# spill _tmp106 from $t2 to $fp-344
	# _tmp107 = _tmp97 + _tmp106
	  lw $t0, -308($fp)	# fill _tmp97 to $t0 from $fp-308
	  lw $t1, -344($fp)	# fill _tmp106 to $t1 from $fp-344
	  add $t2, $t0, $t1	
	  sw $t2, -348($fp)	# spill _tmp107 from $t2 to $fp-348
	# *(_tmp107) = temp
	  lw $t0, -120($fp)	# fill temp to $t0 from $fp-120
	  lw $t2, -348($fp)	# fill _tmp107 to $t2 from $fp-348
	  sw $t0, 0($t2) 	# store with offset
	# Goto _L7
	  b _L7		# unconditional branch
  _L8:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Deck.GetCard:
	# BeginFunc 96
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 96	# decrement sp to make space for locals/temps
	# _tmp108 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp108 from $t2 to $fp-12
	# _tmp109 = 52
	  li $t2, 52		# load constant value 52 into $t2
	  sw $t2, -16($fp)	# spill _tmp109 from $t2 to $fp-16
	# _tmp110 = _tmp108 < _tmp109
	  lw $t0, -12($fp)	# fill _tmp108 to $t0 from $fp-12
	  lw $t1, -16($fp)	# fill _tmp109 to $t1 from $fp-16
	  slt $t2, $t0, $t1	
	  sw $t2, -20($fp)	# spill _tmp110 from $t2 to $fp-20
	# _tmp111 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -24($fp)	# spill _tmp111 from $t2 to $fp-24
	# _tmp112 = _tmp111 - _tmp110
	  lw $t0, -24($fp)	# fill _tmp111 to $t0 from $fp-24
	  lw $t1, -20($fp)	# fill _tmp110 to $t1 from $fp-20
	  sub $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp112 from $t2 to $fp-28
	# IfZ _tmp112 Goto _L23
	  lw $t0, -28($fp)	# fill _tmp112 to $t0 from $fp-28
	  beqz $t0, _L23	# branch if _tmp112 is zero 
	# _tmp113 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -32($fp)	# spill _tmp113 from $t2 to $fp-32
	# Return _tmp113
	  lw $t2, -32($fp)	# fill _tmp113 to $t2 from $fp-32
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto _L24
	  b _L24		# unconditional branch
  _L23:
  _L24:
	# _tmp114 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -36($fp)	# spill _tmp114 from $t2 to $fp-36
	# _tmp115 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -40($fp)	# spill _tmp115 from $t2 to $fp-40
	# _tmp116 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string7	# load label
	  sw $t2, -44($fp)	# spill _tmp116 from $t2 to $fp-44
	# _tmp117 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -48($fp)	# spill _tmp117 from $t2 to $fp-48
	# _tmp118 = _tmp114 == _tmp117
	  lw $t0, -36($fp)	# fill _tmp114 to $t0 from $fp-36
	  lw $t1, -48($fp)	# fill _tmp117 to $t1 from $fp-48
	  seq $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp118 from $t2 to $fp-52
	# IfZ _tmp118 Goto _L25
	  lw $t0, -52($fp)	# fill _tmp118 to $t0 from $fp-52
	  beqz $t0, _L25	# branch if _tmp118 is zero 
	# PushParam _tmp116
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -44($fp)	# fill _tmp116 to $t0 from $fp-44
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L25:
	# _tmp119 = _tmp115 < _tmp117
	  lw $t0, -40($fp)	# fill _tmp115 to $t0 from $fp-40
	  lw $t1, -48($fp)	# fill _tmp117 to $t1 from $fp-48
	  slt $t2, $t0, $t1	
	  sw $t2, -56($fp)	# spill _tmp119 from $t2 to $fp-56
	# IfZ _tmp119 Goto _L26
	  lw $t0, -56($fp)	# fill _tmp119 to $t0 from $fp-56
	  beqz $t0, _L26	# branch if _tmp119 is zero 
	# PushParam _tmp116
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -44($fp)	# fill _tmp116 to $t0 from $fp-44
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L26:
	# _tmp120 = *(_tmp114)
	  lw $t0, -36($fp)	# fill _tmp114 to $t0 from $fp-36
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -60($fp)	# spill _tmp120 from $t2 to $fp-60
	# _tmp121 = _tmp115 < _tmp120
	  lw $t0, -40($fp)	# fill _tmp115 to $t0 from $fp-40
	  lw $t1, -60($fp)	# fill _tmp120 to $t1 from $fp-60
	  slt $t2, $t0, $t1	
	  sw $t2, -64($fp)	# spill _tmp121 from $t2 to $fp-64
	# IfZ _tmp121 Goto _L28
	  lw $t0, -64($fp)	# fill _tmp121 to $t0 from $fp-64
	  beqz $t0, _L28	# branch if _tmp121 is zero 
	# Goto _L27
	  b _L27		# unconditional branch
  _L28:
	# PushParam _tmp116
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -44($fp)	# fill _tmp116 to $t0 from $fp-44
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L27:
	# _tmp122 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -68($fp)	# spill _tmp122 from $t2 to $fp-68
	# _tmp123 = _tmp115 + _tmp122
	  lw $t0, -40($fp)	# fill _tmp115 to $t0 from $fp-40
	  lw $t1, -68($fp)	# fill _tmp122 to $t1 from $fp-68
	  add $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp123 from $t2 to $fp-72
	# _tmp124 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -76($fp)	# spill _tmp124 from $t2 to $fp-76
	# _tmp125 = _tmp123 * _tmp124
	  lw $t0, -72($fp)	# fill _tmp123 to $t0 from $fp-72
	  lw $t1, -76($fp)	# fill _tmp124 to $t1 from $fp-76
	  mul $t2, $t0, $t1	
	  sw $t2, -80($fp)	# spill _tmp125 from $t2 to $fp-80
	# _tmp126 = _tmp114 + _tmp125
	  lw $t0, -36($fp)	# fill _tmp114 to $t0 from $fp-36
	  lw $t1, -80($fp)	# fill _tmp125 to $t1 from $fp-80
	  add $t2, $t0, $t1	
	  sw $t2, -84($fp)	# spill _tmp126 from $t2 to $fp-84
	# _tmp127 = *(_tmp126)
	  lw $t0, -84($fp)	# fill _tmp126 to $t0 from $fp-84
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -88($fp)	# spill _tmp127 from $t2 to $fp-88
	# result = _tmp127
	  lw $t2, -88($fp)	# fill _tmp127 to $t2 from $fp-88
	  sw $t2, -8($fp)	# spill result from $t2 to $fp-8
	# _tmp128 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -92($fp)	# spill _tmp128 from $t2 to $fp-92
	# _tmp129 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -96($fp)	# spill _tmp129 from $t2 to $fp-96
	# _tmp130 = _tmp128 + _tmp129
	  lw $t0, -92($fp)	# fill _tmp128 to $t0 from $fp-92
	  lw $t1, -96($fp)	# fill _tmp129 to $t1 from $fp-96
	  add $t2, $t0, $t1	
	  sw $t2, -100($fp)	# spill _tmp130 from $t2 to $fp-100
	# *(this + 4) = _tmp130
	  lw $t0, -100($fp)	# fill _tmp130 to $t0 from $fp-100
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 4($t2) 	# store with offset
	# Return result
	  lw $t2, -8($fp)	# fill result to $t2 from $fp-8
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
	# VTable for class BJDeck
	  .data
	  .align 2
	  BJDeck:		# label for class BJDeck vtable
	  .word _BJDeck.Init
	  .word _BJDeck.DealCard
	  .word _BJDeck.Shuffle
	  .word _BJDeck.NumCardsRemaining
	  .text
  _BJDeck.Init:
	# BeginFunc 180
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 180	# decrement sp to make space for locals/temps
	# _tmp131 = 8
	  li $t2, 8		# load constant value 8 into $t2
	  sw $t2, -12($fp)	# spill _tmp131 from $t2 to $fp-12
	# _tmp132 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -16($fp)	# spill _tmp132 from $t2 to $fp-16
	# _tmp133 = _tmp131 < _tmp132
	  lw $t0, -12($fp)	# fill _tmp131 to $t0 from $fp-12
	  lw $t1, -16($fp)	# fill _tmp132 to $t1 from $fp-16
	  slt $t2, $t0, $t1	
	  sw $t2, -20($fp)	# spill _tmp133 from $t2 to $fp-20
	# IfZ _tmp133 Goto _L29
	  lw $t0, -20($fp)	# fill _tmp133 to $t0 from $fp-20
	  beqz $t0, _L29	# branch if _tmp133 is zero 
	# _tmp134 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t2, _string8	# load label
	  sw $t2, -24($fp)	# spill _tmp134 from $t2 to $fp-24
	# PushParam _tmp134
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp134 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L29:
	# _tmp135 = _tmp131 == _tmp132
	  lw $t0, -12($fp)	# fill _tmp131 to $t0 from $fp-12
	  lw $t1, -16($fp)	# fill _tmp132 to $t1 from $fp-16
	  seq $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp135 from $t2 to $fp-28
	# IfZ _tmp135 Goto _L30
	  lw $t0, -28($fp)	# fill _tmp135 to $t0 from $fp-28
	  beqz $t0, _L30	# branch if _tmp135 is zero 
	# PushParam _tmp134
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp134 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L30:
	# _tmp136 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -32($fp)	# spill _tmp136 from $t2 to $fp-32
	# _tmp137 = _tmp131 + _tmp136
	  lw $t0, -12($fp)	# fill _tmp131 to $t0 from $fp-12
	  lw $t1, -32($fp)	# fill _tmp136 to $t1 from $fp-32
	  add $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp137 from $t2 to $fp-36
	# _tmp138 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -40($fp)	# spill _tmp138 from $t2 to $fp-40
	# _tmp139 = _tmp137 * _tmp138
	  lw $t0, -36($fp)	# fill _tmp137 to $t0 from $fp-36
	  lw $t1, -40($fp)	# fill _tmp138 to $t1 from $fp-40
	  mul $t2, $t0, $t1	
	  sw $t2, -44($fp)	# spill _tmp139 from $t2 to $fp-44
	# PushParam _tmp139
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -44($fp)	# fill _tmp139 to $t0 from $fp-44
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp140 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -48($fp)	# spill _tmp140 from $t2 to $fp-48
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp140) = _tmp131
	  lw $t0, -12($fp)	# fill _tmp131 to $t0 from $fp-12
	  lw $t2, -48($fp)	# fill _tmp140 to $t2 from $fp-48
	  sw $t0, 0($t2) 	# store with offset
	# *(this + 4) = _tmp140
	  lw $t0, -48($fp)	# fill _tmp140 to $t0 from $fp-48
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 4($t2) 	# store with offset
	# _tmp141 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -52($fp)	# spill _tmp141 from $t2 to $fp-52
	# i = _tmp141
	  lw $t2, -52($fp)	# fill _tmp141 to $t2 from $fp-52
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  _L31:
	# _tmp142 = 8
	  li $t2, 8		# load constant value 8 into $t2
	  sw $t2, -56($fp)	# spill _tmp142 from $t2 to $fp-56
	# _tmp143 = i < _tmp142
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -56($fp)	# fill _tmp142 to $t1 from $fp-56
	  slt $t2, $t0, $t1	
	  sw $t2, -60($fp)	# spill _tmp143 from $t2 to $fp-60
	# IfZ _tmp143 Goto _L32
	  lw $t0, -60($fp)	# fill _tmp143 to $t0 from $fp-60
	  beqz $t0, _L32	# branch if _tmp143 is zero 
	# _tmp144 = 12
	  li $t2, 12		# load constant value 12 into $t2
	  sw $t2, -64($fp)	# spill _tmp144 from $t2 to $fp-64
	# PushParam _tmp144
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -64($fp)	# fill _tmp144 to $t0 from $fp-64
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp145 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -68($fp)	# spill _tmp145 from $t2 to $fp-68
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp146 = Deck
	  la $t2, Deck	# load label
	  sw $t2, -72($fp)	# spill _tmp146 from $t2 to $fp-72
	# *(_tmp145) = _tmp146
	  lw $t0, -72($fp)	# fill _tmp146 to $t0 from $fp-72
	  lw $t2, -68($fp)	# fill _tmp145 to $t2 from $fp-68
	  sw $t0, 0($t2) 	# store with offset
	# _tmp147 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -76($fp)	# spill _tmp147 from $t2 to $fp-76
	# _tmp148 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string9	# load label
	  sw $t2, -80($fp)	# spill _tmp148 from $t2 to $fp-80
	# _tmp149 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -84($fp)	# spill _tmp149 from $t2 to $fp-84
	# _tmp150 = i < _tmp149
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -84($fp)	# fill _tmp149 to $t1 from $fp-84
	  slt $t2, $t0, $t1	
	  sw $t2, -88($fp)	# spill _tmp150 from $t2 to $fp-88
	# IfZ _tmp150 Goto _L33
	  lw $t0, -88($fp)	# fill _tmp150 to $t0 from $fp-88
	  beqz $t0, _L33	# branch if _tmp150 is zero 
	# PushParam _tmp148
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -80($fp)	# fill _tmp148 to $t0 from $fp-80
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L33:
	# _tmp151 = *(_tmp147)
	  lw $t0, -76($fp)	# fill _tmp147 to $t0 from $fp-76
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -92($fp)	# spill _tmp151 from $t2 to $fp-92
	# _tmp152 = i < _tmp151
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -92($fp)	# fill _tmp151 to $t1 from $fp-92
	  slt $t2, $t0, $t1	
	  sw $t2, -96($fp)	# spill _tmp152 from $t2 to $fp-96
	# IfZ _tmp152 Goto _L35
	  lw $t0, -96($fp)	# fill _tmp152 to $t0 from $fp-96
	  beqz $t0, _L35	# branch if _tmp152 is zero 
	# Goto _L34
	  b _L34		# unconditional branch
  _L35:
	# PushParam _tmp148
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -80($fp)	# fill _tmp148 to $t0 from $fp-80
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L34:
	# _tmp153 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -100($fp)	# spill _tmp153 from $t2 to $fp-100
	# _tmp154 = i + _tmp153
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -100($fp)	# fill _tmp153 to $t1 from $fp-100
	  add $t2, $t0, $t1	
	  sw $t2, -104($fp)	# spill _tmp154 from $t2 to $fp-104
	# _tmp155 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -108($fp)	# spill _tmp155 from $t2 to $fp-108
	# _tmp156 = _tmp154 * _tmp155
	  lw $t0, -104($fp)	# fill _tmp154 to $t0 from $fp-104
	  lw $t1, -108($fp)	# fill _tmp155 to $t1 from $fp-108
	  mul $t2, $t0, $t1	
	  sw $t2, -112($fp)	# spill _tmp156 from $t2 to $fp-112
	# _tmp157 = _tmp147 + _tmp156
	  lw $t0, -76($fp)	# fill _tmp147 to $t0 from $fp-76
	  lw $t1, -112($fp)	# fill _tmp156 to $t1 from $fp-112
	  add $t2, $t0, $t1	
	  sw $t2, -116($fp)	# spill _tmp157 from $t2 to $fp-116
	# *(_tmp157) = _tmp145
	  lw $t0, -68($fp)	# fill _tmp145 to $t0 from $fp-68
	  lw $t2, -116($fp)	# fill _tmp157 to $t2 from $fp-116
	  sw $t0, 0($t2) 	# store with offset
	# _tmp158 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -120($fp)	# spill _tmp158 from $t2 to $fp-120
	# _tmp159 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string10	# load label
	  sw $t2, -124($fp)	# spill _tmp159 from $t2 to $fp-124
	# _tmp160 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -128($fp)	# spill _tmp160 from $t2 to $fp-128
	# _tmp161 = _tmp158 == _tmp160
	  lw $t0, -120($fp)	# fill _tmp158 to $t0 from $fp-120
	  lw $t1, -128($fp)	# fill _tmp160 to $t1 from $fp-128
	  seq $t2, $t0, $t1	
	  sw $t2, -132($fp)	# spill _tmp161 from $t2 to $fp-132
	# IfZ _tmp161 Goto _L36
	  lw $t0, -132($fp)	# fill _tmp161 to $t0 from $fp-132
	  beqz $t0, _L36	# branch if _tmp161 is zero 
	# PushParam _tmp159
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -124($fp)	# fill _tmp159 to $t0 from $fp-124
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L36:
	# _tmp162 = i < _tmp160
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -128($fp)	# fill _tmp160 to $t1 from $fp-128
	  slt $t2, $t0, $t1	
	  sw $t2, -136($fp)	# spill _tmp162 from $t2 to $fp-136
	# IfZ _tmp162 Goto _L37
	  lw $t0, -136($fp)	# fill _tmp162 to $t0 from $fp-136
	  beqz $t0, _L37	# branch if _tmp162 is zero 
	# PushParam _tmp159
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -124($fp)	# fill _tmp159 to $t0 from $fp-124
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L37:
	# _tmp163 = *(_tmp158)
	  lw $t0, -120($fp)	# fill _tmp158 to $t0 from $fp-120
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -140($fp)	# spill _tmp163 from $t2 to $fp-140
	# _tmp164 = i < _tmp163
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -140($fp)	# fill _tmp163 to $t1 from $fp-140
	  slt $t2, $t0, $t1	
	  sw $t2, -144($fp)	# spill _tmp164 from $t2 to $fp-144
	# IfZ _tmp164 Goto _L39
	  lw $t0, -144($fp)	# fill _tmp164 to $t0 from $fp-144
	  beqz $t0, _L39	# branch if _tmp164 is zero 
	# Goto _L38
	  b _L38		# unconditional branch
  _L39:
	# PushParam _tmp159
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -124($fp)	# fill _tmp159 to $t0 from $fp-124
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L38:
	# _tmp165 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -148($fp)	# spill _tmp165 from $t2 to $fp-148
	# _tmp166 = i + _tmp165
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -148($fp)	# fill _tmp165 to $t1 from $fp-148
	  add $t2, $t0, $t1	
	  sw $t2, -152($fp)	# spill _tmp166 from $t2 to $fp-152
	# _tmp167 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -156($fp)	# spill _tmp167 from $t2 to $fp-156
	# _tmp168 = _tmp166 * _tmp167
	  lw $t0, -152($fp)	# fill _tmp166 to $t0 from $fp-152
	  lw $t1, -156($fp)	# fill _tmp167 to $t1 from $fp-156
	  mul $t2, $t0, $t1	
	  sw $t2, -160($fp)	# spill _tmp168 from $t2 to $fp-160
	# _tmp169 = _tmp158 + _tmp168
	  lw $t0, -120($fp)	# fill _tmp158 to $t0 from $fp-120
	  lw $t1, -160($fp)	# fill _tmp168 to $t1 from $fp-160
	  add $t2, $t0, $t1	
	  sw $t2, -164($fp)	# spill _tmp169 from $t2 to $fp-164
	# _tmp170 = *(_tmp169)
	  lw $t0, -164($fp)	# fill _tmp169 to $t0 from $fp-164
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -168($fp)	# spill _tmp170 from $t2 to $fp-168
	# PushParam _tmp170
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -168($fp)	# fill _tmp170 to $t0 from $fp-168
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp171 = *(_tmp170)
	  lw $t0, -168($fp)	# fill _tmp170 to $t0 from $fp-168
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -172($fp)	# spill _tmp171 from $t2 to $fp-172
	# _tmp172 = *(_tmp171)
	  lw $t0, -172($fp)	# fill _tmp171 to $t0 from $fp-172
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -176($fp)	# spill _tmp172 from $t2 to $fp-176
	# ACall _tmp172
	  lw $t0, -176($fp)	# fill _tmp172 to $t0 from $fp-176
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp173 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -180($fp)	# spill _tmp173 from $t2 to $fp-180
	# _tmp174 = i + _tmp173
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -180($fp)	# fill _tmp173 to $t1 from $fp-180
	  add $t2, $t0, $t1	
	  sw $t2, -184($fp)	# spill _tmp174 from $t2 to $fp-184
	# i = _tmp174
	  lw $t2, -184($fp)	# fill _tmp174 to $t2 from $fp-184
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# Goto _L31
	  b _L31		# unconditional branch
  _L32:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _BJDeck.DealCard:
	# BeginFunc 168
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 168	# decrement sp to make space for locals/temps
	# _tmp175 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -12($fp)	# spill _tmp175 from $t2 to $fp-12
	# c = _tmp175
	  lw $t2, -12($fp)	# fill _tmp175 to $t2 from $fp-12
	  sw $t2, -8($fp)	# spill c from $t2 to $fp-8
	# _tmp176 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp176 from $t2 to $fp-16
	# _tmp177 = 8
	  li $t2, 8		# load constant value 8 into $t2
	  sw $t2, -20($fp)	# spill _tmp177 from $t2 to $fp-20
	# _tmp178 = 52
	  li $t2, 52		# load constant value 52 into $t2
	  sw $t2, -24($fp)	# spill _tmp178 from $t2 to $fp-24
	# _tmp179 = _tmp177 * _tmp178
	  lw $t0, -20($fp)	# fill _tmp177 to $t0 from $fp-20
	  lw $t1, -24($fp)	# fill _tmp178 to $t1 from $fp-24
	  mul $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp179 from $t2 to $fp-28
	# _tmp180 = _tmp176 < _tmp179
	  lw $t0, -16($fp)	# fill _tmp176 to $t0 from $fp-16
	  lw $t1, -28($fp)	# fill _tmp179 to $t1 from $fp-28
	  slt $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp180 from $t2 to $fp-32
	# _tmp181 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -36($fp)	# spill _tmp181 from $t2 to $fp-36
	# _tmp182 = _tmp181 - _tmp180
	  lw $t0, -36($fp)	# fill _tmp181 to $t0 from $fp-36
	  lw $t1, -32($fp)	# fill _tmp180 to $t1 from $fp-32
	  sub $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp182 from $t2 to $fp-40
	# IfZ _tmp182 Goto _L40
	  lw $t0, -40($fp)	# fill _tmp182 to $t0 from $fp-40
	  beqz $t0, _L40	# branch if _tmp182 is zero 
	# _tmp183 = 11
	  li $t2, 11		# load constant value 11 into $t2
	  sw $t2, -44($fp)	# spill _tmp183 from $t2 to $fp-44
	# Return _tmp183
	  lw $t2, -44($fp)	# fill _tmp183 to $t2 from $fp-44
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto _L41
	  b _L41		# unconditional branch
  _L40:
  _L41:
  _L42:
	# _tmp184 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -48($fp)	# spill _tmp184 from $t2 to $fp-48
	# _tmp185 = c == _tmp184
	  lw $t0, -8($fp)	# fill c to $t0 from $fp-8
	  lw $t1, -48($fp)	# fill _tmp184 to $t1 from $fp-48
	  seq $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp185 from $t2 to $fp-52
	# IfZ _tmp185 Goto _L43
	  lw $t0, -52($fp)	# fill _tmp185 to $t0 from $fp-52
	  beqz $t0, _L43	# branch if _tmp185 is zero 
	# _tmp186 = 8
	  li $t2, 8		# load constant value 8 into $t2
	  sw $t2, -60($fp)	# spill _tmp186 from $t2 to $fp-60
	# PushParam _tmp186
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -60($fp)	# fill _tmp186 to $t0 from $fp-60
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam gRnd
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 0($gp)	# fill gRnd to $t0 from $gp+0
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp187 = *(gRnd)
	  lw $t0, 0($gp)	# fill gRnd to $t0 from $gp+0
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -64($fp)	# spill _tmp187 from $t2 to $fp-64
	# _tmp188 = *(_tmp187 + 8)
	  lw $t0, -64($fp)	# fill _tmp187 to $t0 from $fp-64
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -68($fp)	# spill _tmp188 from $t2 to $fp-68
	# _tmp189 = ACall _tmp188
	  lw $t0, -68($fp)	# fill _tmp188 to $t0 from $fp-68
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -72($fp)	# spill _tmp189 from $t2 to $fp-72
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# d = _tmp189
	  lw $t2, -72($fp)	# fill _tmp189 to $t2 from $fp-72
	  sw $t2, -56($fp)	# spill d from $t2 to $fp-56
	# _tmp190 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -76($fp)	# spill _tmp190 from $t2 to $fp-76
	# _tmp191 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string11: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string11	# load label
	  sw $t2, -80($fp)	# spill _tmp191 from $t2 to $fp-80
	# _tmp192 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -84($fp)	# spill _tmp192 from $t2 to $fp-84
	# _tmp193 = _tmp190 == _tmp192
	  lw $t0, -76($fp)	# fill _tmp190 to $t0 from $fp-76
	  lw $t1, -84($fp)	# fill _tmp192 to $t1 from $fp-84
	  seq $t2, $t0, $t1	
	  sw $t2, -88($fp)	# spill _tmp193 from $t2 to $fp-88
	# IfZ _tmp193 Goto _L44
	  lw $t0, -88($fp)	# fill _tmp193 to $t0 from $fp-88
	  beqz $t0, _L44	# branch if _tmp193 is zero 
	# PushParam _tmp191
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -80($fp)	# fill _tmp191 to $t0 from $fp-80
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L44:
	# _tmp194 = d < _tmp192
	  lw $t0, -56($fp)	# fill d to $t0 from $fp-56
	  lw $t1, -84($fp)	# fill _tmp192 to $t1 from $fp-84
	  slt $t2, $t0, $t1	
	  sw $t2, -92($fp)	# spill _tmp194 from $t2 to $fp-92
	# IfZ _tmp194 Goto _L45
	  lw $t0, -92($fp)	# fill _tmp194 to $t0 from $fp-92
	  beqz $t0, _L45	# branch if _tmp194 is zero 
	# PushParam _tmp191
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -80($fp)	# fill _tmp191 to $t0 from $fp-80
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L45:
	# _tmp195 = *(_tmp190)
	  lw $t0, -76($fp)	# fill _tmp190 to $t0 from $fp-76
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -96($fp)	# spill _tmp195 from $t2 to $fp-96
	# _tmp196 = d < _tmp195
	  lw $t0, -56($fp)	# fill d to $t0 from $fp-56
	  lw $t1, -96($fp)	# fill _tmp195 to $t1 from $fp-96
	  slt $t2, $t0, $t1	
	  sw $t2, -100($fp)	# spill _tmp196 from $t2 to $fp-100
	# IfZ _tmp196 Goto _L47
	  lw $t0, -100($fp)	# fill _tmp196 to $t0 from $fp-100
	  beqz $t0, _L47	# branch if _tmp196 is zero 
	# Goto _L46
	  b _L46		# unconditional branch
  _L47:
	# PushParam _tmp191
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -80($fp)	# fill _tmp191 to $t0 from $fp-80
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L46:
	# _tmp197 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -104($fp)	# spill _tmp197 from $t2 to $fp-104
	# _tmp198 = d + _tmp197
	  lw $t0, -56($fp)	# fill d to $t0 from $fp-56
	  lw $t1, -104($fp)	# fill _tmp197 to $t1 from $fp-104
	  add $t2, $t0, $t1	
	  sw $t2, -108($fp)	# spill _tmp198 from $t2 to $fp-108
	# _tmp199 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -112($fp)	# spill _tmp199 from $t2 to $fp-112
	# _tmp200 = _tmp198 * _tmp199
	  lw $t0, -108($fp)	# fill _tmp198 to $t0 from $fp-108
	  lw $t1, -112($fp)	# fill _tmp199 to $t1 from $fp-112
	  mul $t2, $t0, $t1	
	  sw $t2, -116($fp)	# spill _tmp200 from $t2 to $fp-116
	# _tmp201 = _tmp190 + _tmp200
	  lw $t0, -76($fp)	# fill _tmp190 to $t0 from $fp-76
	  lw $t1, -116($fp)	# fill _tmp200 to $t1 from $fp-116
	  add $t2, $t0, $t1	
	  sw $t2, -120($fp)	# spill _tmp201 from $t2 to $fp-120
	# _tmp202 = *(_tmp201)
	  lw $t0, -120($fp)	# fill _tmp201 to $t0 from $fp-120
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -124($fp)	# spill _tmp202 from $t2 to $fp-124
	# PushParam _tmp202
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -124($fp)	# fill _tmp202 to $t0 from $fp-124
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp203 = *(_tmp202)
	  lw $t0, -124($fp)	# fill _tmp202 to $t0 from $fp-124
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -128($fp)	# spill _tmp203 from $t2 to $fp-128
	# _tmp204 = *(_tmp203 + 8)
	  lw $t0, -128($fp)	# fill _tmp203 to $t0 from $fp-128
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -132($fp)	# spill _tmp204 from $t2 to $fp-132
	# _tmp205 = ACall _tmp204
	  lw $t0, -132($fp)	# fill _tmp204 to $t0 from $fp-132
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -136($fp)	# spill _tmp205 from $t2 to $fp-136
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# c = _tmp205
	  lw $t2, -136($fp)	# fill _tmp205 to $t2 from $fp-136
	  sw $t2, -8($fp)	# spill c from $t2 to $fp-8
	# Goto _L42
	  b _L42		# unconditional branch
  _L43:
	# _tmp206 = 10
	  li $t2, 10		# load constant value 10 into $t2
	  sw $t2, -140($fp)	# spill _tmp206 from $t2 to $fp-140
	# _tmp207 = _tmp206 < c
	  lw $t0, -140($fp)	# fill _tmp206 to $t0 from $fp-140
	  lw $t1, -8($fp)	# fill c to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -144($fp)	# spill _tmp207 from $t2 to $fp-144
	# IfZ _tmp207 Goto _L48
	  lw $t0, -144($fp)	# fill _tmp207 to $t0 from $fp-144
	  beqz $t0, _L48	# branch if _tmp207 is zero 
	# _tmp208 = 10
	  li $t2, 10		# load constant value 10 into $t2
	  sw $t2, -148($fp)	# spill _tmp208 from $t2 to $fp-148
	# c = _tmp208
	  lw $t2, -148($fp)	# fill _tmp208 to $t2 from $fp-148
	  sw $t2, -8($fp)	# spill c from $t2 to $fp-8
	# Goto _L49
	  b _L49		# unconditional branch
  _L48:
	# _tmp209 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -152($fp)	# spill _tmp209 from $t2 to $fp-152
	# _tmp210 = c == _tmp209
	  lw $t0, -8($fp)	# fill c to $t0 from $fp-8
	  lw $t1, -152($fp)	# fill _tmp209 to $t1 from $fp-152
	  seq $t2, $t0, $t1	
	  sw $t2, -156($fp)	# spill _tmp210 from $t2 to $fp-156
	# IfZ _tmp210 Goto _L50
	  lw $t0, -156($fp)	# fill _tmp210 to $t0 from $fp-156
	  beqz $t0, _L50	# branch if _tmp210 is zero 
	# _tmp211 = 11
	  li $t2, 11		# load constant value 11 into $t2
	  sw $t2, -160($fp)	# spill _tmp211 from $t2 to $fp-160
	# c = _tmp211
	  lw $t2, -160($fp)	# fill _tmp211 to $t2 from $fp-160
	  sw $t2, -8($fp)	# spill c from $t2 to $fp-8
	# Goto _L51
	  b _L51		# unconditional branch
  _L50:
  _L51:
  _L49:
	# _tmp212 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -164($fp)	# spill _tmp212 from $t2 to $fp-164
	# _tmp213 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -168($fp)	# spill _tmp213 from $t2 to $fp-168
	# _tmp214 = _tmp212 + _tmp213
	  lw $t0, -164($fp)	# fill _tmp212 to $t0 from $fp-164
	  lw $t1, -168($fp)	# fill _tmp213 to $t1 from $fp-168
	  add $t2, $t0, $t1	
	  sw $t2, -172($fp)	# spill _tmp214 from $t2 to $fp-172
	# *(this + 8) = _tmp214
	  lw $t0, -172($fp)	# fill _tmp214 to $t0 from $fp-172
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 8($t2) 	# store with offset
	# Return c
	  lw $t2, -8($fp)	# fill c to $t2 from $fp-8
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
  _BJDeck.Shuffle:
	# BeginFunc 96
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 96	# decrement sp to make space for locals/temps
	# _tmp215 = "Shuffling..."
	  .data			# create string constant marked with label
	  _string12: .asciiz "Shuffling..."
	  .text
	  la $t2, _string12	# load label
	  sw $t2, -12($fp)	# spill _tmp215 from $t2 to $fp-12
	# PushParam _tmp215
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp215 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp216 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -16($fp)	# spill _tmp216 from $t2 to $fp-16
	# i = _tmp216
	  lw $t2, -16($fp)	# fill _tmp216 to $t2 from $fp-16
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  _L52:
	# _tmp217 = 8
	  li $t2, 8		# load constant value 8 into $t2
	  sw $t2, -20($fp)	# spill _tmp217 from $t2 to $fp-20
	# _tmp218 = i < _tmp217
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -20($fp)	# fill _tmp217 to $t1 from $fp-20
	  slt $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp218 from $t2 to $fp-24
	# IfZ _tmp218 Goto _L53
	  lw $t0, -24($fp)	# fill _tmp218 to $t0 from $fp-24
	  beqz $t0, _L53	# branch if _tmp218 is zero 
	# _tmp219 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -28($fp)	# spill _tmp219 from $t2 to $fp-28
	# _tmp220 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string13: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string13	# load label
	  sw $t2, -32($fp)	# spill _tmp220 from $t2 to $fp-32
	# _tmp221 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -36($fp)	# spill _tmp221 from $t2 to $fp-36
	# _tmp222 = _tmp219 == _tmp221
	  lw $t0, -28($fp)	# fill _tmp219 to $t0 from $fp-28
	  lw $t1, -36($fp)	# fill _tmp221 to $t1 from $fp-36
	  seq $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp222 from $t2 to $fp-40
	# IfZ _tmp222 Goto _L54
	  lw $t0, -40($fp)	# fill _tmp222 to $t0 from $fp-40
	  beqz $t0, _L54	# branch if _tmp222 is zero 
	# PushParam _tmp220
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp220 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L54:
	# _tmp223 = i < _tmp221
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -36($fp)	# fill _tmp221 to $t1 from $fp-36
	  slt $t2, $t0, $t1	
	  sw $t2, -44($fp)	# spill _tmp223 from $t2 to $fp-44
	# IfZ _tmp223 Goto _L55
	  lw $t0, -44($fp)	# fill _tmp223 to $t0 from $fp-44
	  beqz $t0, _L55	# branch if _tmp223 is zero 
	# PushParam _tmp220
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp220 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L55:
	# _tmp224 = *(_tmp219)
	  lw $t0, -28($fp)	# fill _tmp219 to $t0 from $fp-28
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -48($fp)	# spill _tmp224 from $t2 to $fp-48
	# _tmp225 = i < _tmp224
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -48($fp)	# fill _tmp224 to $t1 from $fp-48
	  slt $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp225 from $t2 to $fp-52
	# IfZ _tmp225 Goto _L57
	  lw $t0, -52($fp)	# fill _tmp225 to $t0 from $fp-52
	  beqz $t0, _L57	# branch if _tmp225 is zero 
	# Goto _L56
	  b _L56		# unconditional branch
  _L57:
	# PushParam _tmp220
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp220 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L56:
	# _tmp226 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -56($fp)	# spill _tmp226 from $t2 to $fp-56
	# _tmp227 = i + _tmp226
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -56($fp)	# fill _tmp226 to $t1 from $fp-56
	  add $t2, $t0, $t1	
	  sw $t2, -60($fp)	# spill _tmp227 from $t2 to $fp-60
	# _tmp228 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -64($fp)	# spill _tmp228 from $t2 to $fp-64
	# _tmp229 = _tmp227 * _tmp228
	  lw $t0, -60($fp)	# fill _tmp227 to $t0 from $fp-60
	  lw $t1, -64($fp)	# fill _tmp228 to $t1 from $fp-64
	  mul $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp229 from $t2 to $fp-68
	# _tmp230 = _tmp219 + _tmp229
	  lw $t0, -28($fp)	# fill _tmp219 to $t0 from $fp-28
	  lw $t1, -68($fp)	# fill _tmp229 to $t1 from $fp-68
	  add $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp230 from $t2 to $fp-72
	# _tmp231 = *(_tmp230)
	  lw $t0, -72($fp)	# fill _tmp230 to $t0 from $fp-72
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -76($fp)	# spill _tmp231 from $t2 to $fp-76
	# PushParam _tmp231
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -76($fp)	# fill _tmp231 to $t0 from $fp-76
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp232 = *(_tmp231)
	  lw $t0, -76($fp)	# fill _tmp231 to $t0 from $fp-76
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -80($fp)	# spill _tmp232 from $t2 to $fp-80
	# _tmp233 = *(_tmp232 + 4)
	  lw $t0, -80($fp)	# fill _tmp232 to $t0 from $fp-80
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -84($fp)	# spill _tmp233 from $t2 to $fp-84
	# ACall _tmp233
	  lw $t0, -84($fp)	# fill _tmp233 to $t0 from $fp-84
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp234 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -88($fp)	# spill _tmp234 from $t2 to $fp-88
	# _tmp235 = i + _tmp234
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -88($fp)	# fill _tmp234 to $t1 from $fp-88
	  add $t2, $t0, $t1	
	  sw $t2, -92($fp)	# spill _tmp235 from $t2 to $fp-92
	# i = _tmp235
	  lw $t2, -92($fp)	# fill _tmp235 to $t2 from $fp-92
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# Goto _L52
	  b _L52		# unconditional branch
  _L53:
	# _tmp236 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -96($fp)	# spill _tmp236 from $t2 to $fp-96
	# *(this + 8) = _tmp236
	  lw $t0, -96($fp)	# fill _tmp236 to $t0 from $fp-96
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 8($t2) 	# store with offset
	# _tmp237 = "done.\n"
	  .data			# create string constant marked with label
	  _string14: .asciiz "done.\n"
	  .text
	  la $t2, _string14	# load label
	  sw $t2, -100($fp)	# spill _tmp237 from $t2 to $fp-100
	# PushParam _tmp237
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -100($fp)	# fill _tmp237 to $t0 from $fp-100
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
  _BJDeck.NumCardsRemaining:
	# BeginFunc 20
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 20	# decrement sp to make space for locals/temps
	# _tmp238 = 8
	  li $t2, 8		# load constant value 8 into $t2
	  sw $t2, -8($fp)	# spill _tmp238 from $t2 to $fp-8
	# _tmp239 = 52
	  li $t2, 52		# load constant value 52 into $t2
	  sw $t2, -12($fp)	# spill _tmp239 from $t2 to $fp-12
	# _tmp240 = _tmp238 * _tmp239
	  lw $t0, -8($fp)	# fill _tmp238 to $t0 from $fp-8
	  lw $t1, -12($fp)	# fill _tmp239 to $t1 from $fp-12
	  mul $t2, $t0, $t1	
	  sw $t2, -16($fp)	# spill _tmp240 from $t2 to $fp-16
	# _tmp241 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -20($fp)	# spill _tmp241 from $t2 to $fp-20
	# _tmp242 = _tmp240 - _tmp241
	  lw $t0, -16($fp)	# fill _tmp240 to $t0 from $fp-16
	  lw $t1, -20($fp)	# fill _tmp241 to $t1 from $fp-20
	  sub $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp242 from $t2 to $fp-24
	# Return _tmp242
	  lw $t2, -24($fp)	# fill _tmp242 to $t2 from $fp-24
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
	# VTable for class Player
	  .data
	  .align 2
	  Player:		# label for class Player vtable
	  .word _Player.Init
	  .word _Player.Hit
	  .word _Player.DoubleDown
	  .word _Player.TakeTurn
	  .word _Player.HasMoney
	  .word _Player.PrintMoney
	  .word _Player.PlaceBet
	  .word _Player.GetTotal
	  .word _Player.Resolve
	  .text
  _Player.Init:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp243 = 1000
	  li $t2, 1000		# load constant value 1000 into $t2
	  sw $t2, -8($fp)	# spill _tmp243 from $t2 to $fp-8
	# *(this + 20) = _tmp243
	  lw $t0, -8($fp)	# fill _tmp243 to $t0 from $fp-8
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 20($t2) 	# store with offset
	# _tmp244 = "What is the name of player #"
	  .data			# create string constant marked with label
	  _string15: .asciiz "What is the name of player #"
	  .text
	  la $t2, _string15	# load label
	  sw $t2, -12($fp)	# spill _tmp244 from $t2 to $fp-12
	# PushParam _tmp244
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp244 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam num
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill num to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp245 = "? "
	  .data			# create string constant marked with label
	  _string16: .asciiz "? "
	  .text
	  la $t2, _string16	# load label
	  sw $t2, -16($fp)	# spill _tmp245 from $t2 to $fp-16
	# PushParam _tmp245
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp245 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp246 = LCall _ReadLine
	  jal _ReadLine      	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -20($fp)	# spill _tmp246 from $t2 to $fp-20
	# *(this + 24) = _tmp246
	  lw $t0, -20($fp)	# fill _tmp246 to $t0 from $fp-20
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 24($t2) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Player.Hit:
	# BeginFunc 124
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 124	# decrement sp to make space for locals/temps
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill deck to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp247 = *(deck)
	  lw $t0, 8($fp)	# fill deck to $t0 from $fp+8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp247 from $t2 to $fp-12
	# _tmp248 = *(_tmp247 + 4)
	  lw $t0, -12($fp)	# fill _tmp247 to $t0 from $fp-12
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp248 from $t2 to $fp-16
	# _tmp249 = ACall _tmp248
	  lw $t0, -16($fp)	# fill _tmp248 to $t0 from $fp-16
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -20($fp)	# spill _tmp249 from $t2 to $fp-20
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# card = _tmp249
	  lw $t2, -20($fp)	# fill _tmp249 to $t2 from $fp-20
	  sw $t2, -8($fp)	# spill card from $t2 to $fp-8
	# _tmp250 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -24($fp)	# spill _tmp250 from $t2 to $fp-24
	# PushParam _tmp250
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp250 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp251 = " was dealt a "
	  .data			# create string constant marked with label
	  _string17: .asciiz " was dealt a "
	  .text
	  la $t2, _string17	# load label
	  sw $t2, -28($fp)	# spill _tmp251 from $t2 to $fp-28
	# PushParam _tmp251
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -28($fp)	# fill _tmp251 to $t0 from $fp-28
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam card
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill card to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp252 = ".\n"
	  .data			# create string constant marked with label
	  _string18: .asciiz ".\n"
	  .text
	  la $t2, _string18	# load label
	  sw $t2, -32($fp)	# spill _tmp252 from $t2 to $fp-32
	# PushParam _tmp252
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp252 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp253 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -36($fp)	# spill _tmp253 from $t2 to $fp-36
	# _tmp254 = _tmp253 + card
	  lw $t0, -36($fp)	# fill _tmp253 to $t0 from $fp-36
	  lw $t1, -8($fp)	# fill card to $t1 from $fp-8
	  add $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp254 from $t2 to $fp-40
	# *(this + 4) = _tmp254
	  lw $t0, -40($fp)	# fill _tmp254 to $t0 from $fp-40
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 4($t2) 	# store with offset
	# _tmp255 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -44($fp)	# spill _tmp255 from $t2 to $fp-44
	# _tmp256 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -48($fp)	# spill _tmp256 from $t2 to $fp-48
	# _tmp257 = _tmp255 + _tmp256
	  lw $t0, -44($fp)	# fill _tmp255 to $t0 from $fp-44
	  lw $t1, -48($fp)	# fill _tmp256 to $t1 from $fp-48
	  add $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp257 from $t2 to $fp-52
	# *(this + 12) = _tmp257
	  lw $t0, -52($fp)	# fill _tmp257 to $t0 from $fp-52
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 12($t2) 	# store with offset
	# _tmp258 = 11
	  li $t2, 11		# load constant value 11 into $t2
	  sw $t2, -56($fp)	# spill _tmp258 from $t2 to $fp-56
	# _tmp259 = card == _tmp258
	  lw $t0, -8($fp)	# fill card to $t0 from $fp-8
	  lw $t1, -56($fp)	# fill _tmp258 to $t1 from $fp-56
	  seq $t2, $t0, $t1	
	  sw $t2, -60($fp)	# spill _tmp259 from $t2 to $fp-60
	# IfZ _tmp259 Goto _L58
	  lw $t0, -60($fp)	# fill _tmp259 to $t0 from $fp-60
	  beqz $t0, _L58	# branch if _tmp259 is zero 
	# _tmp260 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -64($fp)	# spill _tmp260 from $t2 to $fp-64
	# _tmp261 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -68($fp)	# spill _tmp261 from $t2 to $fp-68
	# _tmp262 = _tmp260 + _tmp261
	  lw $t0, -64($fp)	# fill _tmp260 to $t0 from $fp-64
	  lw $t1, -68($fp)	# fill _tmp261 to $t1 from $fp-68
	  add $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp262 from $t2 to $fp-72
	# *(this + 8) = _tmp262
	  lw $t0, -72($fp)	# fill _tmp262 to $t0 from $fp-72
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 8($t2) 	# store with offset
	# Goto _L59
	  b _L59		# unconditional branch
  _L58:
  _L59:
  _L60:
	# _tmp264 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -80($fp)	# spill _tmp264 from $t2 to $fp-80
	# _tmp265 = 21
	  li $t2, 21		# load constant value 21 into $t2
	  sw $t2, -84($fp)	# spill _tmp265 from $t2 to $fp-84
	# _tmp266 = _tmp265 < _tmp264
	  lw $t0, -84($fp)	# fill _tmp265 to $t0 from $fp-84
	  lw $t1, -80($fp)	# fill _tmp264 to $t1 from $fp-80
	  slt $t2, $t0, $t1	
	  sw $t2, -88($fp)	# spill _tmp266 from $t2 to $fp-88
	# IfZ _tmp266 Goto _L62
	  lw $t0, -88($fp)	# fill _tmp266 to $t0 from $fp-88
	  beqz $t0, _L62	# branch if _tmp266 is zero 
	# _tmp267 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -92($fp)	# spill _tmp267 from $t2 to $fp-92
	# _tmp268 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -96($fp)	# spill _tmp268 from $t2 to $fp-96
	# _tmp269 = _tmp268 < _tmp267
	  lw $t0, -96($fp)	# fill _tmp268 to $t0 from $fp-96
	  lw $t1, -92($fp)	# fill _tmp267 to $t1 from $fp-92
	  slt $t2, $t0, $t1	
	  sw $t2, -100($fp)	# spill _tmp269 from $t2 to $fp-100
	# _tmp263 = _tmp269
	  lw $t2, -100($fp)	# fill _tmp269 to $t2 from $fp-100
	  sw $t2, -76($fp)	# spill _tmp263 from $t2 to $fp-76
	# Goto _L63
	  b _L63		# unconditional branch
  _L62:
	# _tmp270 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -104($fp)	# spill _tmp270 from $t2 to $fp-104
	# _tmp263 = _tmp270
	  lw $t2, -104($fp)	# fill _tmp270 to $t2 from $fp-104
	  sw $t2, -76($fp)	# spill _tmp263 from $t2 to $fp-76
  _L63:
	# IfZ _tmp263 Goto _L61
	  lw $t0, -76($fp)	# fill _tmp263 to $t0 from $fp-76
	  beqz $t0, _L61	# branch if _tmp263 is zero 
	# _tmp271 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -108($fp)	# spill _tmp271 from $t2 to $fp-108
	# _tmp272 = 10
	  li $t2, 10		# load constant value 10 into $t2
	  sw $t2, -112($fp)	# spill _tmp272 from $t2 to $fp-112
	# _tmp273 = _tmp271 - _tmp272
	  lw $t0, -108($fp)	# fill _tmp271 to $t0 from $fp-108
	  lw $t1, -112($fp)	# fill _tmp272 to $t1 from $fp-112
	  sub $t2, $t0, $t1	
	  sw $t2, -116($fp)	# spill _tmp273 from $t2 to $fp-116
	# *(this + 4) = _tmp273
	  lw $t0, -116($fp)	# fill _tmp273 to $t0 from $fp-116
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 4($t2) 	# store with offset
	# _tmp274 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -120($fp)	# spill _tmp274 from $t2 to $fp-120
	# _tmp275 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -124($fp)	# spill _tmp275 from $t2 to $fp-124
	# _tmp276 = _tmp274 - _tmp275
	  lw $t0, -120($fp)	# fill _tmp274 to $t0 from $fp-120
	  lw $t1, -124($fp)	# fill _tmp275 to $t1 from $fp-124
	  sub $t2, $t0, $t1	
	  sw $t2, -128($fp)	# spill _tmp276 from $t2 to $fp-128
	# *(this + 8) = _tmp276
	  lw $t0, -128($fp)	# fill _tmp276 to $t0 from $fp-128
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 8($t2) 	# store with offset
	# Goto _L60
	  b _L60		# unconditional branch
  _L61:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Player.DoubleDown:
	# BeginFunc 108
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 108	# decrement sp to make space for locals/temps
	# _tmp278 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp278 from $t2 to $fp-16
	# _tmp279 = 10
	  li $t2, 10		# load constant value 10 into $t2
	  sw $t2, -20($fp)	# spill _tmp279 from $t2 to $fp-20
	# _tmp280 = _tmp278 == _tmp279
	  lw $t0, -16($fp)	# fill _tmp278 to $t0 from $fp-16
	  lw $t1, -20($fp)	# fill _tmp279 to $t1 from $fp-20
	  seq $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp280 from $t2 to $fp-24
	# _tmp281 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -28($fp)	# spill _tmp281 from $t2 to $fp-28
	# _tmp282 = _tmp281 - _tmp280
	  lw $t0, -28($fp)	# fill _tmp281 to $t0 from $fp-28
	  lw $t1, -24($fp)	# fill _tmp280 to $t1 from $fp-24
	  sub $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp282 from $t2 to $fp-32
	# IfZ _tmp282 Goto _L64
	  lw $t0, -32($fp)	# fill _tmp282 to $t0 from $fp-32
	  beqz $t0, _L64	# branch if _tmp282 is zero 
	# _tmp283 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -36($fp)	# spill _tmp283 from $t2 to $fp-36
	# _tmp284 = 11
	  li $t2, 11		# load constant value 11 into $t2
	  sw $t2, -40($fp)	# spill _tmp284 from $t2 to $fp-40
	# _tmp285 = _tmp283 == _tmp284
	  lw $t0, -36($fp)	# fill _tmp283 to $t0 from $fp-36
	  lw $t1, -40($fp)	# fill _tmp284 to $t1 from $fp-40
	  seq $t2, $t0, $t1	
	  sw $t2, -44($fp)	# spill _tmp285 from $t2 to $fp-44
	# _tmp286 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -48($fp)	# spill _tmp286 from $t2 to $fp-48
	# _tmp287 = _tmp286 - _tmp285
	  lw $t0, -48($fp)	# fill _tmp286 to $t0 from $fp-48
	  lw $t1, -44($fp)	# fill _tmp285 to $t1 from $fp-44
	  sub $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp287 from $t2 to $fp-52
	# _tmp277 = _tmp287
	  lw $t2, -52($fp)	# fill _tmp287 to $t2 from $fp-52
	  sw $t2, -12($fp)	# spill _tmp277 from $t2 to $fp-12
	# Goto _L65
	  b _L65		# unconditional branch
  _L64:
	# _tmp288 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -56($fp)	# spill _tmp288 from $t2 to $fp-56
	# _tmp277 = _tmp288
	  lw $t2, -56($fp)	# fill _tmp288 to $t2 from $fp-56
	  sw $t2, -12($fp)	# spill _tmp277 from $t2 to $fp-12
  _L65:
	# IfZ _tmp277 Goto _L66
	  lw $t0, -12($fp)	# fill _tmp277 to $t0 from $fp-12
	  beqz $t0, _L66	# branch if _tmp277 is zero 
	# _tmp289 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -60($fp)	# spill _tmp289 from $t2 to $fp-60
	# Return _tmp289
	  lw $t2, -60($fp)	# fill _tmp289 to $t2 from $fp-60
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto _L67
	  b _L67		# unconditional branch
  _L66:
  _L67:
	# _tmp290 = "Would you like to double down?"
	  .data			# create string constant marked with label
	  _string19: .asciiz "Would you like to double down?"
	  .text
	  la $t2, _string19	# load label
	  sw $t2, -64($fp)	# spill _tmp290 from $t2 to $fp-64
	# PushParam _tmp290
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -64($fp)	# fill _tmp290 to $t0 from $fp-64
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp291 = LCall _GetYesOrNo
	  jal _GetYesOrNo    	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -68($fp)	# spill _tmp291 from $t2 to $fp-68
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# IfZ _tmp291 Goto _L68
	  lw $t0, -68($fp)	# fill _tmp291 to $t0 from $fp-68
	  beqz $t0, _L68	# branch if _tmp291 is zero 
	# _tmp292 = *(this + 16)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -72($fp)	# spill _tmp292 from $t2 to $fp-72
	# _tmp293 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -76($fp)	# spill _tmp293 from $t2 to $fp-76
	# _tmp294 = _tmp292 * _tmp293
	  lw $t0, -72($fp)	# fill _tmp292 to $t0 from $fp-72
	  lw $t1, -76($fp)	# fill _tmp293 to $t1 from $fp-76
	  mul $t2, $t0, $t1	
	  sw $t2, -80($fp)	# spill _tmp294 from $t2 to $fp-80
	# *(this + 16) = _tmp294
	  lw $t0, -80($fp)	# fill _tmp294 to $t0 from $fp-80
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 16($t2) 	# store with offset
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill deck to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp295 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -84($fp)	# spill _tmp295 from $t2 to $fp-84
	# _tmp296 = *(_tmp295 + 4)
	  lw $t0, -84($fp)	# fill _tmp295 to $t0 from $fp-84
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -88($fp)	# spill _tmp296 from $t2 to $fp-88
	# ACall _tmp296
	  lw $t0, -88($fp)	# fill _tmp296 to $t0 from $fp-88
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp297 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -92($fp)	# spill _tmp297 from $t2 to $fp-92
	# PushParam _tmp297
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -92($fp)	# fill _tmp297 to $t0 from $fp-92
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp298 = ", your total is "
	  .data			# create string constant marked with label
	  _string20: .asciiz ", your total is "
	  .text
	  la $t2, _string20	# load label
	  sw $t2, -96($fp)	# spill _tmp298 from $t2 to $fp-96
	# PushParam _tmp298
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -96($fp)	# fill _tmp298 to $t0 from $fp-96
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp299 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -100($fp)	# spill _tmp299 from $t2 to $fp-100
	# PushParam _tmp299
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -100($fp)	# fill _tmp299 to $t0 from $fp-100
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp300 = ".\n"
	  .data			# create string constant marked with label
	  _string21: .asciiz ".\n"
	  .text
	  la $t2, _string21	# load label
	  sw $t2, -104($fp)	# spill _tmp300 from $t2 to $fp-104
	# PushParam _tmp300
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -104($fp)	# fill _tmp300 to $t0 from $fp-104
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp301 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -108($fp)	# spill _tmp301 from $t2 to $fp-108
	# Return _tmp301
	  lw $t2, -108($fp)	# fill _tmp301 to $t2 from $fp-108
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto _L69
	  b _L69		# unconditional branch
  _L68:
  _L69:
	# _tmp302 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -112($fp)	# spill _tmp302 from $t2 to $fp-112
	# Return _tmp302
	  lw $t2, -112($fp)	# fill _tmp302 to $t2 from $fp-112
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
  _Player.TakeTurn:
	# BeginFunc 172
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 172	# decrement sp to make space for locals/temps
	# _tmp303 = "\n"
	  .data			# create string constant marked with label
	  _string22: .asciiz "\n"
	  .text
	  la $t2, _string22	# load label
	  sw $t2, -12($fp)	# spill _tmp303 from $t2 to $fp-12
	# PushParam _tmp303
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp303 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp304 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp304 from $t2 to $fp-16
	# PushParam _tmp304
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp304 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp305 = "'s turn.\n"
	  .data			# create string constant marked with label
	  _string23: .asciiz "'s turn.\n"
	  .text
	  la $t2, _string23	# load label
	  sw $t2, -20($fp)	# spill _tmp305 from $t2 to $fp-20
	# PushParam _tmp305
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -20($fp)	# fill _tmp305 to $t0 from $fp-20
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp306 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -24($fp)	# spill _tmp306 from $t2 to $fp-24
	# *(this + 4) = _tmp306
	  lw $t0, -24($fp)	# fill _tmp306 to $t0 from $fp-24
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 4($t2) 	# store with offset
	# _tmp307 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -28($fp)	# spill _tmp307 from $t2 to $fp-28
	# *(this + 8) = _tmp307
	  lw $t0, -28($fp)	# fill _tmp307 to $t0 from $fp-28
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 8($t2) 	# store with offset
	# _tmp308 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -32($fp)	# spill _tmp308 from $t2 to $fp-32
	# *(this + 12) = _tmp308
	  lw $t0, -32($fp)	# fill _tmp308 to $t0 from $fp-32
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 12($t2) 	# store with offset
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill deck to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp309 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -36($fp)	# spill _tmp309 from $t2 to $fp-36
	# _tmp310 = *(_tmp309 + 4)
	  lw $t0, -36($fp)	# fill _tmp309 to $t0 from $fp-36
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -40($fp)	# spill _tmp310 from $t2 to $fp-40
	# ACall _tmp310
	  lw $t0, -40($fp)	# fill _tmp310 to $t0 from $fp-40
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill deck to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp311 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -44($fp)	# spill _tmp311 from $t2 to $fp-44
	# _tmp312 = *(_tmp311 + 4)
	  lw $t0, -44($fp)	# fill _tmp311 to $t0 from $fp-44
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -48($fp)	# spill _tmp312 from $t2 to $fp-48
	# ACall _tmp312
	  lw $t0, -48($fp)	# fill _tmp312 to $t0 from $fp-48
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill deck to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp313 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -52($fp)	# spill _tmp313 from $t2 to $fp-52
	# _tmp314 = *(_tmp313 + 8)
	  lw $t0, -52($fp)	# fill _tmp313 to $t0 from $fp-52
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -56($fp)	# spill _tmp314 from $t2 to $fp-56
	# _tmp315 = ACall _tmp314
	  lw $t0, -56($fp)	# fill _tmp314 to $t0 from $fp-56
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -60($fp)	# spill _tmp315 from $t2 to $fp-60
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp316 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -64($fp)	# spill _tmp316 from $t2 to $fp-64
	# _tmp317 = _tmp315 == _tmp316
	  lw $t0, -60($fp)	# fill _tmp315 to $t0 from $fp-60
	  lw $t1, -64($fp)	# fill _tmp316 to $t1 from $fp-64
	  seq $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp317 from $t2 to $fp-68
	# IfZ _tmp317 Goto _L70
	  lw $t0, -68($fp)	# fill _tmp317 to $t0 from $fp-68
	  beqz $t0, _L70	# branch if _tmp317 is zero 
	# _tmp318 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -72($fp)	# spill _tmp318 from $t2 to $fp-72
	# stillGoing = _tmp318
	  lw $t2, -72($fp)	# fill _tmp318 to $t2 from $fp-72
	  sw $t2, -8($fp)	# spill stillGoing from $t2 to $fp-8
  _L72:
	# _tmp320 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -80($fp)	# spill _tmp320 from $t2 to $fp-80
	# _tmp321 = 21
	  li $t2, 21		# load constant value 21 into $t2
	  sw $t2, -84($fp)	# spill _tmp321 from $t2 to $fp-84
	# _tmp322 = _tmp321 < _tmp320
	  lw $t0, -84($fp)	# fill _tmp321 to $t0 from $fp-84
	  lw $t1, -80($fp)	# fill _tmp320 to $t1 from $fp-80
	  slt $t2, $t0, $t1	
	  sw $t2, -88($fp)	# spill _tmp322 from $t2 to $fp-88
	# _tmp323 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -92($fp)	# spill _tmp323 from $t2 to $fp-92
	# _tmp324 = _tmp323 - _tmp322
	  lw $t0, -92($fp)	# fill _tmp323 to $t0 from $fp-92
	  lw $t1, -88($fp)	# fill _tmp322 to $t1 from $fp-88
	  sub $t2, $t0, $t1	
	  sw $t2, -96($fp)	# spill _tmp324 from $t2 to $fp-96
	# IfZ _tmp324 Goto _L74
	  lw $t0, -96($fp)	# fill _tmp324 to $t0 from $fp-96
	  beqz $t0, _L74	# branch if _tmp324 is zero 
	# _tmp319 = stillGoing
	  lw $t2, -8($fp)	# fill stillGoing to $t2 from $fp-8
	  sw $t2, -76($fp)	# spill _tmp319 from $t2 to $fp-76
	# Goto _L75
	  b _L75		# unconditional branch
  _L74:
	# _tmp325 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -100($fp)	# spill _tmp325 from $t2 to $fp-100
	# _tmp319 = _tmp325
	  lw $t2, -100($fp)	# fill _tmp325 to $t2 from $fp-100
	  sw $t2, -76($fp)	# spill _tmp319 from $t2 to $fp-76
  _L75:
	# IfZ _tmp319 Goto _L73
	  lw $t0, -76($fp)	# fill _tmp319 to $t0 from $fp-76
	  beqz $t0, _L73	# branch if _tmp319 is zero 
	# _tmp326 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -104($fp)	# spill _tmp326 from $t2 to $fp-104
	# PushParam _tmp326
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -104($fp)	# fill _tmp326 to $t0 from $fp-104
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp327 = ", your total is "
	  .data			# create string constant marked with label
	  _string24: .asciiz ", your total is "
	  .text
	  la $t2, _string24	# load label
	  sw $t2, -108($fp)	# spill _tmp327 from $t2 to $fp-108
	# PushParam _tmp327
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -108($fp)	# fill _tmp327 to $t0 from $fp-108
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp328 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -112($fp)	# spill _tmp328 from $t2 to $fp-112
	# PushParam _tmp328
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -112($fp)	# fill _tmp328 to $t0 from $fp-112
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp329 = ".\n"
	  .data			# create string constant marked with label
	  _string25: .asciiz ".\n"
	  .text
	  la $t2, _string25	# load label
	  sw $t2, -116($fp)	# spill _tmp329 from $t2 to $fp-116
	# PushParam _tmp329
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -116($fp)	# fill _tmp329 to $t0 from $fp-116
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp330 = "Would you like a hit?"
	  .data			# create string constant marked with label
	  _string26: .asciiz "Would you like a hit?"
	  .text
	  la $t2, _string26	# load label
	  sw $t2, -120($fp)	# spill _tmp330 from $t2 to $fp-120
	# PushParam _tmp330
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -120($fp)	# fill _tmp330 to $t0 from $fp-120
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp331 = LCall _GetYesOrNo
	  jal _GetYesOrNo    	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -124($fp)	# spill _tmp331 from $t2 to $fp-124
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# stillGoing = _tmp331
	  lw $t2, -124($fp)	# fill _tmp331 to $t2 from $fp-124
	  sw $t2, -8($fp)	# spill stillGoing from $t2 to $fp-8
	# IfZ stillGoing Goto _L76
	  lw $t0, -8($fp)	# fill stillGoing to $t0 from $fp-8
	  beqz $t0, _L76	# branch if stillGoing is zero 
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill deck to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp332 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -128($fp)	# spill _tmp332 from $t2 to $fp-128
	# _tmp333 = *(_tmp332 + 4)
	  lw $t0, -128($fp)	# fill _tmp332 to $t0 from $fp-128
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -132($fp)	# spill _tmp333 from $t2 to $fp-132
	# ACall _tmp333
	  lw $t0, -132($fp)	# fill _tmp333 to $t0 from $fp-132
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# Goto _L77
	  b _L77		# unconditional branch
  _L76:
  _L77:
	# Goto _L72
	  b _L72		# unconditional branch
  _L73:
	# Goto _L71
	  b _L71		# unconditional branch
  _L70:
  _L71:
	# _tmp334 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -136($fp)	# spill _tmp334 from $t2 to $fp-136
	# _tmp335 = 21
	  li $t2, 21		# load constant value 21 into $t2
	  sw $t2, -140($fp)	# spill _tmp335 from $t2 to $fp-140
	# _tmp336 = _tmp335 < _tmp334
	  lw $t0, -140($fp)	# fill _tmp335 to $t0 from $fp-140
	  lw $t1, -136($fp)	# fill _tmp334 to $t1 from $fp-136
	  slt $t2, $t0, $t1	
	  sw $t2, -144($fp)	# spill _tmp336 from $t2 to $fp-144
	# IfZ _tmp336 Goto _L78
	  lw $t0, -144($fp)	# fill _tmp336 to $t0 from $fp-144
	  beqz $t0, _L78	# branch if _tmp336 is zero 
	# _tmp337 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -148($fp)	# spill _tmp337 from $t2 to $fp-148
	# PushParam _tmp337
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -148($fp)	# fill _tmp337 to $t0 from $fp-148
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp338 = " busts with the big "
	  .data			# create string constant marked with label
	  _string27: .asciiz " busts with the big "
	  .text
	  la $t2, _string27	# load label
	  sw $t2, -152($fp)	# spill _tmp338 from $t2 to $fp-152
	# PushParam _tmp338
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -152($fp)	# fill _tmp338 to $t0 from $fp-152
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp339 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -156($fp)	# spill _tmp339 from $t2 to $fp-156
	# PushParam _tmp339
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -156($fp)	# fill _tmp339 to $t0 from $fp-156
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp340 = "!\n"
	  .data			# create string constant marked with label
	  _string28: .asciiz "!\n"
	  .text
	  la $t2, _string28	# load label
	  sw $t2, -160($fp)	# spill _tmp340 from $t2 to $fp-160
	# PushParam _tmp340
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -160($fp)	# fill _tmp340 to $t0 from $fp-160
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L79
	  b _L79		# unconditional branch
  _L78:
	# _tmp341 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -164($fp)	# spill _tmp341 from $t2 to $fp-164
	# PushParam _tmp341
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -164($fp)	# fill _tmp341 to $t0 from $fp-164
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp342 = " stays at "
	  .data			# create string constant marked with label
	  _string29: .asciiz " stays at "
	  .text
	  la $t2, _string29	# load label
	  sw $t2, -168($fp)	# spill _tmp342 from $t2 to $fp-168
	# PushParam _tmp342
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -168($fp)	# fill _tmp342 to $t0 from $fp-168
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp343 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -172($fp)	# spill _tmp343 from $t2 to $fp-172
	# PushParam _tmp343
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -172($fp)	# fill _tmp343 to $t0 from $fp-172
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp344 = ".\n"
	  .data			# create string constant marked with label
	  _string30: .asciiz ".\n"
	  .text
	  la $t2, _string30	# load label
	  sw $t2, -176($fp)	# spill _tmp344 from $t2 to $fp-176
	# PushParam _tmp344
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -176($fp)	# fill _tmp344 to $t0 from $fp-176
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L79:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Player.HasMoney:
	# BeginFunc 12
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 12	# decrement sp to make space for locals/temps
	# _tmp345 = *(this + 20)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -8($fp)	# spill _tmp345 from $t2 to $fp-8
	# _tmp346 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -12($fp)	# spill _tmp346 from $t2 to $fp-12
	# _tmp347 = _tmp346 < _tmp345
	  lw $t0, -12($fp)	# fill _tmp346 to $t0 from $fp-12
	  lw $t1, -8($fp)	# fill _tmp345 to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -16($fp)	# spill _tmp347 from $t2 to $fp-16
	# Return _tmp347
	  lw $t2, -16($fp)	# fill _tmp347 to $t2 from $fp-16
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
  _Player.PrintMoney:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp348 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -8($fp)	# spill _tmp348 from $t2 to $fp-8
	# PushParam _tmp348
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill _tmp348 to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp349 = ", you have $"
	  .data			# create string constant marked with label
	  _string31: .asciiz ", you have $"
	  .text
	  la $t2, _string31	# load label
	  sw $t2, -12($fp)	# spill _tmp349 from $t2 to $fp-12
	# PushParam _tmp349
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp349 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp350 = *(this + 20)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp350 from $t2 to $fp-16
	# PushParam _tmp350
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp350 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp351 = ".\n"
	  .data			# create string constant marked with label
	  _string32: .asciiz ".\n"
	  .text
	  la $t2, _string32	# load label
	  sw $t2, -20($fp)	# spill _tmp351 from $t2 to $fp-20
	# PushParam _tmp351
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -20($fp)	# fill _tmp351 to $t0 from $fp-20
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
  _Player.PlaceBet:
	# BeginFunc 60
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 60	# decrement sp to make space for locals/temps
	# _tmp352 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -8($fp)	# spill _tmp352 from $t2 to $fp-8
	# *(this + 16) = _tmp352
	  lw $t0, -8($fp)	# fill _tmp352 to $t0 from $fp-8
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 16($t2) 	# store with offset
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp353 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp353 from $t2 to $fp-12
	# _tmp354 = *(_tmp353 + 20)
	  lw $t0, -12($fp)	# fill _tmp353 to $t0 from $fp-12
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp354 from $t2 to $fp-16
	# ACall _tmp354
	  lw $t0, -16($fp)	# fill _tmp354 to $t0 from $fp-16
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L80:
	# _tmp356 = *(this + 16)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -24($fp)	# spill _tmp356 from $t2 to $fp-24
	# _tmp357 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -28($fp)	# spill _tmp357 from $t2 to $fp-28
	# _tmp358 = _tmp357 < _tmp356
	  lw $t0, -28($fp)	# fill _tmp357 to $t0 from $fp-28
	  lw $t1, -24($fp)	# fill _tmp356 to $t1 from $fp-24
	  slt $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp358 from $t2 to $fp-32
	# _tmp359 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -36($fp)	# spill _tmp359 from $t2 to $fp-36
	# _tmp360 = _tmp359 - _tmp358
	  lw $t0, -36($fp)	# fill _tmp359 to $t0 from $fp-36
	  lw $t1, -32($fp)	# fill _tmp358 to $t1 from $fp-32
	  sub $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp360 from $t2 to $fp-40
	# IfZ _tmp360 Goto _L82
	  lw $t0, -40($fp)	# fill _tmp360 to $t0 from $fp-40
	  beqz $t0, _L82	# branch if _tmp360 is zero 
	# _tmp361 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -44($fp)	# spill _tmp361 from $t2 to $fp-44
	# _tmp355 = _tmp361
	  lw $t2, -44($fp)	# fill _tmp361 to $t2 from $fp-44
	  sw $t2, -20($fp)	# spill _tmp355 from $t2 to $fp-20
	# Goto _L83
	  b _L83		# unconditional branch
  _L82:
	# _tmp362 = *(this + 16)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -48($fp)	# spill _tmp362 from $t2 to $fp-48
	# _tmp363 = *(this + 20)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -52($fp)	# spill _tmp363 from $t2 to $fp-52
	# _tmp364 = _tmp363 < _tmp362
	  lw $t0, -52($fp)	# fill _tmp363 to $t0 from $fp-52
	  lw $t1, -48($fp)	# fill _tmp362 to $t1 from $fp-48
	  slt $t2, $t0, $t1	
	  sw $t2, -56($fp)	# spill _tmp364 from $t2 to $fp-56
	# _tmp355 = _tmp364
	  lw $t2, -56($fp)	# fill _tmp364 to $t2 from $fp-56
	  sw $t2, -20($fp)	# spill _tmp355 from $t2 to $fp-20
  _L83:
	# IfZ _tmp355 Goto _L81
	  lw $t0, -20($fp)	# fill _tmp355 to $t0 from $fp-20
	  beqz $t0, _L81	# branch if _tmp355 is zero 
	# _tmp365 = "How much would you like to bet? "
	  .data			# create string constant marked with label
	  _string33: .asciiz "How much would you like to bet? "
	  .text
	  la $t2, _string33	# load label
	  sw $t2, -60($fp)	# spill _tmp365 from $t2 to $fp-60
	# PushParam _tmp365
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -60($fp)	# fill _tmp365 to $t0 from $fp-60
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp366 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -64($fp)	# spill _tmp366 from $t2 to $fp-64
	# *(this + 16) = _tmp366
	  lw $t0, -64($fp)	# fill _tmp366 to $t0 from $fp-64
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 16($t2) 	# store with offset
	# Goto _L80
	  b _L80		# unconditional branch
  _L81:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Player.GetTotal:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp367 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -8($fp)	# spill _tmp367 from $t2 to $fp-8
	# Return _tmp367
	  lw $t2, -8($fp)	# fill _tmp367 to $t2 from $fp-8
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
  _Player.Resolve:
	# BeginFunc 204
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 204	# decrement sp to make space for locals/temps
	# _tmp368 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -16($fp)	# spill _tmp368 from $t2 to $fp-16
	# win = _tmp368
	  lw $t2, -16($fp)	# fill _tmp368 to $t2 from $fp-16
	  sw $t2, -8($fp)	# spill win from $t2 to $fp-8
	# _tmp369 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -20($fp)	# spill _tmp369 from $t2 to $fp-20
	# lose = _tmp369
	  lw $t2, -20($fp)	# fill _tmp369 to $t2 from $fp-20
	  sw $t2, -12($fp)	# spill lose from $t2 to $fp-12
	# _tmp371 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -28($fp)	# spill _tmp371 from $t2 to $fp-28
	# _tmp372 = 21
	  li $t2, 21		# load constant value 21 into $t2
	  sw $t2, -32($fp)	# spill _tmp372 from $t2 to $fp-32
	# _tmp373 = _tmp371 == _tmp372
	  lw $t0, -28($fp)	# fill _tmp371 to $t0 from $fp-28
	  lw $t1, -32($fp)	# fill _tmp372 to $t1 from $fp-32
	  seq $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp373 from $t2 to $fp-36
	# IfZ _tmp373 Goto _L84
	  lw $t0, -36($fp)	# fill _tmp373 to $t0 from $fp-36
	  beqz $t0, _L84	# branch if _tmp373 is zero 
	# _tmp374 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -40($fp)	# spill _tmp374 from $t2 to $fp-40
	# _tmp375 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -44($fp)	# spill _tmp375 from $t2 to $fp-44
	# _tmp376 = _tmp374 == _tmp375
	  lw $t0, -40($fp)	# fill _tmp374 to $t0 from $fp-40
	  lw $t1, -44($fp)	# fill _tmp375 to $t1 from $fp-44
	  seq $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp376 from $t2 to $fp-48
	# _tmp370 = _tmp376
	  lw $t2, -48($fp)	# fill _tmp376 to $t2 from $fp-48
	  sw $t2, -24($fp)	# spill _tmp370 from $t2 to $fp-24
	# Goto _L85
	  b _L85		# unconditional branch
  _L84:
	# _tmp377 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -52($fp)	# spill _tmp377 from $t2 to $fp-52
	# _tmp370 = _tmp377
	  lw $t2, -52($fp)	# fill _tmp377 to $t2 from $fp-52
	  sw $t2, -24($fp)	# spill _tmp370 from $t2 to $fp-24
  _L85:
	# IfZ _tmp370 Goto _L86
	  lw $t0, -24($fp)	# fill _tmp370 to $t0 from $fp-24
	  beqz $t0, _L86	# branch if _tmp370 is zero 
	# _tmp378 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -56($fp)	# spill _tmp378 from $t2 to $fp-56
	# win = _tmp378
	  lw $t2, -56($fp)	# fill _tmp378 to $t2 from $fp-56
	  sw $t2, -8($fp)	# spill win from $t2 to $fp-8
	# Goto _L87
	  b _L87		# unconditional branch
  _L86:
	# _tmp379 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -60($fp)	# spill _tmp379 from $t2 to $fp-60
	# _tmp380 = 21
	  li $t2, 21		# load constant value 21 into $t2
	  sw $t2, -64($fp)	# spill _tmp380 from $t2 to $fp-64
	# _tmp381 = _tmp380 < _tmp379
	  lw $t0, -64($fp)	# fill _tmp380 to $t0 from $fp-64
	  lw $t1, -60($fp)	# fill _tmp379 to $t1 from $fp-60
	  slt $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp381 from $t2 to $fp-68
	# IfZ _tmp381 Goto _L88
	  lw $t0, -68($fp)	# fill _tmp381 to $t0 from $fp-68
	  beqz $t0, _L88	# branch if _tmp381 is zero 
	# _tmp382 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -72($fp)	# spill _tmp382 from $t2 to $fp-72
	# lose = _tmp382
	  lw $t2, -72($fp)	# fill _tmp382 to $t2 from $fp-72
	  sw $t2, -12($fp)	# spill lose from $t2 to $fp-12
	# Goto _L89
	  b _L89		# unconditional branch
  _L88:
	# _tmp383 = 21
	  li $t2, 21		# load constant value 21 into $t2
	  sw $t2, -76($fp)	# spill _tmp383 from $t2 to $fp-76
	# _tmp384 = _tmp383 < dealer
	  lw $t0, -76($fp)	# fill _tmp383 to $t0 from $fp-76
	  lw $t1, 8($fp)	# fill dealer to $t1 from $fp+8
	  slt $t2, $t0, $t1	
	  sw $t2, -80($fp)	# spill _tmp384 from $t2 to $fp-80
	# IfZ _tmp384 Goto _L90
	  lw $t0, -80($fp)	# fill _tmp384 to $t0 from $fp-80
	  beqz $t0, _L90	# branch if _tmp384 is zero 
	# _tmp385 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -84($fp)	# spill _tmp385 from $t2 to $fp-84
	# win = _tmp385
	  lw $t2, -84($fp)	# fill _tmp385 to $t2 from $fp-84
	  sw $t2, -8($fp)	# spill win from $t2 to $fp-8
	# Goto _L91
	  b _L91		# unconditional branch
  _L90:
	# _tmp386 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -88($fp)	# spill _tmp386 from $t2 to $fp-88
	# _tmp387 = dealer < _tmp386
	  lw $t0, 8($fp)	# fill dealer to $t0 from $fp+8
	  lw $t1, -88($fp)	# fill _tmp386 to $t1 from $fp-88
	  slt $t2, $t0, $t1	
	  sw $t2, -92($fp)	# spill _tmp387 from $t2 to $fp-92
	# IfZ _tmp387 Goto _L92
	  lw $t0, -92($fp)	# fill _tmp387 to $t0 from $fp-92
	  beqz $t0, _L92	# branch if _tmp387 is zero 
	# _tmp388 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -96($fp)	# spill _tmp388 from $t2 to $fp-96
	# win = _tmp388
	  lw $t2, -96($fp)	# fill _tmp388 to $t2 from $fp-96
	  sw $t2, -8($fp)	# spill win from $t2 to $fp-8
	# Goto _L93
	  b _L93		# unconditional branch
  _L92:
	# _tmp389 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -100($fp)	# spill _tmp389 from $t2 to $fp-100
	# _tmp390 = _tmp389 < dealer
	  lw $t0, -100($fp)	# fill _tmp389 to $t0 from $fp-100
	  lw $t1, 8($fp)	# fill dealer to $t1 from $fp+8
	  slt $t2, $t0, $t1	
	  sw $t2, -104($fp)	# spill _tmp390 from $t2 to $fp-104
	# IfZ _tmp390 Goto _L94
	  lw $t0, -104($fp)	# fill _tmp390 to $t0 from $fp-104
	  beqz $t0, _L94	# branch if _tmp390 is zero 
	# _tmp391 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -108($fp)	# spill _tmp391 from $t2 to $fp-108
	# lose = _tmp391
	  lw $t2, -108($fp)	# fill _tmp391 to $t2 from $fp-108
	  sw $t2, -12($fp)	# spill lose from $t2 to $fp-12
	# Goto _L95
	  b _L95		# unconditional branch
  _L94:
  _L95:
  _L93:
  _L91:
  _L89:
  _L87:
	# _tmp392 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -112($fp)	# spill _tmp392 from $t2 to $fp-112
	# _tmp393 = win < _tmp392
	  lw $t0, -8($fp)	# fill win to $t0 from $fp-8
	  lw $t1, -112($fp)	# fill _tmp392 to $t1 from $fp-112
	  slt $t2, $t0, $t1	
	  sw $t2, -116($fp)	# spill _tmp393 from $t2 to $fp-116
	# _tmp394 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -120($fp)	# spill _tmp394 from $t2 to $fp-120
	# _tmp395 = _tmp394 - _tmp393
	  lw $t0, -120($fp)	# fill _tmp394 to $t0 from $fp-120
	  lw $t1, -116($fp)	# fill _tmp393 to $t1 from $fp-116
	  sub $t2, $t0, $t1	
	  sw $t2, -124($fp)	# spill _tmp395 from $t2 to $fp-124
	# IfZ _tmp395 Goto _L96
	  lw $t0, -124($fp)	# fill _tmp395 to $t0 from $fp-124
	  beqz $t0, _L96	# branch if _tmp395 is zero 
	# _tmp396 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -128($fp)	# spill _tmp396 from $t2 to $fp-128
	# PushParam _tmp396
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -128($fp)	# fill _tmp396 to $t0 from $fp-128
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp397 = ", you won $"
	  .data			# create string constant marked with label
	  _string34: .asciiz ", you won $"
	  .text
	  la $t2, _string34	# load label
	  sw $t2, -132($fp)	# spill _tmp397 from $t2 to $fp-132
	# PushParam _tmp397
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -132($fp)	# fill _tmp397 to $t0 from $fp-132
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp398 = *(this + 16)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -136($fp)	# spill _tmp398 from $t2 to $fp-136
	# PushParam _tmp398
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -136($fp)	# fill _tmp398 to $t0 from $fp-136
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp399 = ".\n"
	  .data			# create string constant marked with label
	  _string35: .asciiz ".\n"
	  .text
	  la $t2, _string35	# load label
	  sw $t2, -140($fp)	# spill _tmp399 from $t2 to $fp-140
	# PushParam _tmp399
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -140($fp)	# fill _tmp399 to $t0 from $fp-140
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L97
	  b _L97		# unconditional branch
  _L96:
	# _tmp400 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -144($fp)	# spill _tmp400 from $t2 to $fp-144
	# _tmp401 = lose < _tmp400
	  lw $t0, -12($fp)	# fill lose to $t0 from $fp-12
	  lw $t1, -144($fp)	# fill _tmp400 to $t1 from $fp-144
	  slt $t2, $t0, $t1	
	  sw $t2, -148($fp)	# spill _tmp401 from $t2 to $fp-148
	# _tmp402 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -152($fp)	# spill _tmp402 from $t2 to $fp-152
	# _tmp403 = _tmp402 - _tmp401
	  lw $t0, -152($fp)	# fill _tmp402 to $t0 from $fp-152
	  lw $t1, -148($fp)	# fill _tmp401 to $t1 from $fp-148
	  sub $t2, $t0, $t1	
	  sw $t2, -156($fp)	# spill _tmp403 from $t2 to $fp-156
	# IfZ _tmp403 Goto _L98
	  lw $t0, -156($fp)	# fill _tmp403 to $t0 from $fp-156
	  beqz $t0, _L98	# branch if _tmp403 is zero 
	# _tmp404 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -160($fp)	# spill _tmp404 from $t2 to $fp-160
	# PushParam _tmp404
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -160($fp)	# fill _tmp404 to $t0 from $fp-160
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp405 = ", you lost $"
	  .data			# create string constant marked with label
	  _string36: .asciiz ", you lost $"
	  .text
	  la $t2, _string36	# load label
	  sw $t2, -164($fp)	# spill _tmp405 from $t2 to $fp-164
	# PushParam _tmp405
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -164($fp)	# fill _tmp405 to $t0 from $fp-164
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp406 = *(this + 16)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -168($fp)	# spill _tmp406 from $t2 to $fp-168
	# PushParam _tmp406
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -168($fp)	# fill _tmp406 to $t0 from $fp-168
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp407 = ".\n"
	  .data			# create string constant marked with label
	  _string37: .asciiz ".\n"
	  .text
	  la $t2, _string37	# load label
	  sw $t2, -172($fp)	# spill _tmp407 from $t2 to $fp-172
	# PushParam _tmp407
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -172($fp)	# fill _tmp407 to $t0 from $fp-172
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L99
	  b _L99		# unconditional branch
  _L98:
	# _tmp408 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -176($fp)	# spill _tmp408 from $t2 to $fp-176
	# PushParam _tmp408
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -176($fp)	# fill _tmp408 to $t0 from $fp-176
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp409 = ", you push!\n"
	  .data			# create string constant marked with label
	  _string38: .asciiz ", you push!\n"
	  .text
	  la $t2, _string38	# load label
	  sw $t2, -180($fp)	# spill _tmp409 from $t2 to $fp-180
	# PushParam _tmp409
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -180($fp)	# fill _tmp409 to $t0 from $fp-180
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L99:
  _L97:
	# _tmp410 = *(this + 16)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -184($fp)	# spill _tmp410 from $t2 to $fp-184
	# _tmp411 = win * _tmp410
	  lw $t0, -8($fp)	# fill win to $t0 from $fp-8
	  lw $t1, -184($fp)	# fill _tmp410 to $t1 from $fp-184
	  mul $t2, $t0, $t1	
	  sw $t2, -188($fp)	# spill _tmp411 from $t2 to $fp-188
	# win = _tmp411
	  lw $t2, -188($fp)	# fill _tmp411 to $t2 from $fp-188
	  sw $t2, -8($fp)	# spill win from $t2 to $fp-8
	# _tmp412 = *(this + 16)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -192($fp)	# spill _tmp412 from $t2 to $fp-192
	# _tmp413 = lose * _tmp412
	  lw $t0, -12($fp)	# fill lose to $t0 from $fp-12
	  lw $t1, -192($fp)	# fill _tmp412 to $t1 from $fp-192
	  mul $t2, $t0, $t1	
	  sw $t2, -196($fp)	# spill _tmp413 from $t2 to $fp-196
	# lose = _tmp413
	  lw $t2, -196($fp)	# fill _tmp413 to $t2 from $fp-196
	  sw $t2, -12($fp)	# spill lose from $t2 to $fp-12
	# _tmp414 = *(this + 20)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -200($fp)	# spill _tmp414 from $t2 to $fp-200
	# _tmp415 = _tmp414 + win
	  lw $t0, -200($fp)	# fill _tmp414 to $t0 from $fp-200
	  lw $t1, -8($fp)	# fill win to $t1 from $fp-8
	  add $t2, $t0, $t1	
	  sw $t2, -204($fp)	# spill _tmp415 from $t2 to $fp-204
	# _tmp416 = _tmp415 - lose
	  lw $t0, -204($fp)	# fill _tmp415 to $t0 from $fp-204
	  lw $t1, -12($fp)	# fill lose to $t1 from $fp-12
	  sub $t2, $t0, $t1	
	  sw $t2, -208($fp)	# spill _tmp416 from $t2 to $fp-208
	# *(this + 20) = _tmp416
	  lw $t0, -208($fp)	# fill _tmp416 to $t0 from $fp-208
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 20($t2) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class Dealer
	  .data
	  .align 2
	  Dealer:		# label for class Dealer vtable
	  .word _Dealer.Init
	  .word _Player.Hit
	  .word _Player.DoubleDown
	  .word _Dealer.TakeTurn
	  .word _Player.HasMoney
	  .word _Player.PrintMoney
	  .word _Player.PlaceBet
	  .word _Player.GetTotal
	  .word _Player.Resolve
	  .text
  _Dealer.Init:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp417 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -8($fp)	# spill _tmp417 from $t2 to $fp-8
	# *(this + 4) = _tmp417
	  lw $t0, -8($fp)	# fill _tmp417 to $t0 from $fp-8
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 4($t2) 	# store with offset
	# _tmp418 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -12($fp)	# spill _tmp418 from $t2 to $fp-12
	# *(this + 8) = _tmp418
	  lw $t0, -12($fp)	# fill _tmp418 to $t0 from $fp-12
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 8($t2) 	# store with offset
	# _tmp419 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -16($fp)	# spill _tmp419 from $t2 to $fp-16
	# *(this + 12) = _tmp419
	  lw $t0, -16($fp)	# fill _tmp419 to $t0 from $fp-16
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 12($t2) 	# store with offset
	# _tmp420 = "Dealer"
	  .data			# create string constant marked with label
	  _string39: .asciiz "Dealer"
	  .text
	  la $t2, _string39	# load label
	  sw $t2, -20($fp)	# spill _tmp420 from $t2 to $fp-20
	# *(this + 24) = _tmp420
	  lw $t0, -20($fp)	# fill _tmp420 to $t0 from $fp-20
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 24($t2) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _Dealer.TakeTurn:
	# BeginFunc 84
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 84	# decrement sp to make space for locals/temps
	# _tmp421 = "\n"
	  .data			# create string constant marked with label
	  _string40: .asciiz "\n"
	  .text
	  la $t2, _string40	# load label
	  sw $t2, -8($fp)	# spill _tmp421 from $t2 to $fp-8
	# PushParam _tmp421
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill _tmp421 to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp422 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp422 from $t2 to $fp-12
	# PushParam _tmp422
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp422 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp423 = "'s turn.\n"
	  .data			# create string constant marked with label
	  _string41: .asciiz "'s turn.\n"
	  .text
	  la $t2, _string41	# load label
	  sw $t2, -16($fp)	# spill _tmp423 from $t2 to $fp-16
	# PushParam _tmp423
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp423 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L100:
	# _tmp424 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -20($fp)	# spill _tmp424 from $t2 to $fp-20
	# _tmp425 = 16
	  li $t2, 16		# load constant value 16 into $t2
	  sw $t2, -24($fp)	# spill _tmp425 from $t2 to $fp-24
	# _tmp426 = _tmp425 < _tmp424
	  lw $t0, -24($fp)	# fill _tmp425 to $t0 from $fp-24
	  lw $t1, -20($fp)	# fill _tmp424 to $t1 from $fp-20
	  slt $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp426 from $t2 to $fp-28
	# _tmp427 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -32($fp)	# spill _tmp427 from $t2 to $fp-32
	# _tmp428 = _tmp427 - _tmp426
	  lw $t0, -32($fp)	# fill _tmp427 to $t0 from $fp-32
	  lw $t1, -28($fp)	# fill _tmp426 to $t1 from $fp-28
	  sub $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp428 from $t2 to $fp-36
	# IfZ _tmp428 Goto _L101
	  lw $t0, -36($fp)	# fill _tmp428 to $t0 from $fp-36
	  beqz $t0, _L101	# branch if _tmp428 is zero 
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill deck to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp429 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -40($fp)	# spill _tmp429 from $t2 to $fp-40
	# _tmp430 = *(_tmp429 + 4)
	  lw $t0, -40($fp)	# fill _tmp429 to $t0 from $fp-40
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -44($fp)	# spill _tmp430 from $t2 to $fp-44
	# ACall _tmp430
	  lw $t0, -44($fp)	# fill _tmp430 to $t0 from $fp-44
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# Goto _L100
	  b _L100		# unconditional branch
  _L101:
	# _tmp431 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -48($fp)	# spill _tmp431 from $t2 to $fp-48
	# _tmp432 = 21
	  li $t2, 21		# load constant value 21 into $t2
	  sw $t2, -52($fp)	# spill _tmp432 from $t2 to $fp-52
	# _tmp433 = _tmp432 < _tmp431
	  lw $t0, -52($fp)	# fill _tmp432 to $t0 from $fp-52
	  lw $t1, -48($fp)	# fill _tmp431 to $t1 from $fp-48
	  slt $t2, $t0, $t1	
	  sw $t2, -56($fp)	# spill _tmp433 from $t2 to $fp-56
	# IfZ _tmp433 Goto _L102
	  lw $t0, -56($fp)	# fill _tmp433 to $t0 from $fp-56
	  beqz $t0, _L102	# branch if _tmp433 is zero 
	# _tmp434 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -60($fp)	# spill _tmp434 from $t2 to $fp-60
	# PushParam _tmp434
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -60($fp)	# fill _tmp434 to $t0 from $fp-60
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp435 = " busts with the big "
	  .data			# create string constant marked with label
	  _string42: .asciiz " busts with the big "
	  .text
	  la $t2, _string42	# load label
	  sw $t2, -64($fp)	# spill _tmp435 from $t2 to $fp-64
	# PushParam _tmp435
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -64($fp)	# fill _tmp435 to $t0 from $fp-64
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp436 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -68($fp)	# spill _tmp436 from $t2 to $fp-68
	# PushParam _tmp436
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -68($fp)	# fill _tmp436 to $t0 from $fp-68
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp437 = "!\n"
	  .data			# create string constant marked with label
	  _string43: .asciiz "!\n"
	  .text
	  la $t2, _string43	# load label
	  sw $t2, -72($fp)	# spill _tmp437 from $t2 to $fp-72
	# PushParam _tmp437
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -72($fp)	# fill _tmp437 to $t0 from $fp-72
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L103
	  b _L103		# unconditional branch
  _L102:
	# _tmp438 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -76($fp)	# spill _tmp438 from $t2 to $fp-76
	# PushParam _tmp438
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -76($fp)	# fill _tmp438 to $t0 from $fp-76
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp439 = " stays at "
	  .data			# create string constant marked with label
	  _string44: .asciiz " stays at "
	  .text
	  la $t2, _string44	# load label
	  sw $t2, -80($fp)	# spill _tmp439 from $t2 to $fp-80
	# PushParam _tmp439
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -80($fp)	# fill _tmp439 to $t0 from $fp-80
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp440 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -84($fp)	# spill _tmp440 from $t2 to $fp-84
	# PushParam _tmp440
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -84($fp)	# fill _tmp440 to $t0 from $fp-84
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp441 = ".\n"
	  .data			# create string constant marked with label
	  _string45: .asciiz ".\n"
	  .text
	  la $t2, _string45	# load label
	  sw $t2, -88($fp)	# spill _tmp441 from $t2 to $fp-88
	# PushParam _tmp441
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -88($fp)	# fill _tmp441 to $t0 from $fp-88
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L103:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class House
	  .data
	  .align 2
	  House:		# label for class House vtable
	  .word _House.SetupGame
	  .word _House.SetupPlayers
	  .word _House.TakeAllBets
	  .word _House.TakeAllTurns
	  .word _House.ResolveAllPlayers
	  .word _House.PrintAllMoney
	  .word _House.PlayOneGame
	  .text
  _House.SetupGame:
	# BeginFunc 84
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 84	# decrement sp to make space for locals/temps
	# _tmp442 = "\nWelcome to CS143 BlackJack!\n"
	  .data			# create string constant marked with label
	  _string46: .asciiz "\nWelcome to CS143 BlackJack!\n"
	  .text
	  la $t2, _string46	# load label
	  sw $t2, -8($fp)	# spill _tmp442 from $t2 to $fp-8
	# PushParam _tmp442
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill _tmp442 to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp443 = "---------------------------\n"
	  .data			# create string constant marked with label
	  _string47: .asciiz "---------------------------\n"
	  .text
	  la $t2, _string47	# load label
	  sw $t2, -12($fp)	# spill _tmp443 from $t2 to $fp-12
	# PushParam _tmp443
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp443 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp444 = 8
	  li $t2, 8		# load constant value 8 into $t2
	  sw $t2, -16($fp)	# spill _tmp444 from $t2 to $fp-16
	# PushParam _tmp444
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp444 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp445 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -20($fp)	# spill _tmp445 from $t2 to $fp-20
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp446 = Random
	  la $t2, Random	# load label
	  sw $t2, -24($fp)	# spill _tmp446 from $t2 to $fp-24
	# *(_tmp445) = _tmp446
	  lw $t0, -24($fp)	# fill _tmp446 to $t0 from $fp-24
	  lw $t2, -20($fp)	# fill _tmp445 to $t2 from $fp-20
	  sw $t0, 0($t2) 	# store with offset
	# gRnd = _tmp445
	  lw $t2, -20($fp)	# fill _tmp445 to $t2 from $fp-20
	  sw $t2, 0($gp)	# spill gRnd from $t2 to $gp+0
	# _tmp447 = "Please enter a random number seed: "
	  .data			# create string constant marked with label
	  _string48: .asciiz "Please enter a random number seed: "
	  .text
	  la $t2, _string48	# load label
	  sw $t2, -28($fp)	# spill _tmp447 from $t2 to $fp-28
	# PushParam _tmp447
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -28($fp)	# fill _tmp447 to $t0 from $fp-28
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp448 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -32($fp)	# spill _tmp448 from $t2 to $fp-32
	# PushParam _tmp448
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp448 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam gRnd
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 0($gp)	# fill gRnd to $t0 from $gp+0
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp449 = *(gRnd)
	  lw $t0, 0($gp)	# fill gRnd to $t0 from $gp+0
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -36($fp)	# spill _tmp449 from $t2 to $fp-36
	# _tmp450 = *(_tmp449)
	  lw $t0, -36($fp)	# fill _tmp449 to $t0 from $fp-36
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -40($fp)	# spill _tmp450 from $t2 to $fp-40
	# ACall _tmp450
	  lw $t0, -40($fp)	# fill _tmp450 to $t0 from $fp-40
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp451 = 12
	  li $t2, 12		# load constant value 12 into $t2
	  sw $t2, -44($fp)	# spill _tmp451 from $t2 to $fp-44
	# PushParam _tmp451
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -44($fp)	# fill _tmp451 to $t0 from $fp-44
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp452 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -48($fp)	# spill _tmp452 from $t2 to $fp-48
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp453 = BJDeck
	  la $t2, BJDeck	# load label
	  sw $t2, -52($fp)	# spill _tmp453 from $t2 to $fp-52
	# *(_tmp452) = _tmp453
	  lw $t0, -52($fp)	# fill _tmp453 to $t0 from $fp-52
	  lw $t2, -48($fp)	# fill _tmp452 to $t2 from $fp-48
	  sw $t0, 0($t2) 	# store with offset
	# *(this + 12) = _tmp452
	  lw $t0, -48($fp)	# fill _tmp452 to $t0 from $fp-48
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 12($t2) 	# store with offset
	# _tmp454 = 28
	  li $t2, 28		# load constant value 28 into $t2
	  sw $t2, -56($fp)	# spill _tmp454 from $t2 to $fp-56
	# PushParam _tmp454
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -56($fp)	# fill _tmp454 to $t0 from $fp-56
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp455 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -60($fp)	# spill _tmp455 from $t2 to $fp-60
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp456 = Dealer
	  la $t2, Dealer	# load label
	  sw $t2, -64($fp)	# spill _tmp456 from $t2 to $fp-64
	# *(_tmp455) = _tmp456
	  lw $t0, -64($fp)	# fill _tmp456 to $t0 from $fp-64
	  lw $t2, -60($fp)	# fill _tmp455 to $t2 from $fp-60
	  sw $t0, 0($t2) 	# store with offset
	# *(this + 8) = _tmp455
	  lw $t0, -60($fp)	# fill _tmp455 to $t0 from $fp-60
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 8($t2) 	# store with offset
	# _tmp457 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -68($fp)	# spill _tmp457 from $t2 to $fp-68
	# PushParam _tmp457
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -68($fp)	# fill _tmp457 to $t0 from $fp-68
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp458 = *(_tmp457)
	  lw $t0, -68($fp)	# fill _tmp457 to $t0 from $fp-68
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -72($fp)	# spill _tmp458 from $t2 to $fp-72
	# _tmp459 = *(_tmp458)
	  lw $t0, -72($fp)	# fill _tmp458 to $t0 from $fp-72
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -76($fp)	# spill _tmp459 from $t2 to $fp-76
	# ACall _tmp459
	  lw $t0, -76($fp)	# fill _tmp459 to $t0 from $fp-76
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp460 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -80($fp)	# spill _tmp460 from $t2 to $fp-80
	# PushParam _tmp460
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -80($fp)	# fill _tmp460 to $t0 from $fp-80
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp461 = *(_tmp460)
	  lw $t0, -80($fp)	# fill _tmp460 to $t0 from $fp-80
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -84($fp)	# spill _tmp461 from $t2 to $fp-84
	# _tmp462 = *(_tmp461 + 8)
	  lw $t0, -84($fp)	# fill _tmp461 to $t0 from $fp-84
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -88($fp)	# spill _tmp462 from $t2 to $fp-88
	# ACall _tmp462
	  lw $t0, -88($fp)	# fill _tmp462 to $t0 from $fp-88
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _House.SetupPlayers:
	# BeginFunc 200
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 200	# decrement sp to make space for locals/temps
	# _tmp463 = "How many players do we have today? "
	  .data			# create string constant marked with label
	  _string49: .asciiz "How many players do we have today? "
	  .text
	  la $t2, _string49	# load label
	  sw $t2, -16($fp)	# spill _tmp463 from $t2 to $fp-16
	# PushParam _tmp463
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp463 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp464 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -20($fp)	# spill _tmp464 from $t2 to $fp-20
	# numPlayers = _tmp464
	  lw $t2, -20($fp)	# fill _tmp464 to $t2 from $fp-20
	  sw $t2, -12($fp)	# spill numPlayers from $t2 to $fp-12
	# _tmp465 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -24($fp)	# spill _tmp465 from $t2 to $fp-24
	# _tmp466 = numPlayers < _tmp465
	  lw $t0, -12($fp)	# fill numPlayers to $t0 from $fp-12
	  lw $t1, -24($fp)	# fill _tmp465 to $t1 from $fp-24
	  slt $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp466 from $t2 to $fp-28
	# IfZ _tmp466 Goto _L104
	  lw $t0, -28($fp)	# fill _tmp466 to $t0 from $fp-28
	  beqz $t0, _L104	# branch if _tmp466 is zero 
	# _tmp467 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string50: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t2, _string50	# load label
	  sw $t2, -32($fp)	# spill _tmp467 from $t2 to $fp-32
	# PushParam _tmp467
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp467 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L104:
	# _tmp468 = numPlayers == _tmp465
	  lw $t0, -12($fp)	# fill numPlayers to $t0 from $fp-12
	  lw $t1, -24($fp)	# fill _tmp465 to $t1 from $fp-24
	  seq $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp468 from $t2 to $fp-36
	# IfZ _tmp468 Goto _L105
	  lw $t0, -36($fp)	# fill _tmp468 to $t0 from $fp-36
	  beqz $t0, _L105	# branch if _tmp468 is zero 
	# PushParam _tmp467
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp467 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L105:
	# _tmp469 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -40($fp)	# spill _tmp469 from $t2 to $fp-40
	# _tmp470 = numPlayers + _tmp469
	  lw $t0, -12($fp)	# fill numPlayers to $t0 from $fp-12
	  lw $t1, -40($fp)	# fill _tmp469 to $t1 from $fp-40
	  add $t2, $t0, $t1	
	  sw $t2, -44($fp)	# spill _tmp470 from $t2 to $fp-44
	# _tmp471 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -48($fp)	# spill _tmp471 from $t2 to $fp-48
	# _tmp472 = _tmp470 * _tmp471
	  lw $t0, -44($fp)	# fill _tmp470 to $t0 from $fp-44
	  lw $t1, -48($fp)	# fill _tmp471 to $t1 from $fp-48
	  mul $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp472 from $t2 to $fp-52
	# PushParam _tmp472
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -52($fp)	# fill _tmp472 to $t0 from $fp-52
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp473 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -56($fp)	# spill _tmp473 from $t2 to $fp-56
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp473) = numPlayers
	  lw $t0, -12($fp)	# fill numPlayers to $t0 from $fp-12
	  lw $t2, -56($fp)	# fill _tmp473 to $t2 from $fp-56
	  sw $t0, 0($t2) 	# store with offset
	# *(this + 4) = _tmp473
	  lw $t0, -56($fp)	# fill _tmp473 to $t0 from $fp-56
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  sw $t0, 4($t2) 	# store with offset
	# _tmp474 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -60($fp)	# spill _tmp474 from $t2 to $fp-60
	# i = _tmp474
	  lw $t2, -60($fp)	# fill _tmp474 to $t2 from $fp-60
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  _L106:
	# _tmp475 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -64($fp)	# spill _tmp475 from $t2 to $fp-64
	# _tmp476 = *(_tmp475)
	  lw $t0, -64($fp)	# fill _tmp475 to $t0 from $fp-64
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -68($fp)	# spill _tmp476 from $t2 to $fp-68
	# _tmp477 = i < _tmp476
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -68($fp)	# fill _tmp476 to $t1 from $fp-68
	  slt $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp477 from $t2 to $fp-72
	# IfZ _tmp477 Goto _L107
	  lw $t0, -72($fp)	# fill _tmp477 to $t0 from $fp-72
	  beqz $t0, _L107	# branch if _tmp477 is zero 
	# _tmp478 = 28
	  li $t2, 28		# load constant value 28 into $t2
	  sw $t2, -76($fp)	# spill _tmp478 from $t2 to $fp-76
	# PushParam _tmp478
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -76($fp)	# fill _tmp478 to $t0 from $fp-76
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp479 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -80($fp)	# spill _tmp479 from $t2 to $fp-80
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp480 = Player
	  la $t2, Player	# load label
	  sw $t2, -84($fp)	# spill _tmp480 from $t2 to $fp-84
	# *(_tmp479) = _tmp480
	  lw $t0, -84($fp)	# fill _tmp480 to $t0 from $fp-84
	  lw $t2, -80($fp)	# fill _tmp479 to $t2 from $fp-80
	  sw $t0, 0($t2) 	# store with offset
	# _tmp481 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -88($fp)	# spill _tmp481 from $t2 to $fp-88
	# _tmp482 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string51: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string51	# load label
	  sw $t2, -92($fp)	# spill _tmp482 from $t2 to $fp-92
	# _tmp483 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -96($fp)	# spill _tmp483 from $t2 to $fp-96
	# _tmp484 = i < _tmp483
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -96($fp)	# fill _tmp483 to $t1 from $fp-96
	  slt $t2, $t0, $t1	
	  sw $t2, -100($fp)	# spill _tmp484 from $t2 to $fp-100
	# IfZ _tmp484 Goto _L108
	  lw $t0, -100($fp)	# fill _tmp484 to $t0 from $fp-100
	  beqz $t0, _L108	# branch if _tmp484 is zero 
	# PushParam _tmp482
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -92($fp)	# fill _tmp482 to $t0 from $fp-92
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L108:
	# _tmp485 = *(_tmp481)
	  lw $t0, -88($fp)	# fill _tmp481 to $t0 from $fp-88
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -104($fp)	# spill _tmp485 from $t2 to $fp-104
	# _tmp486 = i < _tmp485
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -104($fp)	# fill _tmp485 to $t1 from $fp-104
	  slt $t2, $t0, $t1	
	  sw $t2, -108($fp)	# spill _tmp486 from $t2 to $fp-108
	# IfZ _tmp486 Goto _L110
	  lw $t0, -108($fp)	# fill _tmp486 to $t0 from $fp-108
	  beqz $t0, _L110	# branch if _tmp486 is zero 
	# Goto _L109
	  b _L109		# unconditional branch
  _L110:
	# PushParam _tmp482
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -92($fp)	# fill _tmp482 to $t0 from $fp-92
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L109:
	# _tmp487 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -112($fp)	# spill _tmp487 from $t2 to $fp-112
	# _tmp488 = i + _tmp487
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -112($fp)	# fill _tmp487 to $t1 from $fp-112
	  add $t2, $t0, $t1	
	  sw $t2, -116($fp)	# spill _tmp488 from $t2 to $fp-116
	# _tmp489 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -120($fp)	# spill _tmp489 from $t2 to $fp-120
	# _tmp490 = _tmp488 * _tmp489
	  lw $t0, -116($fp)	# fill _tmp488 to $t0 from $fp-116
	  lw $t1, -120($fp)	# fill _tmp489 to $t1 from $fp-120
	  mul $t2, $t0, $t1	
	  sw $t2, -124($fp)	# spill _tmp490 from $t2 to $fp-124
	# _tmp491 = _tmp481 + _tmp490
	  lw $t0, -88($fp)	# fill _tmp481 to $t0 from $fp-88
	  lw $t1, -124($fp)	# fill _tmp490 to $t1 from $fp-124
	  add $t2, $t0, $t1	
	  sw $t2, -128($fp)	# spill _tmp491 from $t2 to $fp-128
	# *(_tmp491) = _tmp479
	  lw $t0, -80($fp)	# fill _tmp479 to $t0 from $fp-80
	  lw $t2, -128($fp)	# fill _tmp491 to $t2 from $fp-128
	  sw $t0, 0($t2) 	# store with offset
	# _tmp492 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -132($fp)	# spill _tmp492 from $t2 to $fp-132
	# _tmp493 = i + _tmp492
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -132($fp)	# fill _tmp492 to $t1 from $fp-132
	  add $t2, $t0, $t1	
	  sw $t2, -136($fp)	# spill _tmp493 from $t2 to $fp-136
	# PushParam _tmp493
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -136($fp)	# fill _tmp493 to $t0 from $fp-136
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp494 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -140($fp)	# spill _tmp494 from $t2 to $fp-140
	# _tmp495 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string52: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string52	# load label
	  sw $t2, -144($fp)	# spill _tmp495 from $t2 to $fp-144
	# _tmp496 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -148($fp)	# spill _tmp496 from $t2 to $fp-148
	# _tmp497 = _tmp494 == _tmp496
	  lw $t0, -140($fp)	# fill _tmp494 to $t0 from $fp-140
	  lw $t1, -148($fp)	# fill _tmp496 to $t1 from $fp-148
	  seq $t2, $t0, $t1	
	  sw $t2, -152($fp)	# spill _tmp497 from $t2 to $fp-152
	# IfZ _tmp497 Goto _L111
	  lw $t0, -152($fp)	# fill _tmp497 to $t0 from $fp-152
	  beqz $t0, _L111	# branch if _tmp497 is zero 
	# PushParam _tmp495
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -144($fp)	# fill _tmp495 to $t0 from $fp-144
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L111:
	# _tmp498 = i < _tmp496
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -148($fp)	# fill _tmp496 to $t1 from $fp-148
	  slt $t2, $t0, $t1	
	  sw $t2, -156($fp)	# spill _tmp498 from $t2 to $fp-156
	# IfZ _tmp498 Goto _L112
	  lw $t0, -156($fp)	# fill _tmp498 to $t0 from $fp-156
	  beqz $t0, _L112	# branch if _tmp498 is zero 
	# PushParam _tmp495
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -144($fp)	# fill _tmp495 to $t0 from $fp-144
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L112:
	# _tmp499 = *(_tmp494)
	  lw $t0, -140($fp)	# fill _tmp494 to $t0 from $fp-140
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -160($fp)	# spill _tmp499 from $t2 to $fp-160
	# _tmp500 = i < _tmp499
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -160($fp)	# fill _tmp499 to $t1 from $fp-160
	  slt $t2, $t0, $t1	
	  sw $t2, -164($fp)	# spill _tmp500 from $t2 to $fp-164
	# IfZ _tmp500 Goto _L114
	  lw $t0, -164($fp)	# fill _tmp500 to $t0 from $fp-164
	  beqz $t0, _L114	# branch if _tmp500 is zero 
	# Goto _L113
	  b _L113		# unconditional branch
  _L114:
	# PushParam _tmp495
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -144($fp)	# fill _tmp495 to $t0 from $fp-144
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L113:
	# _tmp501 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -168($fp)	# spill _tmp501 from $t2 to $fp-168
	# _tmp502 = i + _tmp501
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -168($fp)	# fill _tmp501 to $t1 from $fp-168
	  add $t2, $t0, $t1	
	  sw $t2, -172($fp)	# spill _tmp502 from $t2 to $fp-172
	# _tmp503 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -176($fp)	# spill _tmp503 from $t2 to $fp-176
	# _tmp504 = _tmp502 * _tmp503
	  lw $t0, -172($fp)	# fill _tmp502 to $t0 from $fp-172
	  lw $t1, -176($fp)	# fill _tmp503 to $t1 from $fp-176
	  mul $t2, $t0, $t1	
	  sw $t2, -180($fp)	# spill _tmp504 from $t2 to $fp-180
	# _tmp505 = _tmp494 + _tmp504
	  lw $t0, -140($fp)	# fill _tmp494 to $t0 from $fp-140
	  lw $t1, -180($fp)	# fill _tmp504 to $t1 from $fp-180
	  add $t2, $t0, $t1	
	  sw $t2, -184($fp)	# spill _tmp505 from $t2 to $fp-184
	# _tmp506 = *(_tmp505)
	  lw $t0, -184($fp)	# fill _tmp505 to $t0 from $fp-184
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -188($fp)	# spill _tmp506 from $t2 to $fp-188
	# PushParam _tmp506
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -188($fp)	# fill _tmp506 to $t0 from $fp-188
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp507 = *(_tmp506)
	  lw $t0, -188($fp)	# fill _tmp506 to $t0 from $fp-188
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -192($fp)	# spill _tmp507 from $t2 to $fp-192
	# _tmp508 = *(_tmp507)
	  lw $t0, -192($fp)	# fill _tmp507 to $t0 from $fp-192
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -196($fp)	# spill _tmp508 from $t2 to $fp-196
	# ACall _tmp508
	  lw $t0, -196($fp)	# fill _tmp508 to $t0 from $fp-196
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp509 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -200($fp)	# spill _tmp509 from $t2 to $fp-200
	# _tmp510 = i + _tmp509
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -200($fp)	# fill _tmp509 to $t1 from $fp-200
	  add $t2, $t0, $t1	
	  sw $t2, -204($fp)	# spill _tmp510 from $t2 to $fp-204
	# i = _tmp510
	  lw $t2, -204($fp)	# fill _tmp510 to $t2 from $fp-204
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# Goto _L106
	  b _L106		# unconditional branch
  _L107:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _House.TakeAllBets:
	# BeginFunc 156
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 156	# decrement sp to make space for locals/temps
	# _tmp511 = "\nFirst, let's take bets.\n"
	  .data			# create string constant marked with label
	  _string53: .asciiz "\nFirst, let's take bets.\n"
	  .text
	  la $t2, _string53	# load label
	  sw $t2, -12($fp)	# spill _tmp511 from $t2 to $fp-12
	# PushParam _tmp511
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp511 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp512 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -16($fp)	# spill _tmp512 from $t2 to $fp-16
	# i = _tmp512
	  lw $t2, -16($fp)	# fill _tmp512 to $t2 from $fp-16
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  _L115:
	# _tmp513 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -20($fp)	# spill _tmp513 from $t2 to $fp-20
	# _tmp514 = *(_tmp513)
	  lw $t0, -20($fp)	# fill _tmp513 to $t0 from $fp-20
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -24($fp)	# spill _tmp514 from $t2 to $fp-24
	# _tmp515 = i < _tmp514
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -24($fp)	# fill _tmp514 to $t1 from $fp-24
	  slt $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp515 from $t2 to $fp-28
	# IfZ _tmp515 Goto _L116
	  lw $t0, -28($fp)	# fill _tmp515 to $t0 from $fp-28
	  beqz $t0, _L116	# branch if _tmp515 is zero 
	# _tmp516 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -32($fp)	# spill _tmp516 from $t2 to $fp-32
	# _tmp517 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string54: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string54	# load label
	  sw $t2, -36($fp)	# spill _tmp517 from $t2 to $fp-36
	# _tmp518 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -40($fp)	# spill _tmp518 from $t2 to $fp-40
	# _tmp519 = _tmp516 == _tmp518
	  lw $t0, -32($fp)	# fill _tmp516 to $t0 from $fp-32
	  lw $t1, -40($fp)	# fill _tmp518 to $t1 from $fp-40
	  seq $t2, $t0, $t1	
	  sw $t2, -44($fp)	# spill _tmp519 from $t2 to $fp-44
	# IfZ _tmp519 Goto _L117
	  lw $t0, -44($fp)	# fill _tmp519 to $t0 from $fp-44
	  beqz $t0, _L117	# branch if _tmp519 is zero 
	# PushParam _tmp517
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -36($fp)	# fill _tmp517 to $t0 from $fp-36
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L117:
	# _tmp520 = i < _tmp518
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -40($fp)	# fill _tmp518 to $t1 from $fp-40
	  slt $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp520 from $t2 to $fp-48
	# IfZ _tmp520 Goto _L118
	  lw $t0, -48($fp)	# fill _tmp520 to $t0 from $fp-48
	  beqz $t0, _L118	# branch if _tmp520 is zero 
	# PushParam _tmp517
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -36($fp)	# fill _tmp517 to $t0 from $fp-36
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L118:
	# _tmp521 = *(_tmp516)
	  lw $t0, -32($fp)	# fill _tmp516 to $t0 from $fp-32
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -52($fp)	# spill _tmp521 from $t2 to $fp-52
	# _tmp522 = i < _tmp521
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -52($fp)	# fill _tmp521 to $t1 from $fp-52
	  slt $t2, $t0, $t1	
	  sw $t2, -56($fp)	# spill _tmp522 from $t2 to $fp-56
	# IfZ _tmp522 Goto _L120
	  lw $t0, -56($fp)	# fill _tmp522 to $t0 from $fp-56
	  beqz $t0, _L120	# branch if _tmp522 is zero 
	# Goto _L119
	  b _L119		# unconditional branch
  _L120:
	# PushParam _tmp517
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -36($fp)	# fill _tmp517 to $t0 from $fp-36
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L119:
	# _tmp523 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -60($fp)	# spill _tmp523 from $t2 to $fp-60
	# _tmp524 = i + _tmp523
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -60($fp)	# fill _tmp523 to $t1 from $fp-60
	  add $t2, $t0, $t1	
	  sw $t2, -64($fp)	# spill _tmp524 from $t2 to $fp-64
	# _tmp525 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -68($fp)	# spill _tmp525 from $t2 to $fp-68
	# _tmp526 = _tmp524 * _tmp525
	  lw $t0, -64($fp)	# fill _tmp524 to $t0 from $fp-64
	  lw $t1, -68($fp)	# fill _tmp525 to $t1 from $fp-68
	  mul $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp526 from $t2 to $fp-72
	# _tmp527 = _tmp516 + _tmp526
	  lw $t0, -32($fp)	# fill _tmp516 to $t0 from $fp-32
	  lw $t1, -72($fp)	# fill _tmp526 to $t1 from $fp-72
	  add $t2, $t0, $t1	
	  sw $t2, -76($fp)	# spill _tmp527 from $t2 to $fp-76
	# _tmp528 = *(_tmp527)
	  lw $t0, -76($fp)	# fill _tmp527 to $t0 from $fp-76
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -80($fp)	# spill _tmp528 from $t2 to $fp-80
	# PushParam _tmp528
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -80($fp)	# fill _tmp528 to $t0 from $fp-80
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp529 = *(_tmp528)
	  lw $t0, -80($fp)	# fill _tmp528 to $t0 from $fp-80
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -84($fp)	# spill _tmp529 from $t2 to $fp-84
	# _tmp530 = *(_tmp529 + 16)
	  lw $t0, -84($fp)	# fill _tmp529 to $t0 from $fp-84
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -88($fp)	# spill _tmp530 from $t2 to $fp-88
	# _tmp531 = ACall _tmp530
	  lw $t0, -88($fp)	# fill _tmp530 to $t0 from $fp-88
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -92($fp)	# spill _tmp531 from $t2 to $fp-92
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# IfZ _tmp531 Goto _L121
	  lw $t0, -92($fp)	# fill _tmp531 to $t0 from $fp-92
	  beqz $t0, _L121	# branch if _tmp531 is zero 
	# _tmp532 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -96($fp)	# spill _tmp532 from $t2 to $fp-96
	# _tmp533 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string55: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string55	# load label
	  sw $t2, -100($fp)	# spill _tmp533 from $t2 to $fp-100
	# _tmp534 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -104($fp)	# spill _tmp534 from $t2 to $fp-104
	# _tmp535 = _tmp532 == _tmp534
	  lw $t0, -96($fp)	# fill _tmp532 to $t0 from $fp-96
	  lw $t1, -104($fp)	# fill _tmp534 to $t1 from $fp-104
	  seq $t2, $t0, $t1	
	  sw $t2, -108($fp)	# spill _tmp535 from $t2 to $fp-108
	# IfZ _tmp535 Goto _L123
	  lw $t0, -108($fp)	# fill _tmp535 to $t0 from $fp-108
	  beqz $t0, _L123	# branch if _tmp535 is zero 
	# PushParam _tmp533
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -100($fp)	# fill _tmp533 to $t0 from $fp-100
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L123:
	# _tmp536 = i < _tmp534
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -104($fp)	# fill _tmp534 to $t1 from $fp-104
	  slt $t2, $t0, $t1	
	  sw $t2, -112($fp)	# spill _tmp536 from $t2 to $fp-112
	# IfZ _tmp536 Goto _L124
	  lw $t0, -112($fp)	# fill _tmp536 to $t0 from $fp-112
	  beqz $t0, _L124	# branch if _tmp536 is zero 
	# PushParam _tmp533
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -100($fp)	# fill _tmp533 to $t0 from $fp-100
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L124:
	# _tmp537 = *(_tmp532)
	  lw $t0, -96($fp)	# fill _tmp532 to $t0 from $fp-96
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -116($fp)	# spill _tmp537 from $t2 to $fp-116
	# _tmp538 = i < _tmp537
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -116($fp)	# fill _tmp537 to $t1 from $fp-116
	  slt $t2, $t0, $t1	
	  sw $t2, -120($fp)	# spill _tmp538 from $t2 to $fp-120
	# IfZ _tmp538 Goto _L126
	  lw $t0, -120($fp)	# fill _tmp538 to $t0 from $fp-120
	  beqz $t0, _L126	# branch if _tmp538 is zero 
	# Goto _L125
	  b _L125		# unconditional branch
  _L126:
	# PushParam _tmp533
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -100($fp)	# fill _tmp533 to $t0 from $fp-100
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L125:
	# _tmp539 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -124($fp)	# spill _tmp539 from $t2 to $fp-124
	# _tmp540 = i + _tmp539
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -124($fp)	# fill _tmp539 to $t1 from $fp-124
	  add $t2, $t0, $t1	
	  sw $t2, -128($fp)	# spill _tmp540 from $t2 to $fp-128
	# _tmp541 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -132($fp)	# spill _tmp541 from $t2 to $fp-132
	# _tmp542 = _tmp540 * _tmp541
	  lw $t0, -128($fp)	# fill _tmp540 to $t0 from $fp-128
	  lw $t1, -132($fp)	# fill _tmp541 to $t1 from $fp-132
	  mul $t2, $t0, $t1	
	  sw $t2, -136($fp)	# spill _tmp542 from $t2 to $fp-136
	# _tmp543 = _tmp532 + _tmp542
	  lw $t0, -96($fp)	# fill _tmp532 to $t0 from $fp-96
	  lw $t1, -136($fp)	# fill _tmp542 to $t1 from $fp-136
	  add $t2, $t0, $t1	
	  sw $t2, -140($fp)	# spill _tmp543 from $t2 to $fp-140
	# _tmp544 = *(_tmp543)
	  lw $t0, -140($fp)	# fill _tmp543 to $t0 from $fp-140
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -144($fp)	# spill _tmp544 from $t2 to $fp-144
	# PushParam _tmp544
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -144($fp)	# fill _tmp544 to $t0 from $fp-144
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp545 = *(_tmp544)
	  lw $t0, -144($fp)	# fill _tmp544 to $t0 from $fp-144
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -148($fp)	# spill _tmp545 from $t2 to $fp-148
	# _tmp546 = *(_tmp545 + 24)
	  lw $t0, -148($fp)	# fill _tmp545 to $t0 from $fp-148
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -152($fp)	# spill _tmp546 from $t2 to $fp-152
	# ACall _tmp546
	  lw $t0, -152($fp)	# fill _tmp546 to $t0 from $fp-152
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L122
	  b _L122		# unconditional branch
  _L121:
  _L122:
	# _tmp547 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -156($fp)	# spill _tmp547 from $t2 to $fp-156
	# _tmp548 = i + _tmp547
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -156($fp)	# fill _tmp547 to $t1 from $fp-156
	  add $t2, $t0, $t1	
	  sw $t2, -160($fp)	# spill _tmp548 from $t2 to $fp-160
	# i = _tmp548
	  lw $t2, -160($fp)	# fill _tmp548 to $t2 from $fp-160
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# Goto _L115
	  b _L115		# unconditional branch
  _L116:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _House.TakeAllTurns:
	# BeginFunc 156
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 156	# decrement sp to make space for locals/temps
	# _tmp549 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -12($fp)	# spill _tmp549 from $t2 to $fp-12
	# i = _tmp549
	  lw $t2, -12($fp)	# fill _tmp549 to $t2 from $fp-12
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  _L127:
	# _tmp550 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp550 from $t2 to $fp-16
	# _tmp551 = *(_tmp550)
	  lw $t0, -16($fp)	# fill _tmp550 to $t0 from $fp-16
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -20($fp)	# spill _tmp551 from $t2 to $fp-20
	# _tmp552 = i < _tmp551
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -20($fp)	# fill _tmp551 to $t1 from $fp-20
	  slt $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp552 from $t2 to $fp-24
	# IfZ _tmp552 Goto _L128
	  lw $t0, -24($fp)	# fill _tmp552 to $t0 from $fp-24
	  beqz $t0, _L128	# branch if _tmp552 is zero 
	# _tmp553 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -28($fp)	# spill _tmp553 from $t2 to $fp-28
	# _tmp554 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string56: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string56	# load label
	  sw $t2, -32($fp)	# spill _tmp554 from $t2 to $fp-32
	# _tmp555 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -36($fp)	# spill _tmp555 from $t2 to $fp-36
	# _tmp556 = _tmp553 == _tmp555
	  lw $t0, -28($fp)	# fill _tmp553 to $t0 from $fp-28
	  lw $t1, -36($fp)	# fill _tmp555 to $t1 from $fp-36
	  seq $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp556 from $t2 to $fp-40
	# IfZ _tmp556 Goto _L129
	  lw $t0, -40($fp)	# fill _tmp556 to $t0 from $fp-40
	  beqz $t0, _L129	# branch if _tmp556 is zero 
	# PushParam _tmp554
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp554 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L129:
	# _tmp557 = i < _tmp555
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -36($fp)	# fill _tmp555 to $t1 from $fp-36
	  slt $t2, $t0, $t1	
	  sw $t2, -44($fp)	# spill _tmp557 from $t2 to $fp-44
	# IfZ _tmp557 Goto _L130
	  lw $t0, -44($fp)	# fill _tmp557 to $t0 from $fp-44
	  beqz $t0, _L130	# branch if _tmp557 is zero 
	# PushParam _tmp554
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp554 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L130:
	# _tmp558 = *(_tmp553)
	  lw $t0, -28($fp)	# fill _tmp553 to $t0 from $fp-28
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -48($fp)	# spill _tmp558 from $t2 to $fp-48
	# _tmp559 = i < _tmp558
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -48($fp)	# fill _tmp558 to $t1 from $fp-48
	  slt $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp559 from $t2 to $fp-52
	# IfZ _tmp559 Goto _L132
	  lw $t0, -52($fp)	# fill _tmp559 to $t0 from $fp-52
	  beqz $t0, _L132	# branch if _tmp559 is zero 
	# Goto _L131
	  b _L131		# unconditional branch
  _L132:
	# PushParam _tmp554
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp554 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L131:
	# _tmp560 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -56($fp)	# spill _tmp560 from $t2 to $fp-56
	# _tmp561 = i + _tmp560
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -56($fp)	# fill _tmp560 to $t1 from $fp-56
	  add $t2, $t0, $t1	
	  sw $t2, -60($fp)	# spill _tmp561 from $t2 to $fp-60
	# _tmp562 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -64($fp)	# spill _tmp562 from $t2 to $fp-64
	# _tmp563 = _tmp561 * _tmp562
	  lw $t0, -60($fp)	# fill _tmp561 to $t0 from $fp-60
	  lw $t1, -64($fp)	# fill _tmp562 to $t1 from $fp-64
	  mul $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp563 from $t2 to $fp-68
	# _tmp564 = _tmp553 + _tmp563
	  lw $t0, -28($fp)	# fill _tmp553 to $t0 from $fp-28
	  lw $t1, -68($fp)	# fill _tmp563 to $t1 from $fp-68
	  add $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp564 from $t2 to $fp-72
	# _tmp565 = *(_tmp564)
	  lw $t0, -72($fp)	# fill _tmp564 to $t0 from $fp-72
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -76($fp)	# spill _tmp565 from $t2 to $fp-76
	# PushParam _tmp565
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -76($fp)	# fill _tmp565 to $t0 from $fp-76
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp566 = *(_tmp565)
	  lw $t0, -76($fp)	# fill _tmp565 to $t0 from $fp-76
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -80($fp)	# spill _tmp566 from $t2 to $fp-80
	# _tmp567 = *(_tmp566 + 16)
	  lw $t0, -80($fp)	# fill _tmp566 to $t0 from $fp-80
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -84($fp)	# spill _tmp567 from $t2 to $fp-84
	# _tmp568 = ACall _tmp567
	  lw $t0, -84($fp)	# fill _tmp567 to $t0 from $fp-84
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -88($fp)	# spill _tmp568 from $t2 to $fp-88
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# IfZ _tmp568 Goto _L133
	  lw $t0, -88($fp)	# fill _tmp568 to $t0 from $fp-88
	  beqz $t0, _L133	# branch if _tmp568 is zero 
	# _tmp569 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -92($fp)	# spill _tmp569 from $t2 to $fp-92
	# PushParam _tmp569
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -92($fp)	# fill _tmp569 to $t0 from $fp-92
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp570 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -96($fp)	# spill _tmp570 from $t2 to $fp-96
	# _tmp571 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string57: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string57	# load label
	  sw $t2, -100($fp)	# spill _tmp571 from $t2 to $fp-100
	# _tmp572 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -104($fp)	# spill _tmp572 from $t2 to $fp-104
	# _tmp573 = _tmp570 == _tmp572
	  lw $t0, -96($fp)	# fill _tmp570 to $t0 from $fp-96
	  lw $t1, -104($fp)	# fill _tmp572 to $t1 from $fp-104
	  seq $t2, $t0, $t1	
	  sw $t2, -108($fp)	# spill _tmp573 from $t2 to $fp-108
	# IfZ _tmp573 Goto _L135
	  lw $t0, -108($fp)	# fill _tmp573 to $t0 from $fp-108
	  beqz $t0, _L135	# branch if _tmp573 is zero 
	# PushParam _tmp571
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -100($fp)	# fill _tmp571 to $t0 from $fp-100
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L135:
	# _tmp574 = i < _tmp572
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -104($fp)	# fill _tmp572 to $t1 from $fp-104
	  slt $t2, $t0, $t1	
	  sw $t2, -112($fp)	# spill _tmp574 from $t2 to $fp-112
	# IfZ _tmp574 Goto _L136
	  lw $t0, -112($fp)	# fill _tmp574 to $t0 from $fp-112
	  beqz $t0, _L136	# branch if _tmp574 is zero 
	# PushParam _tmp571
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -100($fp)	# fill _tmp571 to $t0 from $fp-100
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L136:
	# _tmp575 = *(_tmp570)
	  lw $t0, -96($fp)	# fill _tmp570 to $t0 from $fp-96
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -116($fp)	# spill _tmp575 from $t2 to $fp-116
	# _tmp576 = i < _tmp575
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -116($fp)	# fill _tmp575 to $t1 from $fp-116
	  slt $t2, $t0, $t1	
	  sw $t2, -120($fp)	# spill _tmp576 from $t2 to $fp-120
	# IfZ _tmp576 Goto _L138
	  lw $t0, -120($fp)	# fill _tmp576 to $t0 from $fp-120
	  beqz $t0, _L138	# branch if _tmp576 is zero 
	# Goto _L137
	  b _L137		# unconditional branch
  _L138:
	# PushParam _tmp571
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -100($fp)	# fill _tmp571 to $t0 from $fp-100
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L137:
	# _tmp577 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -124($fp)	# spill _tmp577 from $t2 to $fp-124
	# _tmp578 = i + _tmp577
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -124($fp)	# fill _tmp577 to $t1 from $fp-124
	  add $t2, $t0, $t1	
	  sw $t2, -128($fp)	# spill _tmp578 from $t2 to $fp-128
	# _tmp579 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -132($fp)	# spill _tmp579 from $t2 to $fp-132
	# _tmp580 = _tmp578 * _tmp579
	  lw $t0, -128($fp)	# fill _tmp578 to $t0 from $fp-128
	  lw $t1, -132($fp)	# fill _tmp579 to $t1 from $fp-132
	  mul $t2, $t0, $t1	
	  sw $t2, -136($fp)	# spill _tmp580 from $t2 to $fp-136
	# _tmp581 = _tmp570 + _tmp580
	  lw $t0, -96($fp)	# fill _tmp570 to $t0 from $fp-96
	  lw $t1, -136($fp)	# fill _tmp580 to $t1 from $fp-136
	  add $t2, $t0, $t1	
	  sw $t2, -140($fp)	# spill _tmp581 from $t2 to $fp-140
	# _tmp582 = *(_tmp581)
	  lw $t0, -140($fp)	# fill _tmp581 to $t0 from $fp-140
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -144($fp)	# spill _tmp582 from $t2 to $fp-144
	# PushParam _tmp582
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -144($fp)	# fill _tmp582 to $t0 from $fp-144
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp583 = *(_tmp582)
	  lw $t0, -144($fp)	# fill _tmp582 to $t0 from $fp-144
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -148($fp)	# spill _tmp583 from $t2 to $fp-148
	# _tmp584 = *(_tmp583 + 12)
	  lw $t0, -148($fp)	# fill _tmp583 to $t0 from $fp-148
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -152($fp)	# spill _tmp584 from $t2 to $fp-152
	# ACall _tmp584
	  lw $t0, -152($fp)	# fill _tmp584 to $t0 from $fp-152
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# Goto _L134
	  b _L134		# unconditional branch
  _L133:
  _L134:
	# _tmp585 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -156($fp)	# spill _tmp585 from $t2 to $fp-156
	# _tmp586 = i + _tmp585
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -156($fp)	# fill _tmp585 to $t1 from $fp-156
	  add $t2, $t0, $t1	
	  sw $t2, -160($fp)	# spill _tmp586 from $t2 to $fp-160
	# i = _tmp586
	  lw $t2, -160($fp)	# fill _tmp586 to $t2 from $fp-160
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# Goto _L127
	  b _L127		# unconditional branch
  _L128:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _House.ResolveAllPlayers:
	# BeginFunc 172
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 172	# decrement sp to make space for locals/temps
	# _tmp587 = "\nTime to resolve bets.\n"
	  .data			# create string constant marked with label
	  _string58: .asciiz "\nTime to resolve bets.\n"
	  .text
	  la $t2, _string58	# load label
	  sw $t2, -12($fp)	# spill _tmp587 from $t2 to $fp-12
	# PushParam _tmp587
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp587 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp588 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -16($fp)	# spill _tmp588 from $t2 to $fp-16
	# i = _tmp588
	  lw $t2, -16($fp)	# fill _tmp588 to $t2 from $fp-16
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  _L139:
	# _tmp589 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -20($fp)	# spill _tmp589 from $t2 to $fp-20
	# _tmp590 = *(_tmp589)
	  lw $t0, -20($fp)	# fill _tmp589 to $t0 from $fp-20
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -24($fp)	# spill _tmp590 from $t2 to $fp-24
	# _tmp591 = i < _tmp590
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -24($fp)	# fill _tmp590 to $t1 from $fp-24
	  slt $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp591 from $t2 to $fp-28
	# IfZ _tmp591 Goto _L140
	  lw $t0, -28($fp)	# fill _tmp591 to $t0 from $fp-28
	  beqz $t0, _L140	# branch if _tmp591 is zero 
	# _tmp592 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -32($fp)	# spill _tmp592 from $t2 to $fp-32
	# _tmp593 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string59: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string59	# load label
	  sw $t2, -36($fp)	# spill _tmp593 from $t2 to $fp-36
	# _tmp594 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -40($fp)	# spill _tmp594 from $t2 to $fp-40
	# _tmp595 = _tmp592 == _tmp594
	  lw $t0, -32($fp)	# fill _tmp592 to $t0 from $fp-32
	  lw $t1, -40($fp)	# fill _tmp594 to $t1 from $fp-40
	  seq $t2, $t0, $t1	
	  sw $t2, -44($fp)	# spill _tmp595 from $t2 to $fp-44
	# IfZ _tmp595 Goto _L141
	  lw $t0, -44($fp)	# fill _tmp595 to $t0 from $fp-44
	  beqz $t0, _L141	# branch if _tmp595 is zero 
	# PushParam _tmp593
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -36($fp)	# fill _tmp593 to $t0 from $fp-36
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L141:
	# _tmp596 = i < _tmp594
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -40($fp)	# fill _tmp594 to $t1 from $fp-40
	  slt $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp596 from $t2 to $fp-48
	# IfZ _tmp596 Goto _L142
	  lw $t0, -48($fp)	# fill _tmp596 to $t0 from $fp-48
	  beqz $t0, _L142	# branch if _tmp596 is zero 
	# PushParam _tmp593
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -36($fp)	# fill _tmp593 to $t0 from $fp-36
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L142:
	# _tmp597 = *(_tmp592)
	  lw $t0, -32($fp)	# fill _tmp592 to $t0 from $fp-32
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -52($fp)	# spill _tmp597 from $t2 to $fp-52
	# _tmp598 = i < _tmp597
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -52($fp)	# fill _tmp597 to $t1 from $fp-52
	  slt $t2, $t0, $t1	
	  sw $t2, -56($fp)	# spill _tmp598 from $t2 to $fp-56
	# IfZ _tmp598 Goto _L144
	  lw $t0, -56($fp)	# fill _tmp598 to $t0 from $fp-56
	  beqz $t0, _L144	# branch if _tmp598 is zero 
	# Goto _L143
	  b _L143		# unconditional branch
  _L144:
	# PushParam _tmp593
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -36($fp)	# fill _tmp593 to $t0 from $fp-36
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L143:
	# _tmp599 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -60($fp)	# spill _tmp599 from $t2 to $fp-60
	# _tmp600 = i + _tmp599
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -60($fp)	# fill _tmp599 to $t1 from $fp-60
	  add $t2, $t0, $t1	
	  sw $t2, -64($fp)	# spill _tmp600 from $t2 to $fp-64
	# _tmp601 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -68($fp)	# spill _tmp601 from $t2 to $fp-68
	# _tmp602 = _tmp600 * _tmp601
	  lw $t0, -64($fp)	# fill _tmp600 to $t0 from $fp-64
	  lw $t1, -68($fp)	# fill _tmp601 to $t1 from $fp-68
	  mul $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp602 from $t2 to $fp-72
	# _tmp603 = _tmp592 + _tmp602
	  lw $t0, -32($fp)	# fill _tmp592 to $t0 from $fp-32
	  lw $t1, -72($fp)	# fill _tmp602 to $t1 from $fp-72
	  add $t2, $t0, $t1	
	  sw $t2, -76($fp)	# spill _tmp603 from $t2 to $fp-76
	# _tmp604 = *(_tmp603)
	  lw $t0, -76($fp)	# fill _tmp603 to $t0 from $fp-76
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -80($fp)	# spill _tmp604 from $t2 to $fp-80
	# PushParam _tmp604
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -80($fp)	# fill _tmp604 to $t0 from $fp-80
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp605 = *(_tmp604)
	  lw $t0, -80($fp)	# fill _tmp604 to $t0 from $fp-80
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -84($fp)	# spill _tmp605 from $t2 to $fp-84
	# _tmp606 = *(_tmp605 + 16)
	  lw $t0, -84($fp)	# fill _tmp605 to $t0 from $fp-84
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -88($fp)	# spill _tmp606 from $t2 to $fp-88
	# _tmp607 = ACall _tmp606
	  lw $t0, -88($fp)	# fill _tmp606 to $t0 from $fp-88
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -92($fp)	# spill _tmp607 from $t2 to $fp-92
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# IfZ _tmp607 Goto _L145
	  lw $t0, -92($fp)	# fill _tmp607 to $t0 from $fp-92
	  beqz $t0, _L145	# branch if _tmp607 is zero 
	# _tmp608 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -96($fp)	# spill _tmp608 from $t2 to $fp-96
	# PushParam _tmp608
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -96($fp)	# fill _tmp608 to $t0 from $fp-96
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp609 = *(_tmp608)
	  lw $t0, -96($fp)	# fill _tmp608 to $t0 from $fp-96
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -100($fp)	# spill _tmp609 from $t2 to $fp-100
	# _tmp610 = *(_tmp609 + 28)
	  lw $t0, -100($fp)	# fill _tmp609 to $t0 from $fp-100
	  lw $t2, 28($t0) 	# load with offset
	  sw $t2, -104($fp)	# spill _tmp610 from $t2 to $fp-104
	# _tmp611 = ACall _tmp610
	  lw $t0, -104($fp)	# fill _tmp610 to $t0 from $fp-104
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -108($fp)	# spill _tmp611 from $t2 to $fp-108
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp611
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -108($fp)	# fill _tmp611 to $t0 from $fp-108
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp612 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -112($fp)	# spill _tmp612 from $t2 to $fp-112
	# _tmp613 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string60: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string60	# load label
	  sw $t2, -116($fp)	# spill _tmp613 from $t2 to $fp-116
	# _tmp614 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -120($fp)	# spill _tmp614 from $t2 to $fp-120
	# _tmp615 = _tmp612 == _tmp614
	  lw $t0, -112($fp)	# fill _tmp612 to $t0 from $fp-112
	  lw $t1, -120($fp)	# fill _tmp614 to $t1 from $fp-120
	  seq $t2, $t0, $t1	
	  sw $t2, -124($fp)	# spill _tmp615 from $t2 to $fp-124
	# IfZ _tmp615 Goto _L147
	  lw $t0, -124($fp)	# fill _tmp615 to $t0 from $fp-124
	  beqz $t0, _L147	# branch if _tmp615 is zero 
	# PushParam _tmp613
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -116($fp)	# fill _tmp613 to $t0 from $fp-116
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L147:
	# _tmp616 = i < _tmp614
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -120($fp)	# fill _tmp614 to $t1 from $fp-120
	  slt $t2, $t0, $t1	
	  sw $t2, -128($fp)	# spill _tmp616 from $t2 to $fp-128
	# IfZ _tmp616 Goto _L148
	  lw $t0, -128($fp)	# fill _tmp616 to $t0 from $fp-128
	  beqz $t0, _L148	# branch if _tmp616 is zero 
	# PushParam _tmp613
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -116($fp)	# fill _tmp613 to $t0 from $fp-116
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L148:
	# _tmp617 = *(_tmp612)
	  lw $t0, -112($fp)	# fill _tmp612 to $t0 from $fp-112
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -132($fp)	# spill _tmp617 from $t2 to $fp-132
	# _tmp618 = i < _tmp617
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -132($fp)	# fill _tmp617 to $t1 from $fp-132
	  slt $t2, $t0, $t1	
	  sw $t2, -136($fp)	# spill _tmp618 from $t2 to $fp-136
	# IfZ _tmp618 Goto _L150
	  lw $t0, -136($fp)	# fill _tmp618 to $t0 from $fp-136
	  beqz $t0, _L150	# branch if _tmp618 is zero 
	# Goto _L149
	  b _L149		# unconditional branch
  _L150:
	# PushParam _tmp613
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -116($fp)	# fill _tmp613 to $t0 from $fp-116
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L149:
	# _tmp619 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -140($fp)	# spill _tmp619 from $t2 to $fp-140
	# _tmp620 = i + _tmp619
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -140($fp)	# fill _tmp619 to $t1 from $fp-140
	  add $t2, $t0, $t1	
	  sw $t2, -144($fp)	# spill _tmp620 from $t2 to $fp-144
	# _tmp621 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -148($fp)	# spill _tmp621 from $t2 to $fp-148
	# _tmp622 = _tmp620 * _tmp621
	  lw $t0, -144($fp)	# fill _tmp620 to $t0 from $fp-144
	  lw $t1, -148($fp)	# fill _tmp621 to $t1 from $fp-148
	  mul $t2, $t0, $t1	
	  sw $t2, -152($fp)	# spill _tmp622 from $t2 to $fp-152
	# _tmp623 = _tmp612 + _tmp622
	  lw $t0, -112($fp)	# fill _tmp612 to $t0 from $fp-112
	  lw $t1, -152($fp)	# fill _tmp622 to $t1 from $fp-152
	  add $t2, $t0, $t1	
	  sw $t2, -156($fp)	# spill _tmp623 from $t2 to $fp-156
	# _tmp624 = *(_tmp623)
	  lw $t0, -156($fp)	# fill _tmp623 to $t0 from $fp-156
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -160($fp)	# spill _tmp624 from $t2 to $fp-160
	# PushParam _tmp624
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -160($fp)	# fill _tmp624 to $t0 from $fp-160
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp625 = *(_tmp624)
	  lw $t0, -160($fp)	# fill _tmp624 to $t0 from $fp-160
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -164($fp)	# spill _tmp625 from $t2 to $fp-164
	# _tmp626 = *(_tmp625 + 32)
	  lw $t0, -164($fp)	# fill _tmp625 to $t0 from $fp-164
	  lw $t2, 32($t0) 	# load with offset
	  sw $t2, -168($fp)	# spill _tmp626 from $t2 to $fp-168
	# ACall _tmp626
	  lw $t0, -168($fp)	# fill _tmp626 to $t0 from $fp-168
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# Goto _L146
	  b _L146		# unconditional branch
  _L145:
  _L146:
	# _tmp627 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -172($fp)	# spill _tmp627 from $t2 to $fp-172
	# _tmp628 = i + _tmp627
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -172($fp)	# fill _tmp627 to $t1 from $fp-172
	  add $t2, $t0, $t1	
	  sw $t2, -176($fp)	# spill _tmp628 from $t2 to $fp-176
	# i = _tmp628
	  lw $t2, -176($fp)	# fill _tmp628 to $t2 from $fp-176
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# Goto _L139
	  b _L139		# unconditional branch
  _L140:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _House.PrintAllMoney:
	# BeginFunc 88
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 88	# decrement sp to make space for locals/temps
	# _tmp629 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -12($fp)	# spill _tmp629 from $t2 to $fp-12
	# i = _tmp629
	  lw $t2, -12($fp)	# fill _tmp629 to $t2 from $fp-12
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  _L151:
	# _tmp630 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp630 from $t2 to $fp-16
	# _tmp631 = *(_tmp630)
	  lw $t0, -16($fp)	# fill _tmp630 to $t0 from $fp-16
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -20($fp)	# spill _tmp631 from $t2 to $fp-20
	# _tmp632 = i < _tmp631
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -20($fp)	# fill _tmp631 to $t1 from $fp-20
	  slt $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp632 from $t2 to $fp-24
	# IfZ _tmp632 Goto _L152
	  lw $t0, -24($fp)	# fill _tmp632 to $t0 from $fp-24
	  beqz $t0, _L152	# branch if _tmp632 is zero 
	# _tmp633 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -28($fp)	# spill _tmp633 from $t2 to $fp-28
	# _tmp634 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string61: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t2, _string61	# load label
	  sw $t2, -32($fp)	# spill _tmp634 from $t2 to $fp-32
	# _tmp635 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -36($fp)	# spill _tmp635 from $t2 to $fp-36
	# _tmp636 = _tmp633 == _tmp635
	  lw $t0, -28($fp)	# fill _tmp633 to $t0 from $fp-28
	  lw $t1, -36($fp)	# fill _tmp635 to $t1 from $fp-36
	  seq $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp636 from $t2 to $fp-40
	# IfZ _tmp636 Goto _L153
	  lw $t0, -40($fp)	# fill _tmp636 to $t0 from $fp-40
	  beqz $t0, _L153	# branch if _tmp636 is zero 
	# PushParam _tmp634
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp634 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L153:
	# _tmp637 = i < _tmp635
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -36($fp)	# fill _tmp635 to $t1 from $fp-36
	  slt $t2, $t0, $t1	
	  sw $t2, -44($fp)	# spill _tmp637 from $t2 to $fp-44
	# IfZ _tmp637 Goto _L154
	  lw $t0, -44($fp)	# fill _tmp637 to $t0 from $fp-44
	  beqz $t0, _L154	# branch if _tmp637 is zero 
	# PushParam _tmp634
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp634 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L154:
	# _tmp638 = *(_tmp633)
	  lw $t0, -28($fp)	# fill _tmp633 to $t0 from $fp-28
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -48($fp)	# spill _tmp638 from $t2 to $fp-48
	# _tmp639 = i < _tmp638
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -48($fp)	# fill _tmp638 to $t1 from $fp-48
	  slt $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp639 from $t2 to $fp-52
	# IfZ _tmp639 Goto _L156
	  lw $t0, -52($fp)	# fill _tmp639 to $t0 from $fp-52
	  beqz $t0, _L156	# branch if _tmp639 is zero 
	# Goto _L155
	  b _L155		# unconditional branch
  _L156:
	# PushParam _tmp634
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp634 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L155:
	# _tmp640 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -56($fp)	# spill _tmp640 from $t2 to $fp-56
	# _tmp641 = i + _tmp640
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -56($fp)	# fill _tmp640 to $t1 from $fp-56
	  add $t2, $t0, $t1	
	  sw $t2, -60($fp)	# spill _tmp641 from $t2 to $fp-60
	# _tmp642 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -64($fp)	# spill _tmp642 from $t2 to $fp-64
	# _tmp643 = _tmp641 * _tmp642
	  lw $t0, -60($fp)	# fill _tmp641 to $t0 from $fp-60
	  lw $t1, -64($fp)	# fill _tmp642 to $t1 from $fp-64
	  mul $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp643 from $t2 to $fp-68
	# _tmp644 = _tmp633 + _tmp643
	  lw $t0, -28($fp)	# fill _tmp633 to $t0 from $fp-28
	  lw $t1, -68($fp)	# fill _tmp643 to $t1 from $fp-68
	  add $t2, $t0, $t1	
	  sw $t2, -72($fp)	# spill _tmp644 from $t2 to $fp-72
	# _tmp645 = *(_tmp644)
	  lw $t0, -72($fp)	# fill _tmp644 to $t0 from $fp-72
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -76($fp)	# spill _tmp645 from $t2 to $fp-76
	# PushParam _tmp645
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -76($fp)	# fill _tmp645 to $t0 from $fp-76
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp646 = *(_tmp645)
	  lw $t0, -76($fp)	# fill _tmp645 to $t0 from $fp-76
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -80($fp)	# spill _tmp646 from $t2 to $fp-80
	# _tmp647 = *(_tmp646 + 20)
	  lw $t0, -80($fp)	# fill _tmp646 to $t0 from $fp-80
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -84($fp)	# spill _tmp647 from $t2 to $fp-84
	# ACall _tmp647
	  lw $t0, -84($fp)	# fill _tmp647 to $t0 from $fp-84
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp648 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -88($fp)	# spill _tmp648 from $t2 to $fp-88
	# _tmp649 = i + _tmp648
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -88($fp)	# fill _tmp648 to $t1 from $fp-88
	  add $t2, $t0, $t1	
	  sw $t2, -92($fp)	# spill _tmp649 from $t2 to $fp-92
	# i = _tmp649
	  lw $t2, -92($fp)	# fill _tmp649 to $t2 from $fp-92
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	# Goto _L151
	  b _L151		# unconditional branch
  _L152:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _House.PlayOneGame:
	# BeginFunc 112
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 112	# decrement sp to make space for locals/temps
	# _tmp650 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -8($fp)	# spill _tmp650 from $t2 to $fp-8
	# PushParam _tmp650
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill _tmp650 to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp651 = *(_tmp650)
	  lw $t0, -8($fp)	# fill _tmp650 to $t0 from $fp-8
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -12($fp)	# spill _tmp651 from $t2 to $fp-12
	# _tmp652 = *(_tmp651 + 12)
	  lw $t0, -12($fp)	# fill _tmp651 to $t0 from $fp-12
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -16($fp)	# spill _tmp652 from $t2 to $fp-16
	# _tmp653 = ACall _tmp652
	  lw $t0, -16($fp)	# fill _tmp652 to $t0 from $fp-16
	  jalr $t0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -20($fp)	# spill _tmp653 from $t2 to $fp-20
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp654 = 26
	  li $t2, 26		# load constant value 26 into $t2
	  sw $t2, -24($fp)	# spill _tmp654 from $t2 to $fp-24
	# _tmp655 = _tmp653 < _tmp654
	  lw $t0, -20($fp)	# fill _tmp653 to $t0 from $fp-20
	  lw $t1, -24($fp)	# fill _tmp654 to $t1 from $fp-24
	  slt $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp655 from $t2 to $fp-28
	# IfZ _tmp655 Goto _L157
	  lw $t0, -28($fp)	# fill _tmp655 to $t0 from $fp-28
	  beqz $t0, _L157	# branch if _tmp655 is zero 
	# _tmp656 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -32($fp)	# spill _tmp656 from $t2 to $fp-32
	# PushParam _tmp656
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp656 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp657 = *(_tmp656)
	  lw $t0, -32($fp)	# fill _tmp656 to $t0 from $fp-32
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -36($fp)	# spill _tmp657 from $t2 to $fp-36
	# _tmp658 = *(_tmp657 + 8)
	  lw $t0, -36($fp)	# fill _tmp657 to $t0 from $fp-36
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -40($fp)	# spill _tmp658 from $t2 to $fp-40
	# ACall _tmp658
	  lw $t0, -40($fp)	# fill _tmp658 to $t0 from $fp-40
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L158
	  b _L158		# unconditional branch
  _L157:
  _L158:
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp659 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -44($fp)	# spill _tmp659 from $t2 to $fp-44
	# _tmp660 = *(_tmp659 + 8)
	  lw $t0, -44($fp)	# fill _tmp659 to $t0 from $fp-44
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -48($fp)	# spill _tmp660 from $t2 to $fp-48
	# ACall _tmp660
	  lw $t0, -48($fp)	# fill _tmp660 to $t0 from $fp-48
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp661 = "\nDealer starts. "
	  .data			# create string constant marked with label
	  _string62: .asciiz "\nDealer starts. "
	  .text
	  la $t2, _string62	# load label
	  sw $t2, -52($fp)	# spill _tmp661 from $t2 to $fp-52
	# PushParam _tmp661
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -52($fp)	# fill _tmp661 to $t0 from $fp-52
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp662 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -56($fp)	# spill _tmp662 from $t2 to $fp-56
	# PushParam _tmp662
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -56($fp)	# fill _tmp662 to $t0 from $fp-56
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp663 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -60($fp)	# spill _tmp663 from $t2 to $fp-60
	# PushParam _tmp663
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -60($fp)	# fill _tmp663 to $t0 from $fp-60
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp664 = *(_tmp663)
	  lw $t0, -60($fp)	# fill _tmp663 to $t0 from $fp-60
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -64($fp)	# spill _tmp664 from $t2 to $fp-64
	# _tmp665 = *(_tmp664)
	  lw $t0, -64($fp)	# fill _tmp664 to $t0 from $fp-64
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -68($fp)	# spill _tmp665 from $t2 to $fp-68
	# ACall _tmp665
	  lw $t0, -68($fp)	# fill _tmp665 to $t0 from $fp-68
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp666 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -72($fp)	# spill _tmp666 from $t2 to $fp-72
	# PushParam _tmp666
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -72($fp)	# fill _tmp666 to $t0 from $fp-72
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp667 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -76($fp)	# spill _tmp667 from $t2 to $fp-76
	# PushParam _tmp667
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -76($fp)	# fill _tmp667 to $t0 from $fp-76
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp668 = *(_tmp667)
	  lw $t0, -76($fp)	# fill _tmp667 to $t0 from $fp-76
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -80($fp)	# spill _tmp668 from $t2 to $fp-80
	# _tmp669 = *(_tmp668 + 4)
	  lw $t0, -80($fp)	# fill _tmp668 to $t0 from $fp-80
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -84($fp)	# spill _tmp669 from $t2 to $fp-84
	# ACall _tmp669
	  lw $t0, -84($fp)	# fill _tmp669 to $t0 from $fp-84
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp670 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -88($fp)	# spill _tmp670 from $t2 to $fp-88
	# _tmp671 = *(_tmp670 + 12)
	  lw $t0, -88($fp)	# fill _tmp670 to $t0 from $fp-88
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -92($fp)	# spill _tmp671 from $t2 to $fp-92
	# ACall _tmp671
	  lw $t0, -92($fp)	# fill _tmp671 to $t0 from $fp-92
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp672 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -96($fp)	# spill _tmp672 from $t2 to $fp-96
	# PushParam _tmp672
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -96($fp)	# fill _tmp672 to $t0 from $fp-96
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp673 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 8($t0) 	# load with offset
	  sw $t2, -100($fp)	# spill _tmp673 from $t2 to $fp-100
	# PushParam _tmp673
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -100($fp)	# fill _tmp673 to $t0 from $fp-100
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp674 = *(_tmp673)
	  lw $t0, -100($fp)	# fill _tmp673 to $t0 from $fp-100
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -104($fp)	# spill _tmp674 from $t2 to $fp-104
	# _tmp675 = *(_tmp674 + 12)
	  lw $t0, -104($fp)	# fill _tmp674 to $t0 from $fp-104
	  lw $t2, 12($t0) 	# load with offset
	  sw $t2, -108($fp)	# spill _tmp675 from $t2 to $fp-108
	# ACall _tmp675
	  lw $t0, -108($fp)	# fill _tmp675 to $t0 from $fp-108
	  jalr $t0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp676 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -112($fp)	# spill _tmp676 from $t2 to $fp-112
	# _tmp677 = *(_tmp676 + 16)
	  lw $t0, -112($fp)	# fill _tmp676 to $t0 from $fp-112
	  lw $t2, 16($t0) 	# load with offset
	  sw $t2, -116($fp)	# spill _tmp677 from $t2 to $fp-116
	# ACall _tmp677
	  lw $t0, -116($fp)	# fill _tmp677 to $t0 from $fp-116
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _GetYesOrNo:
	# BeginFunc 36
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 36	# decrement sp to make space for locals/temps
	# PushParam prompt
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill prompt to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp678 = " (y/n) "
	  .data			# create string constant marked with label
	  _string63: .asciiz " (y/n) "
	  .text
	  la $t2, _string63	# load label
	  sw $t2, -12($fp)	# spill _tmp678 from $t2 to $fp-12
	# PushParam _tmp678
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill _tmp678 to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp679 = LCall _ReadLine
	  jal _ReadLine      	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -16($fp)	# spill _tmp679 from $t2 to $fp-16
	# answer = _tmp679
	  lw $t2, -16($fp)	# fill _tmp679 to $t2 from $fp-16
	  sw $t2, -8($fp)	# spill answer from $t2 to $fp-8
	# _tmp681 = "y"
	  .data			# create string constant marked with label
	  _string64: .asciiz "y"
	  .text
	  la $t2, _string64	# load label
	  sw $t2, -24($fp)	# spill _tmp681 from $t2 to $fp-24
	# PushParam _tmp681
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp681 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam answer
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill answer to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp682 = LCall _StringEqual
	  jal _StringEqual   	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -28($fp)	# spill _tmp682 from $t2 to $fp-28
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# IfZ _tmp682 Goto _L159
	  lw $t0, -28($fp)	# fill _tmp682 to $t0 from $fp-28
	  beqz $t0, _L159	# branch if _tmp682 is zero 
	# _tmp683 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -32($fp)	# spill _tmp683 from $t2 to $fp-32
	# _tmp680 = _tmp683
	  lw $t2, -32($fp)	# fill _tmp683 to $t2 from $fp-32
	  sw $t2, -20($fp)	# spill _tmp680 from $t2 to $fp-20
	# Goto _L160
	  b _L160		# unconditional branch
  _L159:
	# _tmp684 = "Y"
	  .data			# create string constant marked with label
	  _string65: .asciiz "Y"
	  .text
	  la $t2, _string65	# load label
	  sw $t2, -36($fp)	# spill _tmp684 from $t2 to $fp-36
	# PushParam _tmp684
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -36($fp)	# fill _tmp684 to $t0 from $fp-36
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam answer
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill answer to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp685 = LCall _StringEqual
	  jal _StringEqual   	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -40($fp)	# spill _tmp685 from $t2 to $fp-40
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp680 = _tmp685
	  lw $t2, -40($fp)	# fill _tmp685 to $t2 from $fp-40
	  sw $t2, -20($fp)	# spill _tmp680 from $t2 to $fp-20
  _L160:
	# Return _tmp680
	  lw $t2, -20($fp)	# fill _tmp680 to $t2 from $fp-20
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
	# BeginFunc 76
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 76	# decrement sp to make space for locals/temps
	# _tmp686 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -16($fp)	# spill _tmp686 from $t2 to $fp-16
	# keepPlaying = _tmp686
	  lw $t2, -16($fp)	# fill _tmp686 to $t2 from $fp-16
	  sw $t2, -8($fp)	# spill keepPlaying from $t2 to $fp-8
	# _tmp687 = 16
	  li $t2, 16		# load constant value 16 into $t2
	  sw $t2, -20($fp)	# spill _tmp687 from $t2 to $fp-20
	# PushParam _tmp687
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -20($fp)	# fill _tmp687 to $t0 from $fp-20
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp688 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -24($fp)	# spill _tmp688 from $t2 to $fp-24
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp689 = House
	  la $t2, House	# load label
	  sw $t2, -28($fp)	# spill _tmp689 from $t2 to $fp-28
	# *(_tmp688) = _tmp689
	  lw $t0, -28($fp)	# fill _tmp689 to $t0 from $fp-28
	  lw $t2, -24($fp)	# fill _tmp688 to $t2 from $fp-24
	  sw $t0, 0($t2) 	# store with offset
	# house = _tmp688
	  lw $t2, -24($fp)	# fill _tmp688 to $t2 from $fp-24
	  sw $t2, -12($fp)	# spill house from $t2 to $fp-12
	# PushParam house
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill house to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp690 = *(house)
	  lw $t0, -12($fp)	# fill house to $t0 from $fp-12
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -32($fp)	# spill _tmp690 from $t2 to $fp-32
	# _tmp691 = *(_tmp690)
	  lw $t0, -32($fp)	# fill _tmp690 to $t0 from $fp-32
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -36($fp)	# spill _tmp691 from $t2 to $fp-36
	# ACall _tmp691
	  lw $t0, -36($fp)	# fill _tmp691 to $t0 from $fp-36
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam house
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill house to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp692 = *(house)
	  lw $t0, -12($fp)	# fill house to $t0 from $fp-12
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -40($fp)	# spill _tmp692 from $t2 to $fp-40
	# _tmp693 = *(_tmp692 + 4)
	  lw $t0, -40($fp)	# fill _tmp692 to $t0 from $fp-40
	  lw $t2, 4($t0) 	# load with offset
	  sw $t2, -44($fp)	# spill _tmp693 from $t2 to $fp-44
	# ACall _tmp693
	  lw $t0, -44($fp)	# fill _tmp693 to $t0 from $fp-44
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L161:
	# IfZ keepPlaying Goto _L162
	  lw $t0, -8($fp)	# fill keepPlaying to $t0 from $fp-8
	  beqz $t0, _L162	# branch if keepPlaying is zero 
	# PushParam house
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill house to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp694 = *(house)
	  lw $t0, -12($fp)	# fill house to $t0 from $fp-12
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -48($fp)	# spill _tmp694 from $t2 to $fp-48
	# _tmp695 = *(_tmp694 + 24)
	  lw $t0, -48($fp)	# fill _tmp694 to $t0 from $fp-48
	  lw $t2, 24($t0) 	# load with offset
	  sw $t2, -52($fp)	# spill _tmp695 from $t2 to $fp-52
	# ACall _tmp695
	  lw $t0, -52($fp)	# fill _tmp695 to $t0 from $fp-52
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp696 = "\nDo you want to play another hand?"
	  .data			# create string constant marked with label
	  _string66: .asciiz "\nDo you want to play another hand?"
	  .text
	  la $t2, _string66	# load label
	  sw $t2, -56($fp)	# spill _tmp696 from $t2 to $fp-56
	# PushParam _tmp696
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -56($fp)	# fill _tmp696 to $t0 from $fp-56
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp697 = LCall _GetYesOrNo
	  jal _GetYesOrNo    	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -60($fp)	# spill _tmp697 from $t2 to $fp-60
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# keepPlaying = _tmp697
	  lw $t2, -60($fp)	# fill _tmp697 to $t2 from $fp-60
	  sw $t2, -8($fp)	# spill keepPlaying from $t2 to $fp-8
	# Goto _L161
	  b _L161		# unconditional branch
  _L162:
	# PushParam house
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill house to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp698 = *(house)
	  lw $t0, -12($fp)	# fill house to $t0 from $fp-12
	  lw $t2, 0($t0) 	# load with offset
	  sw $t2, -64($fp)	# spill _tmp698 from $t2 to $fp-64
	# _tmp699 = *(_tmp698 + 20)
	  lw $t0, -64($fp)	# fill _tmp698 to $t0 from $fp-64
	  lw $t2, 20($t0) 	# load with offset
	  sw $t2, -68($fp)	# spill _tmp699 from $t2 to $fp-68
	# ACall _tmp699
	  lw $t0, -68($fp)	# fill _tmp699 to $t0 from $fp-68
	  jalr $t0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp700 = "Thank you for playing...come again soon.\n"
	  .data			# create string constant marked with label
	  _string67: .asciiz "Thank you for playing...come again soon.\n"
	  .text
	  la $t2, _string67	# load label
	  sw $t2, -72($fp)	# spill _tmp700 from $t2 to $fp-72
	# PushParam _tmp700
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -72($fp)	# fill _tmp700 to $t0 from $fp-72
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp701 = "\nCS143 BlackJack Copyright (c) 1999 by Peter Mor..."
	  .data			# create string constant marked with label
	  _string68: .asciiz "\nCS143 BlackJack Copyright (c) 1999 by Peter Mork.\n"
	  .text
	  la $t2, _string68	# load label
	  sw $t2, -76($fp)	# spill _tmp701 from $t2 to $fp-76
	# PushParam _tmp701
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -76($fp)	# fill _tmp701 to $t0 from $fp-76
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp702 = "(2001 mods by jdz)\n"
	  .data			# create string constant marked with label
	  _string69: .asciiz "(2001 mods by jdz)\n"
	  .text
	  la $t2, _string69	# load label
	  sw $t2, -80($fp)	# spill _tmp702 from $t2 to $fp-80
	# PushParam _tmp702
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -80($fp)	# fill _tmp702 to $t0 from $fp-80
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
