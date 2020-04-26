# config_files

You'll need:
- [ZSH](https://www.zsh.org)
- [Tmux](https://github.com/tmux/tmux/wiki)
- [NeoVim](https://neovim.io/)
- Node (ASDF or nvm or whatever you like) & yarn
- Rust 


# Necessary stuff


## ZSH and Tmux if you are in Fedora:

```bash
sudo dnf install tmux
sudo dnf install zsh
```


## Oh My Zsh:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Rust:
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
Install ripgrep, bat and lsd with cargo:

```bash
cargo install lsd

cargo install bat

cargo install ripgrep
```

## ASDF and Node:

```bash
git clone https://github.com/asdf-vm/asdf.git ~/.asdf

cd ~/.asdf

git checkout "$(git describe --abbrev=0 --tags)"

asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

asdf install nodejs 13.12.0
```
## Neovim:
https://github.com/neovim/neovim/releases/tag/v0.4.3

## Vim Plug:

For vim:
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

For NeoVim:

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```


Run:

```bash
pip3 install pynvim
```

## TPM for tmux plugins:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

install xclip to make sure tmux-yank works:

```bash
sudo dnf install xclip
```
Run `prefix`+`I` to install the tmux plugins.


## p10k:

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
ln -s ~/config_files/.p10k.zsh ~/.p10k.zsh
```


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
