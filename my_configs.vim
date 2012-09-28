"Display incomplete command
set showcmd

"for 'gg=G' to avoid indenting one-line return value, ie: t0
set cino=:0,t0,g0

"80 columns limit
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/ 

