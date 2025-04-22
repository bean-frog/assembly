#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <filename.asm>"
    exit 1
fi
# get filename
input_file="$1"
base_name="${input_file%.*}"

# assemble with nasm
nasm -f elf64 -o "${base_name}.o" "$input_file"
if [ $? -ne 0 ]; then
    echo "NASM assembly failed."
    exit 1
fi

# link with ld
ld -o "$base_name" "${base_name}.o"
if [ $? -ne 0 ]; then
    echo "LD linking failed."
    exit 1
fi

./$base_name
