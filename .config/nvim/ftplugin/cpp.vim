"setlocal foldnestmax=3
"set omnifunc=syntaxcomplete#Complete
set foldmethod=marker
set foldmarker={,}
set foldtext=substitute(getline(v:foldstart),'{.*','{...}',)
set foldlevelstart=2 
set foldnestmax=4

if exists("g:loaded_syntastic_plugin")
    "let g:syntastic_check_on_open=1
    "let g:syntastic_enable_signs=1
    "let g:syntastic_cpp_compiler_options=' -std=c++11 -stdlib=libc++'
    "let g:syntastic_cpp_compiler = 'gcc'
    let g:syntastic_cpp_compiler_options = '-std=c++17 -Wall -Wextra -pedantic -fopenmp'
    let g:syntastic_cpp_check_header = 1
    "let g:syntastic_cpp_checkers = ['clang_check', 'gcc']
    let g:syntastic_cpp_checkers = ['gcc']
    let g:syntastic_cpp_include_dir=['lib']
endif
