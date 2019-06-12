setlocal fo-=t
"setlocal fdm=marker
set foldmethod=indent
set foldlevel=99

"nnoremap <buffer> "" :w <BAR> !clear && mpirun -n $(nproc) python %:p<CR>
"nnoremap <buffer> "" :w <BAR> !mpirun -n $(nproc) python %:p<CR>
nnoremap <buffer> "" :w <BAR> !python3 %:p<CR>

" old pymode settings
"dont show error if line too long
"let g:pymode_lint_ignore = "C901,E501,W0401,E221"
"let g:pymode_rope=0
"let g:pymode_rope_completion=0
"let g:pymode_rope_regenerate_on_write=0

"let g:pymode_lint_ignore = "E203,E731,W0611,C901,E501,W0401,E221"

"dont show documentation automatically
"let g:pymode_doc = 0

 "run script
"let g:pymode_run=1
"let g:pymode_run_bind = '<leader>ll'

"setlocal textwidth=0
