"execute pathogen#infect()

set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
if has('win32') || has('win64')
	set rtp+=~/vimfiles/bundle/Vundle.vim/
	let path='~/vimfiles/bundle'
	call vundle#begin(path)
else
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
endif

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Allows auto-complete
Plugin 'ervandew/supertab'

" Allows easy way to surround texts with parentheses, brackets, quotes, etc.
Plugin 'surround.vim'

" Provides utility functions and commands for programming in Vim
Plugin 'L9'

" Lets rename current file on the disk
Plugin 'Rename'

" Colorschemes
Plugin 'Skittles-Berry'
Plugin 'molokai'

" Fuzzy finder
Plugin 'ctrlp.vim'

" Handy filesystem navigator
Plugin 'scrooloose/nerdtree'

" Git wrapper
Plugin 'tpope/vim-fugitive'

" Ruby and Ruby on Rails plugins
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'

" Supports auto-closing certain structures like adding end after def in Ruby
Plugin 'tpope/vim-endwise'

" SnipMate related plugins
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" The sparkup vim plugin is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim'}

" CoffeeScript support for vim
Plugin 'kchmck/vim-coffee-script'

" PHP related plugins
Plugin 'StanAngeloff/php.vim'
Plugin 'scrooloose/syntastic'
Plugin 'captbaritone/better-indent-support-for-php-with-html'

Plugin 'tpope/vim-commentary'

" Plugins to consider
"EasyMotion
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
set numberwidth=5
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
set relativenumber

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1
let g:syntastic_enable_balloons = 1
let g:syntastic_php_checkers = ['php']

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

" Highlight PHP @tags and $parameters in comments
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" Set different tab settings for different languages
autocmd FileType php setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
