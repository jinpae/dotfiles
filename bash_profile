# Aliases
alias ls='ls -GFh'
alias ll="ls -lahG"

# Paths
export PATH=/usr/local/bin:/usr/local/git/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH

# Git tab completion
source /usr/local/git/contrib/completion/git-completion.bash

# Show branch in status line
PS1='[\W$(__git_ps1 " (%s)")]\$ '
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'

[[ -s "/Users/jinpae/.rvm/scripts/rvm" ]] && source "/Users/jinpae/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash ]; then
    . /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
fi

source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh
