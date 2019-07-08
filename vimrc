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
set cursorline
set incsearch
set hlsearch
set signcolumn=yes

" Install Vim Plug, a vim plugin manager, if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'haishanh/night-owl.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'mhartington/oceanic-next'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
call plug#end()

nmap <C-CR> o<Esc>
nmap <C-S-CR> O<Esc>
nmap <C-a> ggvG$

nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Prettier configuration
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#parser = 'babylon'

" Run Prettier asynchronously before saving
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

colorscheme night-owl
