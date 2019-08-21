"setlocal foldnestmax=3
"set omnifunc=syntaxcomplete#Complete
set foldmethod=marker
set foldmarker={,}
set foldtext=substitute(getline(v:foldstart),'{.*','{...}',)
set foldlevelstart=2 
set foldnestmax=4

"let g:syntastic_check_on_open=1
"let g:syntastic_enable_signs=1
"let g:syntastic_cpp_check_header=1
"let g:syntastic_cpp_compiler='g++'
"let g:syntastic_cpp_compiler_options=' -std=c++11 -stdlib=libc++'
