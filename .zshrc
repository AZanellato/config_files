# If you come from bash you might have to change your $PATH.
# zmodload zsh/zprof
export ZSH=~/.oh-my-zsh
export TERM=xterm-256color

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="oxide"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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

# User configuration


export EDITOR='nvim'
# Functions
#
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

if command lsd > /dev/null; then
  alias ls="lsd"
fi
alias conff="cd ~/config_files/"
alias goevents="cd ~/Projects/pipefy_events"
alias gopipe="cd ~/Projects/pipefy"
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
alias pull_config="cd ~/config_files/ && git pull"
alias rpipefy="cd ~ && ./start_pipefy && cd -"
alias rstest="RAILS_ENV=test rs"
alias stoppostgres="sudo service postgresql stop"
alias open="xdg-open"
alias git-calendar="git-stats"

export BAT_THEME="TwoDark"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"

. $HOME/.asdf/asdf.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ -z "$TMUX" ]];then
        tmux
fi
# Setting rg as the default source for fzf
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export CDPATH=.:~/Projects

source_if_possible $HOME/anaconda3/etc/profile.d/conda.sh

chpwd_functions=(${chpwd_functions[@]} "lazy_load_nvm")
lazy_load_nvm
if type "$opam" > /dev/null; then
  $(opam env)
fi
