" Modified for GSL

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

" Some preliminary settings
setlocal autoindent	" indentexpr isn't much help otherwise
