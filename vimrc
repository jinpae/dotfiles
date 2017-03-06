set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
if has('win32') || has('win64')
	set rtp+=~/vimfiles/bundle/Vundle.vim/
	let path='~/vimfiles/bundle'
	call vundle#begin(path)
else
	set rtp+=$HOME/.vim/bundle/Vundle.vim
	call vundle#begin()
endif

Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
Plugin 'Rename'
Plugin 'rstacruz/sparkup', {'rtp': 'vim'}
Plugin 'ctrlp.vim'
Plugin 'surround.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tomtom/tcomment_vim'
Plugin 'junegunn/goyo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdtree'

Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-endwise'

Plugin 'pangloss/vim-javascript'
Plugin 'vim-scripts/JavaScript-Indent'
Plugin 'nicklasos/vim-jsx-riot'
Plugin 'alvan/vim-closetag'
Plugin 'tmhedberg/matchit'
Plugin 'ternjs/tern_for_vim'
Plugin 'Valloric/YouCompleteMe'

Plugin 'crusoexia/vim-monokai'
Plugin 'morhetz/gruvbox'
Plugin 'junegunn/seoul256.vim'

call vundle#end()

set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

colorscheme seoul256
" set background=dark
" let g:solarized_termcolors=256

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
set expandtab
set wildmode=longest,list,full
set wildmenu
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
set relativenumber
set omnifunc=syntaxcomplete#Complete
set clipboard=unnamed

let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'
let g:javascript_plugin_jsdoc=1

filetype plugin indent on
syntax enable

set laststatus=2
" let g:Powerline_symbols='fancy'

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

" Set different tab settings for different languages
autocmd FileType php setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType javascript setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

au BufNewFile,BufRead *.tag setlocal ft=javascript
