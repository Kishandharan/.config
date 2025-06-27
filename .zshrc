ZSH_THEME="robbyrussell"
plugins=(git vi-mode)
eval "$(zoxide init zsh)"
source /home/poweruser/.oh-my-zsh/oh-my-zsh.sh
export PATH=/snap/bin:$PATH # Add this line if you installed tmux using sudo snap install tmux --classic 
alias cd="z"
bindkey -v
bindkey -M viins 'kj' vi-cmd-mode
alias serverconnect="ssh root@172.105.63.40"




