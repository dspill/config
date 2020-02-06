setlocal fo-=t
setlocal foldmethod=indent
set foldlevel=99

nnoremap <buffer> "" :w <BAR> !python3 %:p<CR>

if exists('g:pymode_lint')
    let g:pymode_lint = 0
    let g:pymode_lint_on_write = 0
endif



" Syntastic
if exists("g:loaded_syntastic_plugin")
    let g:syntastic_python_python_exec = '/usr/bin/env python3'
    "let g:syntastic_python_checkers = ["python", "pylint", "pyflakes"]
    let g:syntastic_python_checkers = ["pylint"]
    "let g:syntastic_python_pylint_quiet_messages = {
                "\ "regex": ['Anomalous backslash', 'naming style', 'Too many',
                "\ 'Unable to import', 'docstring', 'continued indentation',
                "\ 'Exactly one space', 'snake_case', 'invalid name', 
                "\'Missing function docstring', 'xrange', 
                "\'too-few-public-methods']
                "\}

    "let g:syntastic_python_pyflakes_quiet_messages = {
                "\ "regex": ['xrange']
                "\}
endif
