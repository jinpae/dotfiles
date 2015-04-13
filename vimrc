"execute pathogen#infect()

set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
if has('win32') || has('win64')
	set rtp+=$USERPROFILE\vimfiles\bundle\Vundle.vim
	let s:path=escape($USERPROFILE . '\vimfiles\bundle', ' ')
	call vundle#begin(s:path)
else
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
endif

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Allows auto-complete
Plugin 'ervandew/supertab'

" Allows easy way to surround texts with parentheses, brackets, quotes, etc.
Plugin 'surround.vim'

" Provides utility functions and commands for programming in Vim
Plugin 'L9'

" Lets rename current file on the disk
Plugin 'Rename'

" Colorscheme
Plugin 'Skittles-Berry'
Plugin 'molokai'

" Fuzzy finder
Plugin 'ctrlp.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'thoughtbot/vim-rspec'

" SnipMate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Plugins to consider
"EasyMotion
"Sparkup
"tComment

call vundle#end()

set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

colorscheme skittles_berry
"let g:solarized_termcolors=256

set encoding=utf-8
set history=1000
set vb
set cursorline
set incsearch
set hlsearch
set autoindent
set smartindent
set backspace=indent,eol,start
set number
set ruler
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set wildmode=longest,list,full
set wildmenu
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

filetype plugin indent on
syntax enable

"set laststatus=2
"let g:Powerline_symbols='fancy'

" Set mapleader to , instead of \
"let mapleader=","

" Disable the arrow keys
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

"========================
" Custom Mappings
"========================
" Tab navigation
nmap <C-t> :tabnew<CR>
nmap <C-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabprevious<CR>

" Line movement
nmap <A-j> ddp
nmap <A-k> ddkP

" Pair helpers
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i
imap <leader>{ {}<ESC>i
imap <leader>< <><ESC>i

nmap <C-CR> o<ESC>
nmap <C-S-CR> O<ESC>

" Run current Ruby file
nmap <leader>rr :!ruby<Space>%<CR>

" Run current RSpec file
nmap <leader>rs :!rspec<Space>%<Space>--color<Space>--format<Space>doc<CR>

" Select all text
nmap <C-a> ggvG$

" Indent selected line or block of text in visual mode
vmap <TAB> <S-i><C-t><ESC><S-^>
vmap <S-TAB> <S-i><C-d><ESC><S-^>

" RSpec.vim mappings
map <leader>t :call RunCurrentSpecFile()<CR>
map <leader>s :call RunNearestSpec()<CR>
map <leader>l :call RunLastSpec()<CR>
map <leader>a :call RunAllSpecs()<CR>

" Insert line below current line
imap <S-CR> <ESC>o

" Toggle NerdTree sidebar
map <C-n> :NERDTreeToggle<CR>

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Open a NERDTree automatically when vim starts if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
