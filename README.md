# ProductiveLinuxSetup
The configs I use for tmux and nvim to make them amazing!   
Requirements:    
- Fzf
- Nvim v0.9.5 or above
- Nerd Font
- Tmux 3.4a or above   

Make sure you have installed all of these before getting started.    
First, execute these commands to get all the configs and Nvim Plug ready:
```
cd ~
git clone https://github.com/Kishandharan/.config.git
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
And then open up nvim and type in ":PlugInstall".    
This will install all the required plugins.    
And once you have done that, you are golden (The setup is complete)!
