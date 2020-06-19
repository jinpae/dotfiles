filetype plugin indent on

syntax enable

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
set backspace=indent,eol,start
set signcolumn=yes
set linebreak

" Install Vim Plug, a vim plugin manager, if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'haishanh/night-owl.vim'
Plug 'mhartington/oceanic-next'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

call plug#end()

if !has('gui_running')
  " Move between ALE warnings and errors
  nmap <silent> <C-x>j <Plug>(ale_previous_wrap)
  nmap <silent> <C-x>k <Plug>(ale_next_wrap)

  " Move lines and preserve indentation
  nnoremap <C-j> :m .+1<CR>==
  nnoremap <C-k> :m .-2<CR>==
  inoremap <C-j> <Esc>:m .+1<CR>==gi
  inoremap <C-k> <Esc>:m .-2<CR>==gi
  vnoremap <C-j> :m '>+1<CR>gv=gv
  vnoremap <C-k> :m '<-2<CR>gv=gv
endif

nmap <C-CR> o<Esc>
nmap <C-S-CR> O<Esc>
nmap <C-a> ggvG$

" Fuzzy finding files and contents
nnoremap <C-p> :Files<CR>
nnoremap <S-f> :Rg<CR>

" Toggle explore panel
nnoremap <C-n> :Lexplore<CR>

" Netrw
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 25

" Allow JSX in .js files
let g:jsx_ext_required = 0

" Prettier configuration
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#parser = 'babylon'

" Run Prettier asynchronously before saving
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

colorscheme night-owl
