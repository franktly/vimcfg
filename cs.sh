#! /usr/bin/env bash
find . -name "*.h" -o -name "*.hpp" -o -name "*.c" -o -name "*.cxx" -o -name "*.cpp" -o -name "*.cu" > cscope.files
cscope -bkq -i cscope.files
ctags -R
