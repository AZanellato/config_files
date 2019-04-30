# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# zmodload zsh/zprof
# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="oxide"
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Change following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=5

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  asdf
  git 
  rails 
  zsh-autosuggestions
  tmux 
)

source $ZSH/oh-my-zsh.sh

# User configuration


# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

# Functions
#
source_if_possible() {
    if [[ -r $1 ]]; then
        source $1
    fi
}

pfzf() {
  fzf --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --theme="TwoDark" --color always {}) 2> /dev/null | head -500'
}

reb-master() { 
  git checkout master &&
  git pull --rebase && 
  git checkout - && 
  git rebase master
}

reb-branch() {
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
alias n="nvim ."
alias nv="nvim "
alias nvd="nvim \$(git diff HEAD --name-only --diff-filter=ACMR)"
alias nvds="nvim \$(git diff --staged --name-only --diff-filter=ACMR)"
alias nvdc="nvim \$(git diff HEAD^ --name-only --diff-filter=ACMR)"
alias nvimrc="nvim ~/config_files/.vimrc"
alias nvzshrc="nvim ~/config_files/.zshrc"
alias configfiles="cd ~/config_files/"
alias pull_config="cd ~/config_files/ && git pull"
alias docker-up="docker-compose -f ~/Projects/pipefy/docker-compose.yml up"
alias goevents="cd ~/Projects/pipefy_events"
alias gopipe="cd ~/Projects/pipefy"
alias projects="cd ~/Projects"
alias rpipefy="cd ~ && ./start_pipefy && cd -"
alias stoppostgres="sudo service postgresql stop"
alias rstest="RAILS_ENV=test rs"
alias node='unalias nvm; unalias node; unalias npm; nvm_load; node $@'
alias npm='unalias nvm; unalias node; unalias npm; nvm_load; npm $@'
alias nvm='unalias nvm; unalias node; unalias npm; nvm_load; nvm $@'
unalias rg

export BAT_THEME="TwoDark"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
nvm_load () {
  . $NVM_DIR/nvm.sh
  . $NVM_DIR/bash_completion
}

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# SPACESHIP_PROMPT_ORDER=(
#   # time          # Time stampts section (Disabled)
#   # user          # Username section
#   dir           # Current directory section
#   # host          # Hostname section
#   git           # Git section (git_branch + git_status)
#   # hg            # Mercurial section (hg_branch  + hg_status)
#   # package     # Package version (Disabled)
#   # node          # Node.js section
#   # ruby          # Ruby section
#   # elixir        # Elixir section
#   # xcode       # Xcode section (Disabled)
#   # swift         # Swift section
#   # golang        # Go section
#   # php           # PHP section
#   # rust          # Rust section
#   # haskell       # Haskell Stack section
#   # julia       # Julia section (Disabled)
#   # docker      # Docker section (Disabled)
#   # aws           # Amazon Web Services section
#   # venv          # virtualenv section
#   # conda         # conda virtualenv section
#   # pyenv         # Pyenv section
#   # dotnet        # .NET section
#   # ember       # Ember.js section (Disabled)
#   # kubecontext   # Kubectl context section
#   exec_time     # Execution time
#   line_sep      # Line break
#   # battery       # Battery level and status
#   # vi_mode     # Vi-mode indicator (Disabled)
#   # jobs          # Background jobs indicator
#   exit_code     # Exit code section
#   char          # Prompt character
# )
# SPACESHIP_RUST_SYMBOL=
# SPACESHIP_RUST_COLOR=red
# SPACESHIP_RUBY_SYMBOL= 
# SPACESHIP_RUBY_COLOR=red
# SPACESHIP_ELIXIR_SYMBOL=
if [[ -z "$TMUX" ]];then
        tmux
fi
# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export CDPATH=.:~/Projects

source_if_possible $HOME/anaconda3/etc/profile.d/conda.sh

