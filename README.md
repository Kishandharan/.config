# ProductiveLinuxSetup
The configs I use for tmux and nvim to make them amazing! Note that this config is only made for Ubuntu.  
Requirements:    
- Fzf
- Zoxide
- Nvim v0.9.5 or above
- Nerd Font
- Tmux 3.4a or above
- Zsh
- Oh My Zsh
  
First, execute these commands to get all the configs and Nvim Plug ready:
```
cd ~
sudo apt update -y
sudo apt upgrade -y
sudo apt install fzf
sudo apt install zoxide
sudo apt install neovim
git clone https://github.com/Kishandharan/.config.git
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

```
And then open up nvim and type in ":PlugInstall".    
This will install all the required plugins.    
And once you have done that, you are golden (The setup is complete)!
