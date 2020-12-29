# If we don't have a tmux session, create it and call it main
if [[ -z "$TMUX" ]];then
  tmux new-session -A -s main
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=~/.oh-my-zsh
export TERM=xterm-256color

# ZSH_THEME="oxide"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Change following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=5

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  asdf
  git 
  zsh-autosuggestions
  tmux 
)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

# Functions

function nvm_load () {
  if ! type "npm" > /dev/null; then
    unalias nvm
    . $NVM_DIR/nvm.sh 
  fi
}
function lazy_load_nvm() {
  [[ -f package.json || -d node_modules ]] || return
  nvm_load
}
function weather_in() {
  curl wttr.in/$1
}

function clima() { wttrcwb }
function wttrcwb() {
  weather_in Curitiba
}

function source_if_possible() {
    if [[ -r $1 ]]; then
        source $1
    fi
}

function parrot() {
  curl parrot.live
}
function joke() {
  curl https://icanhazdadjoke.com
}

function pfzf() {
  fzf --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --theme="TwoDark" --color always {}) 2> /dev/null | head -500'
}

function reb-master() { 
  git checkout master &&
  git pull --rebase && 
  git checkout - && 
  git rebase master
}

function reb-branch() {
  local branch="$1"
  if [ $branch == '' ]; then
    echo $(reb-master)
  else 
    git checkout $branch &&
    git pull --rebase && 
    git checkout - && 
    git rebase $branch
  fi
}

# Personal aliases

if command lsd > /dev/null; then
  alias ls="lsd"
fi
alias n="nvim ."
alias nv="nvim "
alias nvmain="nvim src/main.rs"
alias nvgst="nvim \$(gst -s | awk '{print \$2}')"
alias nvd="nvim \$(git diff HEAD --name-only --diff-filter=ACMR)"
alias nvdc="nvim \$(git diff HEAD^ --name-only --diff-filter=ACMR)"
alias nvds="nvim \$(git diff --staged --name-only --diff-filter=ACMR)"
alias nvimrc="nvim ~/config_files/.vimrc"
alias nvm="unalias nvm; nvm_load && nvm"
alias nvzshrc="nvim ~/config_files/.zshrc"
alias pipefy-docker-up="docker-compose -f ~/Projects/pipefy/docker-compose.yml up"
alias projects="cd ~/Projects"
alias conff="cd ~/config_files/"
alias conffpull="cd ~/config_files/ && git pull"
alias gpr="git pull --rebase"
alias rdoc="rustup docs"
alias clippy="find . | grep "\.rs$" | xargs touch ; cargo clippy"

export BAT_THEME="TwoDark"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"

. $HOME/.asdf/asdf.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Setting rg as the default source for fzf
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export CDPATH=.:~/Projects

nvm_load
if type "opam" > /dev/null; then
  eval $(opam env)
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/andrezanellato/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/andrezanellato/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/andrezanellato/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/andrezanellato/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<

