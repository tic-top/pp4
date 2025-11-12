#!/bin/bash

# P4 Code Generation Test Script
# Tests all sample files and generates detailed report

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

PASS_COUNT=0
FAIL_COUNT=0
COMPILE_FAIL_COUNT=0

echo "======================================"
echo "P4 Code Generation - Test All Samples"
echo "======================================"
echo ""

# Make sure we have the compiler
if [ ! -f "./dcc" ]; then
    echo "Error: ./dcc not found. Please run 'make' first."
    exit 1
fi

# Create output directory
mkdir -p test_results

# Test each sample
for sample in samples/*.decaf; do
    base=$(basename "$sample" .decaf)
    echo -n "Testing $base... "
    
    # Skip if no expected output file (except for bad* tests)
    if [[ ! "$base" =~ ^bad ]] && [ ! -f "samples/$base.out" ]; then
        # Still test it, but note no expected output
        :
    fi
    
    # Compile
    if ./dcc < "$sample" > "test_results/$base.asm" 2>&1; then
        echo -n "[COMPILED] "
        
        # Check if this is a "bad" test that should fail
        if [[ "$base" =~ ^bad ]]; then
            if [ "$base" == "badlink" ]; then
                echo -e "${YELLOW}EXPECTED FAIL (no main)${NC}"
                continue
            fi
        fi
        
        # Run with timeout
        timeout 2 spim -file "test_results/$base.asm" > "test_results/$base.out" 2>&1
        exit_code=$?
        
        if [ $exit_code -eq 124 ]; then
            echo -e "${RED}TIMEOUT${NC}"
            FAIL_COUNT=$((FAIL_COUNT + 1))
        elif [ $exit_code -ne 0 ]; then
            # Check if it's expected error (bad* tests)
            if [[ "$base" =~ ^bad ]]; then
                echo -e "${GREEN}PASS (expected error)${NC}"
                PASS_COUNT=$((PASS_COUNT + 1))
            else
                echo -e "${RED}RUNTIME ERROR${NC}"
                FAIL_COUNT=$((FAIL_COUNT + 1))
            fi
        else
            # Compare output if expected output exists
            if [ -f "samples/$base.out" ]; then
                # Strip SPIM header from both files
                grep -v "^SPIM\|^Copyright\|^All Rights\|^See the\|^Loaded:" "test_results/$base.out" > "test_results/$base.clean"
                grep -v "^SPIM\|^Copyright\|^All Rights\|^See the\|^Loaded:" "samples/$base.out" > "test_results/$base.expected"
                
                if diff -q "test_results/$base.clean" "test_results/$base.expected" > /dev/null 2>&1; then
                    echo -e "${GREEN}PASS${NC}"
                    PASS_COUNT=$((PASS_COUNT + 1))
                else
                    echo -e "${YELLOW}OUTPUT MISMATCH${NC}"
                    echo "  Expected vs Actual:"
                    diff "test_results/$base.expected" "test_results/$base.clean" | head -5
                    FAIL_COUNT=$((FAIL_COUNT + 1))
                fi
            else
                # No expected output, just check if it ran
                if grep -q "undefined" "test_results/$base.out"; then
                    echo -e "${YELLOW}UNDEFINED SYMBOLS${NC}"
                    grep "undefined" "test_results/$base.out" | head -3
                    FAIL_COUNT=$((FAIL_COUNT + 1))
                elif [ -s "test_results/$base.out" ]; then
                    echo -e "${GREEN}RAN (no expected output)${NC}"
                    PASS_COUNT=$((PASS_COUNT + 1))
                else
                    echo -e "${YELLOW}NO OUTPUT${NC}"
                    FAIL_COUNT=$((FAIL_COUNT + 1))
                fi
            fi
        fi
    else
        # Compilation failed
        if [ "$base" == "badlink" ]; then
            echo -e "${GREEN}EXPECTED FAIL (no main)${NC}"
            PASS_COUNT=$((PASS_COUNT + 1))
        else
            echo -e "${RED}COMPILE FAILED${NC}"
            grep -i "error\|failure" "test_results/$base.asm" | head -2
            COMPILE_FAIL_COUNT=$((COMPILE_FAIL_COUNT + 1))
            FAIL_COUNT=$((FAIL_COUNT + 1))
        fi
    fi
done

echo ""
echo "======================================"
echo "Summary:"
echo "======================================"
echo -e "${GREEN}Passed: $PASS_COUNT${NC}"
echo -e "${RED}Failed: $FAIL_COUNT${NC}"
echo -e "Compile Failures: $COMPILE_FAIL_COUNT"
TOTAL=$((PASS_COUNT + FAIL_COUNT))
echo "Total: $TOTAL"
echo ""

# Generate detailed report
cat > test_results/summary.txt << SUMMARY
P4 Code Generation Test Results
================================

Date: $(date)

Passed: $PASS_COUNT
Failed: $FAIL_COUNT
Compile Failures: $COMPILE_FAIL_COUNT
Total: $TOTAL

Success Rate: $(echo "scale=1; $PASS_COUNT * 100 / $TOTAL" | bc)%

Detailed Results:
SUMMARY

for sample in samples/*.decaf; do
    base=$(basename "$sample" .decaf)
    if [ -f "test_results/$base.asm" ]; then
        echo "$base: Compiled" >> test_results/summary.txt
    else
        echo "$base: Compile Failed" >> test_results/summary.txt
    fi
done

echo "Detailed results saved to test_results/summary.txt"
echo "Individual outputs in test_results/"
