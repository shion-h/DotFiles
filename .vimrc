colorscheme desert
set nocompatible	" Use Vim defaults (much better!)
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif
" タブページ
set tabpagemax=20
" タブ
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
" 内部バッファ
set encoding=utf-8
" 書き込み
set fileencoding=utf-8
" 読み込み
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8,utf-16
set fileformats=unix,dos,mac

set foldmethod=marker
set number
set timeout timeoutlen=3000 ttimeoutlen=100
highlight Normal ctermbg=none ctermfg=grey
highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=black
if has('unix')
	" Unix 用設定
    set clipboard=unnamedplus
endif
if has('mac')
	" Mac 用設定
    set clipboard=unnamed
endif
set ambiwidth=double

set smartindent
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
"""""""""""""""""""""""""""""
" imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
" imap < <><LEFT>
"""""""""""""""""""""""""""""
" 行を強調表示
"
set cursorline
" アンダーラインを引く(color terminal)
" highlight CursorLine cterm=NONE ctermfg=white ctermbg=black
" アンダーラインを引く(gui)
" highlight CursorLine gui=NONE guifg=white guibg=black

filetype off                   " required!


function! AddIndentWhenEnter()
    if getline(".")[col(".")-1] == "}" && getline(".")[col(".")-2] == "{"
        return "\n\t\n\<UP>\<END>"
    else
        return "\n"
    endif
endfunction
inoremap <silent> <expr> <CR> AddIndentWhenEnter()

if has('vim_starting')
    " cd %:h
    set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
    call dein#begin(expand('~/.vim/dein/'))
endif

call dein#add('vim-scripts/The-NERD-tree')
call dein#add('vim-scripts/auto-pairs')

"insert here your Neobundle plugins"
" call dein#add('scrooloose/nerdtree')
"call dein#add('tpope/vim-endwise')
" call dein#add('vim-scripts/AnsiEsc.vim')
" emphasize whitespaces in the end of sentences
call dein#add('bronson/vim-trailing-whitespace')

call dein#end()

inoremap <Tab> <C-n>
inoremap <S-Tab> <C-p>

"タブ移動
nnoremap s gt
nnoremap S gT

filetype plugin indent on

let g:indent_guides_enable_on_vim_startup = 1

autocmd BufNewFile,BufRead *.stan  set filetype=cpp
