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

https://github.com/dikiaap/dotfiles/blob/master/.oh-my-zsh/themes/oxide.zsh-theme


I'm assuming you'll have this repository on the home folder, if so just do:
```bash
$ ln -s ~/.vim ~/nvim\
$ ln -s ~/config_files/.zshrc ~/.zshrc
$ ln -s ~/config_files/.vimrc ~/.vimrc
$ ln -s ~/.vimrc ~/.config/nvim/init.vim
$ ln -s ~/config_files/.tmux.conf ~/.tmux.conf
$ ln -s ~/config_files/oxide.zsh-theme ~/.oh-my-zsh/themes/oxide.zsh-theme
```

If any of them fail, remove the existing file and try again.

If the project is in another folder, adjust the paths accordingly.


# Troubleshooting

## Vim Plugins
### neoclide/coc.nvim

If you have the following error:

```bash
 [coc.nvim] javascript file not found, please compile the code or use release branch.
```

Here is the solution:

* Install `nodejs` >= 8.10.0
* Install `yarn`
* Inside neovim, type the command:

 ```
 :call coc#util#install()
 ```
* Restart neovim
* Inside neovim, run:

```
:PlugInstall
```

### TaDaa/vimade
If you have one of the following errors:

```bash
Error detected while processing function vimade#Init[2]..vimade#CreateGlobals:
:finish used outside of a sourced file
```
or

```bash
Error detected while processing function vimade#Init[2]..vimade#CreateGlobals:
Undefined variable: g:vimade_py_cmd
```
or

```bash
Error detected while processing function vimade#Init[15]..vimade#CheckWindows:
Undefined variable: g:vimade_py_cmd
```

That means you are missing the `pynvim` package for python. Just install it (run on your terminal):

* If you are using python 2:

```bash
pip2 install pynvim
```

* If you are using python 3:

```bash
pip3 install pynvim
```

* Restart neovim
* Inside neovim, run:

```
:PlugInstall
```
