export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
eval "$(zoxide init zsh)"
source $ZSH/oh-my-zsh.sh
export PATH=$PATH:/snap/bin # Add this line if you installed tmux using sudo snap install tmux --classic 





