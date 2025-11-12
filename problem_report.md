# P4 Code Generation - Problem Report

## Summary
- **Compilation Success Rate**: 17/18 samples (94.4%)
- **Runtime Success Rate**: 10/18 samples (55.6%)
- **Main Issues**: Array operations and class method dispatch

---

## ✅ Working Samples (10/18)

### Basic Tests
- **t1**: Outputs "9hello" correctly
- **t4**: Outputs "5 110" correctly  
- **t6**: Compiles and runs successfully

### Error Handling
- **badnewarr**: Correctly detects "Array size is <= 0" runtime error
- **badsub**: Compiles and runs successfully

### Complex Programs
- **factorial**: Outputs correct factorial sequence (1! through 15!)
- **matrix**: Matrix operations working
- **queue**: Queue data structure working
- **stack**: Stack data structure working

---

## ❌ Failing Samples (8/18)

### 1. t2 - Infinite Loop with Bad Memory Access
**Symptom**: 
```
Exception occurred at PC=0x004002e8
Bad address in data/stack read: 0x00000004
Exception 7 [Bad data address] occurred and ignored
1
Exception occurred at PC=0x0040057c
Bad address in data/stack read: 0x00000008
... then infinite loop of bad instruction addresses ...
```

**Likely Cause**: 
- Array initialization or access issue
- Incorrect pointer/address calculation
- Possible issue with NewArray or ArrayAccess implementation

**File**: samples/t2.decaf
**Next Steps**: Check array allocation and access patterns in generated assembly

---

### 2. t3 - No Output
**Symptom**: Program compiles but produces no output

**Expected**: Should produce some output

**Likely Cause**: 
- Empty main function body
- Missing vtable initialization for classes
- Method not being called

**File**: samples/t3.decaf
**Next Steps**: Examine t3.decaf to see what it's supposed to do

---

### 3. t5 - Runtime Error/Timeout
**Symptom**: Program enters infinite loop or crashes

**Likely Cause**:
- Similar to t2, likely array-related
- Loop condition evaluation issue
- Memory access violation

**File**: samples/t5.decaf
**Next Steps**: Debug array/loop handling

---

### 4. t7 - No Output
**Symptom**: Program compiles but produces no output (similar to t3)

**Likely Cause**:
- Class initialization issue
- Missing method implementations
- VTable setup problem

**File**: samples/t7.decaf
**Next Steps**: Check class/method structure

---

### 5. t8 - Incorrect Output + Undefined Symbol
**Symptom**: 
```
The following symbols are undefined:
_Eat

mmm... veggies!
Yum! 0          <- Should be 1
But I don't like squash
50
```

**Expected Output**:
```
mmm... veggies!
Yum! 1
But I don't like squash
50
```

**Root Cause**: 
1. **Undefined symbol `_Eat`**: Class method not being generated with correct label
2. **Wrong value (0 vs 1)**: Expression `5 % 2` evaluating to 0 instead of 1

**Code Analysis**:
```cpp
// In t8.decaf line 18-19:
color = 5 % 2;
Print("Yum! ", color, "\n");
```

**Issues**:
- Method `Eat` is defined in `Vegetable` class but label `_Eat` not found
- Should be `_Vegetable.Eat` but code is looking for `_Eat`
- The modulo operation `5 % 2 = 1` but getting 0

**File**: samples/t8.decaf (see lines 14-22)
**Fix Needed**: 
- Ensure class methods generate correct labels (_ClassName.methodName)
- Check VTable generation in ClassDecl::Emit
- Verify method call dispatch in Call::Emit
- Debug modulo operator implementation

---

### 6. blackjack - Runtime Error
**Symptom**: Complex program with classes crashes at runtime

**Likely Cause**:
- Class method dispatch issues (similar to t8)
- VTable pointer corruption
- Method index calculation wrong

**File**: samples/blackjack.decaf
**Next Steps**: Fix class method issues first (t8), then retry

---

### 7. fib - Runtime Error/Timeout  
**Symptom**: Fibonacci program times out or crashes

**Likely Cause**:
- Recursive function call issue
- Stack frame corruption
- Return value handling problem

**File**: samples/fib.decaf
**Next Steps**: Check recursive call and return handling

---

### 8. sort - Runtime Error
**Symptom**: Sorting program crashes

**Likely Cause**:
- Array access in loops
- Complex array manipulation
- Similar issues to t2/t5

**File**: samples/sort.decaf
**Next Steps**: Fix array issues first, then retry

---

## Expected Failure (Correct Behavior)

### badlink - Missing main() Function
**Symptom**: Compilation fails with "*** Error."
**Status**: ✅ Correct - program has no main() function

