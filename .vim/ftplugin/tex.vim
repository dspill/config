" vim: foldmethod=marker:

" set indentation width
setlocal shiftwidth=2
setlocal softtabstop=2

" view linebreak etc
setlocal list

" add underscore as word boundary
setlocal iskeyword-=_

setlocal foldlevel=2
let g:solarized_visibility="low"    "default value is normal

setlocal spell

" syntastic {{{1
if exists("g:loaded_syntastic_plugin")
    let g:syntastic_tex_checkers = ['chktex']
    let g:syntastic_tex_chktex_quiet_messages = {
                \ "regex": [
                \ 'You should enclose the previous parenthesis with',
                \ 'Intersentence spacing .\+ should perhaps be used',
                \ 'You should put punctuation outside inner math mode'
                \],
                \ "file":  ['preamble.*\.tex']}
endif
                "\ 'You should enclose the previous', 
                "\ 'You should perhaps use',
                "\ 'vice', 'versa',

" vimtex {{{1
let g:tex_flavor = 'latex'

" indenting
let g:vimtex_indent_delims = {
            \ 'open' : ['{', '[', '(', '\qty[', '\qty(', '\qty{'],
            \ 'close' : ['}', ']', ')'],
            \ 'close_indented' : 0,
            \ 'include_modified_math' : 1,
            \}

" viewing
"let g:vimtex_view_method = 'mupdf'
"let g:vimtex_view_mupdf_send_keys = 'W' 
"let g:vimtex_view_general_options = '--unique @pdf\#src:@line@tex'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique @pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
"let g:vimtex_view_general_viewer = 'zathura'
"let g:vimtex_view_method = 'zathura'

" compiling
"let g:vimtex_latexmk_options="-pdf -pdflatex='pdflatex -file-line-error -shell-escape -synctex=1'"
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \   '-pdf',
    \   "-pdflatex='pdflatex -file-line-error -shell-escape -synctex=1'",
    \ ],
    \}
let g:vimtex_imaps_leader="`"

"folding
let g:vimtex_fold_enabled=1
let  g:vimtex_fold_types = {
            \ 'preamble' : {'enabled' : 0},
            \ 'comments' : {'enabled' : 1},
            \ }
setlocal fillchars="vert:|,fold:\\"
setlocal fdm=expr

let g:vimtex_quickfix_enabled=1
let g:vimtex_quickfix_mode=2
"let g:vimtex_quickfix_autojump=1
let g:vimtex_quickfix_open_on_warning=0
" Disable custom warnings based on regexp
let g:vimtex_quickfix_ignore_filters = [
      \ 'Marginpar on page',
      \]

let g:vimtex_quickfix_autoclose_after_keystrokes=2

let maplocalleader="\\"
let g:tex_conceal = ""

let g:vimtex_indent_on_ampersands="0"

" completion
" deoplete
"if exists('g:deoplete#loaded_deoplete')
    "call deoplete#custom#var('omni', 'input_patterns', {
                "\ 'tex': g:vimtex#re#deoplete
                "\})
"endif

"youcompleteme
if exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
    let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme
endif

" neocomplete
if exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
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
endif

" custom mappings {{{2
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

call vimtex#imaps#add_map({
            \ 'lhs' : '/',
            \ 'rhs' : '\frac{',
            \ 'leader' : '`',
            \ 'wrapper' : 'vimtex#imaps#wrap_math'
            \})

call vimtex#imaps#add_map({
            \ 'lhs' : '~',
            \ 'rhs' : '\tilde',
            \ 'leader' : '`',
            \ 'wrapper' : 'vimtex#imaps#wrap_math'
            \})

nnoremap <buffer> <leader>co :copen<cr>G
