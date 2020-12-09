" vim: foldmethod=marker:

" set indentation width
setlocal shiftwidth=2
setlocal softtabstop=2

" view linebreak etc
setlocal list

" add underscore as word boundary
setlocal iskeyword-=_

setlocal foldlevel=2
let b:solarized_visibility="low"    "default value is normal

setlocal spell

" deoplete integration {{{1
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
  \})

" ALE {{{1
let b:ale_tex_chktex_options = '-I -n 3'
let b:ale_fixers = [
\   'latexindent',
\   'remove_trailing_lines',
\   'trim_whitespace',
\]
let b:ale_fix_on_save = 1

" vimtex settings {{{1
" indenting
let g:vimtex_indent_delims = {
            \ 'open' : ['{', '[', '(', '\qty[', '\qty(', '\qty{'],
            \ 'close' : ['}', ']', ')'],
            \ 'close_indented' : 0,
            \ 'include_modified_math' : 1,
            \}

" viewing
let g:vimtex_view_general_viewer = 'firejail --noprofile okular'
let g:vimtex_view_general_options = '--unique @pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

" compiling
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
let g:vimtex_quickfix_open_on_warning=0
" Disable custom warnings based on regexp
let g:vimtex_quickfix_ignore_filters = [
      \ 'Marginpar on page',
      \ 'LaTeX Warning: Font shape declaration has incorrect series value',
      \ 'LaTeX Warning: Command \\under',
      \]

let g:vimtex_quickfix_autoclose_after_keystrokes=2

let g:tex_conceal = ""
let g:vimtex_indent_on_ampersands="0"
" maps {{{2
let maplocalleader="\\"
nnoremap <buffer> <leader>co :copen<cr>G
nnoremap <buffer> <leader>vc :VimtexClean<cr>

" imaps {{{2
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
