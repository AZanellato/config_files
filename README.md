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

### Auto suggestions for zsh:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

## Rust:
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
Install ripgrep, bat and lsd with cargo:

```bash
cargo install lsd \
              bat \
              ripgrep
```

## ASDF and Node:

```bash
git clone https://github.com/asdf-vm/asdf.git ~/.asdf

cd ~/.asdf

git checkout "$(git describe --abbrev=0 --tags)"

asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'

asdf install nodejs 13.12.0
```

## Ruby && Rbenv:

```bash
git clone https://github.com/rbenv/rbenv.git ~/.rbenv

mkdir -p "$(rbenv root)"/plugins

git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

rbenv install 2.6.6
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

```
After all the above, the necessary symlinks are (assuming configuration files on the home folder):

```bash
$ mkdir ~/.config/nvim/lua
$ ln -s ~/config_files/nvim_config.lua ~/.config/nvim/lua/nvim_config.lua
$ ln -s ~/config_files/init.vim ~/.config/nvim/init.vim
$ ln -s ~/config_files/.zshrc ~/.zshrc
$ ln -s ~/config_files/.tmux.conf ~/.tmux.conf
$ ln -s ~/config_files/.p10k.zsh ~/.p10k.zsh
```

Also, for the patched Fira Code, download it [here](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode/Retina/complete)

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
