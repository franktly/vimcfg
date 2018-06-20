dir /b *.c,*.cpp,*.h,*.hpp,*.cc,*.cxx > cscope.files
cscope -bkq -i cscope.files
ctags -R
