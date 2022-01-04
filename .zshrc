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
  docker-compose
  zsh-autosuggestions
  rust
  rails
  bundler
  ruby
  tmux 
)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

# Functions

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

function reb-main() { 
  git checkout main &&
  git pull --rebase && 
  git checkout - && 
  git rebase main
}

function reb-branch() {
  local branch="$1"
  echo $branch
  if [ $branch = '' ]; then
    echo $(reb-master)
  else 
    git checkout $branch &&
    git pull --rebase && 
    git checkout - && 
    git rebase $branch
  fi
}

function dbup(){
  if [[ -z $DB_NAME ]] ; then
    CLEAR_DB_NAME=yes
    DB_NAME="$(git symbolic-ref HEAD 2>/dev/null | choose -f '/' 2)"
    BRANCH_NAME="$(git symbolic-ref HEAD 2>/dev/null | choose -f '/' -1)"
    echo $BRANCH_NAME
    if [[ $BRANCH_NAME = "release" ]] ; then
      DB_NAME="hotfix"
    fi
    if [[ $DB_NAME = $BRANCH_NAME ]] ; then
      DB_NAME="main"
    fi
  fi
  PG_DB=$DB_NAME
  echo "-------------------------------------------------"
  echo "Running on ${PG_DB}" db
  echo "-------------------------------------------------"
  DB_NAME=
  docker stop $(docker ps | grep postgres | awk '{print $1}')
  $(docker run -p 5432:5432 --restart always -e POSTGRES_PASSWORD=unlock -e POSTGRES_USER=goco -e POSTGRES_DB=goco_io_development -v $(pwd)/.data/${PG_DB}:/var/lib/postgresql/data:delegated postgres:12.7-alpine)
}

function gocodbup() {
  cd goco-api
  dbup
}


# Personal aliases

if command -v lsd > /dev/null; then
  alias ls="lsd"
fi
alias n="nvim ."
alias nv="nvim "
alias nvmain="nvim src/main.rs"
alias nvgst="nvim \$(gst -s | awk '{print \$2}')"
alias nvd="nvim \$(git diff HEAD --name-only --diff-filter=ACMR)"
alias nvdc="nvim \$(git diff HEAD^ --name-only --diff-filter=ACMR)"
alias nvds="nvim \$(git diff --staged --name-only --diff-filter=ACMR)"
alias nvimrc="nvim -O ~/config_files/init.vim ~/config_files/nvim_config.lua"
alias nvzshrc="nvim ~/config_files/.zshrc"
alias projects="cd ~/Projects"
alias conff="cd ~/config_files/"
alias conffpull="cd ~/config_files/ && git pull"
alias gpr="git pull --rebase"
alias gdhr="git diff release..."
alias gdhm="git diff master..."
if command -v git-split-diffs --colors > /dev/null; then
  alias gds="git diff | npx git-split-diffs --colors | less"
fi
alias rdoc="rustup docs"
alias clippy="find . | grep "\.rs$" | xargs touch ; cargo clippy"
alias rtdb="RAILS_ENV=test rake db:reset"
alias rgsd="rake graphql:schema:dump"
alias gbs="git branch --sort=committerdate"
alias gbS="git branch --sort=-committerdate"

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

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/bitcomplete bit
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/bitcomplete bit

if [ "$PWD" = "$HOME" ]; then
  echo "Syncing configuration for you so you don't forget it"
  echo "Status:"
  cd ~/config_files
  git pull --rebase
fi
