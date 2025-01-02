alias python="python3" # this is useful for some git stuff and anything that uses python, really
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

function weather_CF() {
  curl wttr.in/\?format=j1 --connect-timeout 5 | jq '.current_condition[0] | .temp_C, .temp_F' | tr -d '"'| tr '\n' ' ' |awk '{print $1 " celsius, fahrenheit " $2 }' 
}

function fields_of() {
  rg "field :" $1 | choose 1 | tr -d ':,' | gsed -E 's/_([a-z])/\U\1/g'
}

function clima() { wttrcwb }
function wttrcwb() {
  weather_in Curitiba
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

function branch-from() {
local source_name="$1"
local branch_name="$2"
  git checkout $source_name &&
    git pull &&
    git checkout -b $branch_name
}

function p-branch() { 
  local branch_name="patch/$1"
  branch-from prerelease $branch_name
}

function hf-branch() { 
  local branch_name="hotfix/$1"
  branch-from release $branch_name
}

function m-branch() { 
  local branch_name="$1"
  branch-from master $branch_name
}

function openpr() {
  BRANCH_BASE="$(git symbolic-ref HEAD 2>/dev/null | choose -f '/' 2)"

  if [[ $BRANCH_BASE = "hotfix" ]] ; then
    TARGET="release"
  elif [[ $BRANCH_BASE = "patch" ]] ; then
    TARGET="prerelease"
  else
    TARGET="master"
  fi

  gh pr create -B ${TARGET} -l "pods/tidepod"
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

function merge-branch() { 
  local branch="$1"
  echo $branch
  if [ $branch = '' ]; then
    echo $(merge-master)
  else 
    git checkout $branch &&
    git pull && 
    git checkout - && 
    git merge $branch
  fi
}

function merge-master() {
  git checkout master &&
    git pull &&
    git checkout - &&
    git merge master
}

function merge-base() { 
  BRANCH_BASE="$(git symbolic-ref HEAD 2>/dev/null | choose -f '/' 2)"
  if [[ $BRANCH_BASE = "hotfix" ]] ; then 
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
    else
      DB_NAME="main"
    fi
  fi
  PG_DB=$DB_NAME
  echo "-------------------------------------------------"
  echo "Running on ${PG_DB}" db
  echo "-------------------------------------------------"
  DB_NAME=
  docker stop $(docker ps | grep postgres | awk '{print $1}')
  $(docker run -p 5432:5432 --restart always -e POSTGRES_PASSWORD=unlock -e POSTGRES_USER=goco -e POSTGRES_DB=goco_io_development -v $(pwd)/.data/${PG_DB}:/var/lib/postgresql/data:delegated postgres:16-alpine)
}

function gocodbup() {
  cd goco-api
  dbup
}


# Personal aliases

if command -v lsd > /dev/null; then
  alias ls="lsd"
fi
alias n="fzf | xargs nvim"
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
alias seedtest="RAILS_ENV=test rake db:seed"
alias gbs="git branch --sort=-committerdate | fzf | xargs git switch"
alias gbS="git branch --sort=committerdate | fzf | xargs git switch"
alias migrate="rkdm && say migration finished"
alias viewpr="gh pr view -w"
alias prlink="gh pr view --json url -q .url | pbcopy"
alias dolar="curl 'https://economia.awesomeapi.com.br/last/USD-BRL' | jq .USDBRL.bid | tr -d '\"'"
alias rubofix="rubocop -a \$(git diff --name-only --staged); git add \$(git diff --name-only --staged)"
alias weatherCF="weather_CF"
alias createpr="openpr"
export BAT_THEME="Coldark-Cold"
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
export DATABASE_HOST="127.0.0.1"
export PATH="/usr/local/opt/postgresql@16/bin:$PATH"
#
export PGGSSENCMODE="disable"

export PATH="/usr/local/sbin:$PATH"
