#!/bin/bash

# Quick debug script for individual samples
# Usage: ./debug_sample.sh <sample_name>

if [ $# -eq 0 ]; then
    echo "Usage: $0 <sample_name>"
    echo "Example: $0 t8"
    exit 1
fi

SAMPLE=$1

if [ ! -f "samples/$SAMPLE.decaf" ]; then
    echo "Error: samples/$SAMPLE.decaf not found"
    exit 1
fi

echo "======================================"
echo "Debugging: $SAMPLE"
echo "======================================"
echo ""

echo "1. Source code:"
echo "--------------------------------------"
cat -n "samples/$SAMPLE.decaf"
echo ""

echo "2. Compiling..."
echo "--------------------------------------"
if ./dcc < "samples/$SAMPLE.decaf" > "/tmp/$SAMPLE.asm" 2>&1; then
    echo "✓ Compilation successful"
    echo ""
    
    echo "3. Generated assembly (first 50 lines):"
    echo "--------------------------------------"
    head -50 "/tmp/$SAMPLE.asm"
    echo "... (see /tmp/$SAMPLE.asm for full output)"
    echo ""
    
    echo "4. Running with SPIM..."
    echo "--------------------------------------"
    timeout 3 spim -file "/tmp/$SAMPLE.asm" 2>&1 | head -50
    if [ $? -eq 124 ]; then
        echo ""
        echo "⚠️  Program timed out after 3 seconds"
    fi
    echo ""
    
    if [ -f "samples/$SAMPLE.out" ]; then
        echo "5. Expected output:"
        echo "--------------------------------------"
        cat "samples/$SAMPLE.out"
        echo ""
    fi
else
    echo "✗ Compilation failed"
    echo ""
    echo "Error output:"
    echo "--------------------------------------"
    cat "/tmp/$SAMPLE.asm"
fi

echo ""
echo "======================================"
echo "Debug files saved in /tmp/$SAMPLE.asm"
echo "======================================"
