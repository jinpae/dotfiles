set guifont=DankMono-Regular:h16
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set columns=120
set lines=36
set novisualbell
set noerrorbells
set nocursorline
set macmeta

nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

" For Oceanic Next theme
if (has("termguicolors"))
  set termguicolors
endif

colorscheme night-owl