---

## Key Problems to Fix

### Priority 1: Class Method Dispatch (t8, blackjack)
**Location**: `ast_expr.cc::Call::Emit()` and `ast_decl.cc::ClassDecl::Emit()`

**Current Issues**:
1. Method calls looking for wrong label (`_Eat` instead of `_Vegetable.Eat`)
2. VTable may not be correctly populated
3. Method index in vtable might be wrong

**Code to Review**:
```cpp
// ast_expr.cc lines 364-377
if (base != NULL) {
    // Method call through object
    Location *objLoc = base->Emit(cg);
    cg->GenPushParam(objLoc);
    Location *vtablePtr = cg->GenLoad(objLoc, 0);
    Location *methodAddr = cg->GenLoad(vtablePtr, 0);  // <- Wrong! Always uses offset 0
    result = cg->GenACall(methodAddr, true);
}
```

**Fix**: Need to calculate correct method index in vtable

---

### Priority 2: Array Operations (t2, t5, sort)
**Location**: `ast_expr.cc::ArrayAccess::Emit()` and `NewArrayExpr::Emit()`

**Current Issues**:
1. Array access causing bad memory addresses
2. Possible off-by-one errors in offset calculations
3. Array initialization might be wrong

**Code to Review**:
```cpp
// ast_expr.cc lines 284-322 (ArrayAccess)
// ast_expr.cc lines 405-439 (NewArrayExpr)
```

---

### Priority 3: Modulo Operator (t8)
**Location**: `ast_expr.cc::ArithmeticExpr::Emit()`

**Issue**: `5 % 2` returning 0 instead of 1

**Code to Review**:
```cpp
// ast_expr.cc lines 101-114
Location *ArithmeticExpr::Emit(CodeGenerator *cg) {
    // ...
    return cg->GenBinaryOp(op->GetTokenString(), leftLoc, rightLoc);
}
```

---

## Files Modified So Far

1. **codegen.h/cc**: Added VarDecl symbol table for type tracking
2. **ast_expr.cc**: 
   - Implemented all expression Emit() methods
   - Added relational operator transformations (<=, >=, >, !=)
3. **ast_stmt.cc**: 
   - Implemented all statement Emit() methods  
   - Added type-aware PrintStmt
4. **ast_decl.cc**: 
   - Implemented FnDecl and ClassDecl Emit()
   - Added VTable generation
5. **ast_decl.h**: Added GetType() to VarDecl

---

## Testing Results Matrix

| Sample     | Compile | Run | Output | Notes                        |
|------------|---------|-----|--------|------------------------------|
| t1         | ✅      | ✅  | ✅     | Working perfectly            |
| t2         | ✅      | ❌  | ❌     | Infinite loop, bad addresses |
| t3         | ✅      | ✅  | ❌     | No output                    |
| t4         | ✅      | ✅  | ✅     | Working perfectly            |
| t5         | ✅      | ❌  | ❌     | Runtime error/timeout        |
| t6         | ✅      | ✅  | ✅     | Working perfectly            |
| t7         | ✅      | ✅  | ❌     | No output                    |
| t8         | ✅      | ✅  | ⚠️     | Wrong value, undefined _Eat  |
| badlink    | ❌      | -   | -      | Expected fail (no main)      |
| badnewarr  | ✅      | ✅  | ✅     | Error detection works        |
| badsub     | ✅      | ✅  | ✅     | Working perfectly            |
| blackjack  | ✅      | ❌  | ❌     | Runtime error                |
| factorial  | ✅      | ✅  | ✅     | Working perfectly            |
| fib        | ✅      | ❌  | ❌     | Runtime error/timeout        |
| matrix     | ✅      | ✅  | ✅     | Working perfectly            |
| queue      | ✅      | ✅  | ✅     | Working perfectly            |
| sort       | ✅      | ❌  | ❌     | Runtime error                |
| stack      | ✅      | ✅  | ✅     | Working perfectly            |

---

## Next Steps for GPT-5

1. **Fix t8 method dispatch issue**:
   - Update Call::Emit() to find correct method index in vtable
   - Ensure ClassDecl::Emit() generates correct vtable entries
   - Fix method label lookup

2. **Debug t2 array issue**:
   - Check ArrayAccess bounds checking logic
   - Verify array allocation in NewArrayExpr
   - Test with simple array program first

3. **Investigate modulo operator**:
   - Verify `%` operator works in MIPS generation
   - Test standalone: `print(5 % 2)` should output 1

4. **Fix t3/t7 no output**:
   - Check what these programs should do
   - Verify class constructors if applicable

