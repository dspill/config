" vim:fdm=marker
filetype off
set nocompatible

" {{{1 Plugins
call plug#begin("~/.config/nvim/plugged")
Plug 'rhysd/vim-grammarous'
nnoremap <leader>gc :GrammarousCheck<cr>
nnoremap <leader>gr :GrammarousReset<cr>
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdcommenter'
" {{{2 hardtime
"Plug 'takac/vim-hardtime'
""let g:hardtime_default_on = 1
"let g:hardtime_allow_different_key = 1
"let g:hardtime_maxcount = 2
" {{{2 Tim Pope plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
" 2}}}
" thesaurus_query {{{2
Plug 'ron89/thesaurus_query.vim'
let g:tq_map_keys=0
"nnoremap <unique> <Leader>ot :ThesaurusQueryReplaceCurrentWord<CR>
"vnoremap <unique> <Leader>ot "ky:ThesaurusQueryReplace <C-r>k<CR>
nnoremap <LocalLeader>ot :ThesaurusQueryReplaceCurrentWord<CR>
vnoremap <LocalLeader>ot "ky:ThesaurusQueryReplace <C-r>k<CR>
" 2}}}
" vim-indent-guides {{{2
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 1
let g:indent_guides_color_change_percent = 20
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
" 2}}}
" {{{2 vimtex
Plug 'lervag/vimtex'
let g:vimtex_loaded = 1
let g:tex_flavor = 'latex'
" 2}}}
" {{{2 deoplete
if has("python3")
    "set pyxversion=3
    "set encoding=utf-8
    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
      Plug 'Shougo/deoplete.nvim'
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
    endif
    let g:deoplete#enable_at_startup = 1

    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

    " deoplete tab-complete
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

    " snippets
    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'Shougo/context_filetype.vim'
    Plug 'honza/vim-snippets'
    " Plugin key-mappings.
    " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)

    " SuperTab like snippets' behavior.
    " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
    imap <expr><TAB>
                \ pumvisible() ? "\<C-n>" :
                \ neosnippet#expandable_or_jumpable() ?
                \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
endif
" 2}}}
" {{{2 ALE
Plug 'dense-analysis/ale'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
nmap <leader>af <Plug>(ale_fix)
" 2}}}
call plug#end()
" 1}}}

" Settings {{{1
" Enable syntax highlighting
syntax enable

colorscheme solarized
if has('gui_running')
    set background=light
else
    set background=dark
endif
let g:solarized_visibility="low"

filetype indent plugin on

" show relative line numbers
set relativenumber

" always at least one line visible when scrolling
set scrolloff=1

" save automatically, i.e. on make
set autowrite

" set spell checking
set spell spelllang=en_us
set nospell

" textwidth for automatic linewrap. disable with: :set fo-=t
set textwidth=79
set formatoptions=tcq
set colorcolumn=+1

" backup options
set backup
set directory=$HOME/.backup/vim/swap//,.,/VAR/TMP/,/TMP
set backupdir=$HOME/.backup/vim/backup//,.,/var/tmp/,/tmp
set undodir=$HOME/.backup/vim/undo//,.,/var/tmp/,/tmp

"set hidden
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

" Filetypes {{{2
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

" Mappings {{{2
" timeoutlen is used for mapping delays, and ttimeoutlen is used for key code
" delays
set timeoutlen=1000 ttimeoutlen=0
let mapleader="\\"

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

nnoremap <leader>vr :tabnew ~/.vimrc <CR>
nnoremap <leader>rr :source ~/.vimrc <CR>
nnoremap <C-L> :nohl<CR><C-L>

" indent whole file
nnoremap <C-TAB> mygg=G`yzz

" run current file
nnoremap "" :w <BAR> !clear && %:p<CR>

nnoremap <SPACE> :
nnoremap <leader>vb :tabnew ~/.bashrc <CR>
nnoremap <leader>vr :tabnew ~/.config/nvim/init.vim <CR>
nnoremap <leader>rr :source ~/.config/nvim/init.vim <CR>

nnoremap <leader>nt :NERDTreeToggle <CR>
nnoremap <leader>tw :TrimWhitespace <CR>

" folds
nnoremap <ESC><ESC> za
" open fold containing the cursor
nnoremap z- zMzv 

" fold by markers
set foldmethod=marker

" delete right char in ins mode
inoremap <C-L> <DEL>

" paste from clipboard
"nnoremap <C-S-V> i"+pl
inoremap <C-S-V> <C-R>+

" find and replace word under cursor
nnoremap <Leader>S :%s/\<<C-r><C-w>\>/

" go next in list
nnoremap <Leader>ln :lnext<CR>

" Functions {{{2
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

" Commands {{{2
command! TrimWhitespace call Preserve(TrimWhitespace())

command! Dark :set background=dark
command! Light :set background=light

" compile file with xelatex
command! Xelatex :!xelatex %:p -synctex=1 -interaction=nonstopmode '%source'

command! Submit :w <bar> !qsub %:p

" Hacks {{{2
" Rename tabs to show tab number.
" (Based on
" http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
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
