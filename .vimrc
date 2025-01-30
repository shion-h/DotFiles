colorscheme desert
set tabpagemax=20 " the max number of tab pages
set tabstop=4 " set a tab width same as 4 spaces (when writing)
set shiftwidth=4 " set a tab width same as 4 spaces (when reading files)
set expandtab " regard tabs as spaces
set autoindent " put indents automatically
set smartindent " put C language-like indents automatically (autoindent is needed)
" Inner buffer
set encoding=utf-8
" Write
set fileencoding=utf-8
" Read
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8,utf-16
set fileformats=unix,dos,mac
set foldmethod=marker " use folding marked by "{{{,}}}"
set number " enable line number
" set timeout timeoutlen=3000 ttimeoutlen=100
" highlight Normal ctermbg=none ctermfg=grey
" highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey
" highlight CursorLine term=none cterm=none ctermfg=none ctermbg=black
if has('unix')
	" For linux
    set clipboard=unnamedplus
endif
if has('mac')
	" For mac
    set clipboard=unnamed
endif
set ambiwidth=double " to display correctly 2 byte character such as "あ"
set bs=indent,eol,start " allow backspacing over everything in insert mode
set nobackup " does not keep a backup file (extension .~)
set viminfo='20,\"50 " read/write a .viminfo file, don't store more than 50 lines of registers
set history=50 " keep 50 lines of command line history
set ruler " show the cursor position in the right bottom all the time
set cursorline " show cursor line
set incsearch " enable incremental search
set hlsearch " enable highlight search, which highlights all words when searching
" 
" " Switch syntax highlighting on, when the terminal has colors
" " Also switch on highlighting the last used search pattern.
" if &t_Co > 2 || has("gui_running")
"   syntax on
"   set hlsearch
" endif
" 
filetype plugin on " set filetype detection (filetype detection:ON  plugin:ON  indent:OFF)
" 
" if &term=="xterm"
"      set t_Co=8
"      set t_Sb=[4%dm
"      set t_Sf=[3%dm
" endif
" 
" " Don't wake up system with blinking cursor:
" " http://www.linuxpowertop.org/known.php
" let &guicursor = &guicursor . ",a:blinkon0"
" 
" " Set underline (color terminal)
" " highlight CursorLine cterm=NONE ctermfg=white ctermbg=black
" " Set underline (gui)
" " highlight CursorLine gui=NONE guifg=white guibg=black
" 
" filetype off                   " required!
" 
" 

autocmd BufNewFile,BufRead *.stan  set filetype=cpp

"""""""""""""Key mapping"""""""""""""
nnoremap vv <c-v>
nnoremap U <c-r>
nnoremap ( <c-u>
nnoremap ) <c-d>
nnoremap e <c-w>
nnoremap ee <c-w>w

"""""""""""""""""""""""""""""""""""""
" input close brace automatically
"""""""""""""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
imap < <><LEFT>
"""""""""""""""""""""""""""""""""""""
" For C/C++ language
"""""""""""""""""""""""""""""""""""""
function! AddIndentWhenEnter()
    if getline(".")[col(".")-1] == "}" && getline(".")[col(".")-2] == "{"
        return "\n\t\n\<UP>\<END>"
    else
        return "\n"
    endif
endfunction
inoremap <silent> <expr> <CR> AddIndentWhenEnter()
"""""""""""""""""""""""""""""""""""""
