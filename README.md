# dotfiles
A set of vim configuration files

# Usage
Clone this repo into the home directory either as `.vim` (Mac/Linux) or `vimfiles` (Windows):

    git clone git://github.com/jinpae/dotfiles.git ~/.vim (Mac/Linux)
    git clone git://github.com/jinpae/dotfiles.git "%homepath%\vimfiles" (Windows)

After cloning, simply either copy or symlink the dotfiles (vimrc, gvimrc, etc.) to the home directory:

    ln -s ~/.vim/vimrc ~/.vimrc (Mac/Linux)
    mklink "%homepath%\.vimrc" "%homepath%\vimfiles\vimrc" (Windows)

_Note: If you are on Windows, I recommend using [Cmder](http://gooseberrycreative.com/cmder/), a console emulator that supports useful Unix commands, instead of the plain `cmd`._

# Install Vim Plugins via Vundle
First, install [Vundle](https://github.com/gmarik/Vundle.vim) which is a vim plugin manager. To install Vundle, run the following command from a cmd or a terminal:

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

Once Vundle is installed, make sure your runtime path for Vundle is setup correcly in `.vimrc`. My runtime path should look something like this:

    " Set the runtime path to include Vundle and initialize
    set rtp+=%userprofile%\vimfiles\bundle\Vundle.vim
    call vundle#begin('\Users\Jin Pae\vimfiles\bundle')

Assuming you cloned dotfiles depot into `~/.vim`, you probably want to set your runtime path as follows:

    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

When done setting up the runtime path, it's time to install plugins (a.k.a. bundles). To install plugins defined in the `.vimrc` file, simple open `.vimrc` file in vim and run `PluginInstall` command that came with Vundle.

    :PluginInstall

Make sure you read through the Vundle's `README.md` if you aren't sure about this or any other things regarding how to use it.
