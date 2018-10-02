# config_files

You'll need ZSH, Tmux and NeoVim
https://neovim.io/
https://www.zsh.org
https://github.com/tmux/tmux/wiki

Then install vim-plug for neovim:
https://github.com/junegunn/vim-plug


The install the extensions/themes: 

https://github.com/gpakosz/.tmux
https://github.com/robbyrussell/oh-my-zsh
https://github.com/pascaldevink/spaceship-zsh-theme


I assuming you'll have this repository on the home folder, then you just do:
```
$ ln -s ~/.vim ~/nvim\
$ ln -s -f .tmux/.tmux.conf
$ ln -s .zshrc config_files/.zshrc
$ ln -s config_files/.zshrc .zshrc
$ ln -s config_files/.vimrc .vimrc
$ ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
$ ln -s ~/.vimrc ~/nvim/init.vim
$ ln -s config_files/.tmux.conf.local .tmux.conf.local
```
If any of them fail, remove the existing file and try again.
