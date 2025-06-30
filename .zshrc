ZSH_THEME="robbyrussell"
plugins=(git vi-mode)
eval "$(zoxide init zsh)"
export PATH=/snap/bin:$PATH # Add this line if you installed tmux using sudo snap install tmux --classic 
export PATH="$HOME/.local/bin:$PATH"
eval "$(starship init zsh)"
alias cd="z"
bindkey -v
bindkey -M viins 'kj' vi-cmd-mode
alias serverconnect="ssh root@172.105.63.40"




