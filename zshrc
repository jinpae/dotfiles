[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
 
alias ls='ls -GFh'
alias ll='ls -lahG'

autoload -Uz vcs_info
autoload -Uz compinit && compinit

precmd () { vcs_info }

zstyle ':vcs_info:git:*' formats ' (%b)'

setopt prompt_subst
PROMPT='[%1~${vcs_info_msg_0_}]$ '

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

