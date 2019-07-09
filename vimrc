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
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'mhartington/oceanic-next'
Plug 'haishanh/night-owl.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
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

" Move between ALE warnings and errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Allow JSX in .js files
let g:jsx_ext_required = 0

" Prettier configuration
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#parser = 'babylon'

" Run Prettier asynchronously before saving
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

colorscheme night-owl
