# dotfiles
A set of vim configuration files

# Usage
Clone this repo into your home directory either as `.vim` (Mac/Linux) or `vimfiles` (Windows):

~~_UPDATE: Haven't tested for myself yet, but it seems like `.vim` also works on Windows as well_~~

_UPDATE: Windows can also use .vim directory, but sparkup plugin didn't run successfully_.

    git clone git@github.com:jinpae/dotfiles.git ~/.vim (Mac/Linux)
    git clone git@github.com:jinpae/dotfiles.git "%home%\vimfiles" (Windows)

After cloning, simply symlink the dotfiles (vimrc, gvimrc, etc.) to the home directory:

    ln -s ~/.vim/vimrc ~/.vimrc (Mac/Linux)
    mklink "%home%\.vimrc" "%home%\vimfiles\vimrc" (Windows)

_Note: If you are on Windows, I recommend using a console emulator such as [Cmder](http://gooseberrycreative.com/cmder/) or [ConEmu](http://conemu.github.io/) that supports useful Unix commands instead of the plain `cmd`._

# Install Vim Plugins via Vundle
First, install [Vundle](https://github.com/VundleVim/Vundle.vim) which is a vim plugin manager. To install Vundle, run the following command from a cmd or a terminal:

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

Once Vundle is installed, make sure your runtime path for Vundle is setup correcly in `.vimrc` so that it knows where to find the plugins and load them. Depending on your operating system and how the environment is setup, you might want to change it to point to the right path. At the time of writing this document, my runtime path looks like this where it checks the operating system it's running on conditionally and sets the path accordingly:

    " Set the runtime path to include Vundle and initialize
    if has('win32') || has('win64')
    	set rtp+=~/vimfiles/bundle/Vundle.vim/
    	let path='~/vimfiles/bundle'
    	call vundle#begin(path)
    else
    	set rtp+=~/.vim/bundle/Vundle.vim
    	call vundle#begin()
    endif

If you cloned dotfiles depot into `~/.vim`, you should be good to go with the default path setup:

    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

When done setting up the runtime path, it's time to install plugins (a.k.a. bundles). To install plugins defined in the `.vimrc` file, simply open the file in vim and run `PluginInstall` command that came with Vundle.

    :PluginInstall

Make sure you read through the Vundle's `README.md` if you aren't sure about this or any other things regarding how to use it.
