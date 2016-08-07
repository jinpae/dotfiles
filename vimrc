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
"Plugin 'ervandew/supertab'

" Allows easy way to surround texts with parentheses, brackets, quotes, etc.
Plugin 'surround.vim'

" Provides utility functions and commands for programming in Vim
Plugin 'L9'

" Lets rename current file on the disk
Plugin 'Rename'

" Colorschemes
Plugin 'molokai'
Plugin 'morhetz/gruvbox'
Plugin 'nanotech/jellybeans.vim'
Plugin 'junegunn/seoul256.vim'

" Distraction-free writing in Vim
Plugin 'junegunn/goyo.vim'

" Fuzzy finder
Plugin 'ctrlp.vim'

" Handy filesystem navigator
Plugin 'scrooloose/nerdtree'

" Git wrapper
Plugin 'tpope/vim-fugitive'

" Ruby and Ruby on Rails plugins
Plugin 'tpope/vim-rails'
