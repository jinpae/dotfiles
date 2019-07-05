filetype plugin indent on

syntax enable

set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set number
set numberwidth=5
set relativenumber
set ruler
set cursorline
set incsearch
set hlsearch
set statusline=2

" Install Vim Plug, a vim plugin manager, if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'mhartington/oceanic-next'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
call plug#end()

nmap <C-CR> o<Esc>
nmap <C-S-CR> O<Esc>
nmap <C-a> ggvG$

colorscheme seoul256
