" vim:fdm=marker
set nocompatible
filetype off

" Plugins  {{{1

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'easymotion/vim-easymotion'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vlaadbrain/gnuplot.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'lervag/vimtex'
"Plugin 'klen/python-mode'
Plugin 'tmhedberg/SimpylFold.git'
"Plugin 'sjl/foldtext.vim'
"Plugin 't9md/vim-foldtext'

Plugin 'WolfgangMehner/c-support'
"Plugin 'dahu/VimLint'

" CtrlP  {{{2
Plugin 'kien/ctrlp.vim'

" Use a leader instead of the actual named binding
nmap <C-p> :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" tmux-navigator {{{2
"Plugin 'christoomey/vim-tmux-navigator' 
"let g:tmux_navigator_no_mappings = 1

"nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
"nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
"nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
"nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
"nnoremap <silent> <M-/> :TmuxNavigatePrevious<cr>

" vim-online-thesaurus {{{2
Plugin 'beloglazov/vim-online-thesaurus'
let g:online_thesaurus_map_keys = 0
nnoremap <leader>th :OnlineThesaurusCurrentWord<CR>

" syntastic {{{2
Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" General
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_mode_map = { 'mode': 'active', 
            \'active_filetypes': ["python", "cpp"],
            \'passive_filetypes': ["tex"] }
"nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" CPP
"let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_cpp_compiler_options = '-std=c++14 -Wall -Wextra -pedantic -fopenmp'
let g:syntastic_cpp_check_header = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
"let g:syntastic_cpp_checkers = ['clang_check', 'gcc']
"
" Python
let g:syntastic_python_checkers = ["python"]
"let g:syntastic_python_python_quiet_messages = {
    "\ "type":  "style",
    "\ "regex": '\m\[C03\d\d\]' }

" Folding {{{2
Plugin 'Konfekt/FastFold'
let g:tex_fold_enabled=1
let g:vimsyn_folding='af'
let g:xml_syntax_folding = 1
let g:php_folding = 1
let g:perl_fold = 1
function! NeatFoldText() "{{{3
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()
" }}}3

" neocomplete {{{2
if has('lua')
    " neocomplete setup
    Plugin 'Shougo/neocomplete'
    Plugin 'Shougo/neosnippet'
    Plugin 'Shougo/neosnippet-snippets'
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 2
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save et ndent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
        return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
        " For no inserting <CR> key.
        "return pumvisible() ? "\<C-y>" : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    "Remove little doc split on top
    "set completion-=preview
    let g:neocomplete#enable_auto_close_preview=1   

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    " TODO slow with pymode:
    "autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

    " Neosnippet Plugin key-mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)

    " SuperTab like snippets behavior.
    "imap <expr><TAB>
    " \ pumvisible() ? "\<C-n>" :
    " \ neosnippet#expandable_or_jumpable() ?
    " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

    " For conceal markers.
    if has('conceal')
        set conceallevel=2 concealcursor=niv
    endif
end

" indentline {{{2
Plugin 'Yggdroot/indentLine'
let g:indentLine_enabled=1
let g:indentLine_color_term=234
"let g:indentLine_color_term=239
let g:indentLine_char="|"
"let g:indentLine_char="¦"
let g:indentLine_indentLevel=20 

call vundle#end()


" Settings {{{1

filetype indent plugin on

" Enable syntax highlighting
syntax enable

" save automatically, i.e. on make
set autowrite

" solarized color sheme
colorscheme solarized
"colorscheme default
set background=dark
let g:solarized_visibility="low" 

" set spell checking
set spell spelllang=en_us
set nospell

" textwidth for automatic linewrap. disable: :set fo-=t
set textwidth=79
set formatoptions=tcq
set colorcolumn=79

" backup options
set directory=~/.backup/vim/swap//,./,/tmp//
set backupdir=~/.backup/vim/backup//,./,/tmp//
set undodir=~/.backup/vim/undo//,./,/tmp//

set hidden
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmode=longest,list,full
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
" set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Filetypes {{{1 
au BufNewFile,BufRead *.plt,*.gpt,*.gnuplot setf gnuplot

" Indentation options {{{2
set shiftwidth=4
set softtabstop=4
set expandtab

" statusline {{{2
set statusline=%m       "modified flag
set statusline+=%t      "tail of the filename
"set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
"set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=[%{&fo}] "format options
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" gvim {{{2
if has("gui_running")

    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar

    if has("gui_gtk2")
        set guifont=Inconsolata\ 14
    elseif has("gui_macvim")
        set guifont=Menlo\ Regular:h14
    elseif has("gui_win32")
        set guifont=Consolas:h11:cANSI
    endif
endif

" Mappings {{{1

let mapleader="\\"

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" indent whole file
nnoremap <TAB> mygg=G`yzz

" run current file
nnoremap "" :w <BAR> !clear && %:p<CR>

nnoremap <SPACE> :
"nnoremap ! :!

nnoremap <leader>vb :tabnew ~/.bashrc <CR>
nnoremap <leader>vr :tabnew ~/.vimrc <CR>
nnoremap <leader>rr :source ~/.vimrc <CR>

nnoremap <leader>nt :NERDTreeToggle <CR>

" folds
nnoremap <ESC><ESC> za
nnoremap z- zMzv

" fold by markers
set foldmethod=marker

" Exit insert mode more easily
inoremap <ESC> <ESC>l

" delete right char in ins mode
inoremap <C-L> <DEL>

" paste from clipboard
"nnoremap <C-S-V> i"+pl
inoremap <C-S-V> <C-R>+

" find and replace word under cursor
nnoremap <Leader>S :%s/\<<C-r><C-w>\>/

" go next in list
nnoremap <Leader>ln :lnext<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
"cmap w!! !sudo tee > /dev/null %

" Functions and Commands {{{1

" preserve state of editor while running command
function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" function to remove trailing whitespaces
function! TrimWhitespace()
    let l:save_cursor = getpos('.')
    %s/\s\+$//e
    call setpos('.', l:save_cursor)
endfunction
command! TrimWhitespace call Preserve(TrimWhitespace())

command! Dark :set background=dark
command! Light :set background=light

" compile file with xelatex
command! Xelatex :!xelatex %:p -synctex=1 -interaction=nonstopmode '%source'

command! Submit :w <bar> !qsub %:p

" Hacks {{{1
" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif
