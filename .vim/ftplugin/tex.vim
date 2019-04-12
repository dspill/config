" vim: foldmethod=marker:

" set indentation width
set shiftwidth=2
set softtabstop=2

" view linebreak etc
setlocal list
let g:solarized_visibility="low"    "default value is normal

setlocal spell

" cleaner folding
set fillchars="vert:|,fold:\\"

" vimtex {{{1
let g:tex_flavor = 'latex'

"let g:vimtex_view_method = 'mupdf'
"let g:vimtex_view_mupdf_send_keys = 'W' 
"let g:vimtex_view_general_options = '--unique @pdf\#src:@line@tex'

let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique @pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

"let g:vimtex_view_general_viewer = 'zathura'
"let g:vimtex_view_method = 'zathura'

let g:vimtex_latexmk_options="-pdf -pdflatex='pdflatex -file-line-error -shell-escape -synctex=1'"
let g:vimtex_imaps_leader="`"
let g:vimtex_fold_enabled=1
let g:vimtex_fold_comments=1

let g:vimtex_quickfix_mode=0
"let g:vimtex_quickfix_autojump=1
let g:vimtex_quickfix_open_on_warning=0
let g:vimtex_quickfix_warnings = {
      \ 'overfull' : 0,
      \ 'underfull' : 0,
      \ 'packages' : {
      \   'default' : 0,
      \ },
      \}
"let g:vimtex_quickfix_ignored_warnings = [
"\ 'Underfull',
"\ 'Overfull',
"\ 'specifier changed to',
"\ 'Unused global option(s)',
"\ 'fancyhdr',
"\ 'titlesec',
"\ 'Title has more then 3 lines',
"\ 'xparse/redefine-command',
"\ 'Hyperref warning: Token not allowed'
"\ ]

let maplocalleader="\\"
let g:tex_conceal = ""

" neocomplete with vimtex {{{2
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.tex =
      \ '\v\\%('
      \ . '\a*cite\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
      \ . '|hyperref\s*\[[^]]*'
      \ . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|%(include%(only)?|input)\s*\{[^}]*'
      \ . '|\a*(gls|Gls|GLS)(pl)?\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|includepdf%(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|includestandalone%(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . ')'

" custom mappings {{{1
call vimtex#imaps#add_map({
      \ 'lhs' : '^',
      \ 'rhs' : '^{',
      \ 'leader' : '`',
      \ 'wrapper' : 'vimtex#imaps#wrap_math'
      \})

call vimtex#imaps#add_map({
      \ 'lhs' : '_',
      \ 'rhs' : '_{',
      \ 'leader' : '`',
      \ 'wrapper' : 'vimtex#imaps#wrap_math'
      \})

nnoremap <buffer> <leader>co :copen<cr>G
