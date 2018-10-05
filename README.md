# config_files

You'll need: 
- [ZSH](https://www.zsh.org)
- [Tmux](https://github.com/tmux/tmux/wiki)
- [NeoVim](https://neovim.io/)





Then install vim-plug for neovim:
https://github.com/junegunn/vim-plug


The install the extensions/themes: 

https://github.com/gpakosz/.tmux

https://github.com/robbyrussell/oh-my-zsh

https://github.com/pascaldevink/spaceship-zsh-theme


I'm assuming you'll have this repository on the home folder, if so just do:
```bash
$ ln -s ~/.vim ~/nvim\
$ ln -s ~/config_files/.zshrc ~/.zshrc
$ ln -s ~/config_files/.vimrc ~/.vimrc
$ ln -s ~/.vimrc ~/.config/nvim/init.vim
$ ln -s ~/config_files/.tmux.conf.local ~/.tmux.conf.local
```
If any of them fail, remove the existing file and try again.

If the project is in another folder, adjust the paths accordingly.
