"set guifont=Consolas:h11:cDEFAULT

if has('win32') || has('win64')
	set guifont=Consolas_for_Powerline_FixedD:h11:cANSI
else
	set guifont=Monaco:h12
endif

set guioptions-=m
set guioptions-=T
set guioptions-=r
set lines=46
set columns=110
"set background=light

set novisualbell
set noerrorbells
set nocursorline

colorscheme molokai
