# Oxide theme for Zsh
#
# Original author: Diki Ananta <diki1aap@gmail.com>
# Altered by André Lucas Zanellato <andre.zanellato@gmail.com>
# Repository: https://github.com/dikiaap/dotfiles
# Repository: https://github.com/Azanellato/config_files
# License: MIT

# Prompt:
# %F => Color codes
# %f => Reset color
# %~ => Current path
# %(x.true.false) => Specifies a ternary expression
#   ! => True if the shell is running with root privileges
#   ? => True if the exit status of the last command was success
#
# Git:
# %a => Current action (rebase/merge)
# %b => Current branch
# %c => Staged changes
# %u => Unstaged changes
#
# Terminal:
# \n => Newline/Line Feed (LF)

setopt PROMPT_SUBST

autoload -U add-zsh-hook
autoload -Uz vcs_info

# Use True color (24-bit) if available.
if [[ "${terminfo[colors]}" -ge 256 ]]; then
    oxide_turquoise="%F{75}"
    oxide_orange="%F{179}"
    oxide_rust="%F{208}"
    oxide_red="%F{124}"
    oxide_limegreen="%F{148}"
else
    oxide_turquoise="%F{cyan}"
    oxide_orange="%F{yellow}"
    oxide_red="%F{red}"
    oxide_limegreen="%F{green}"
fi

# Reset color.
oxide_reset_color="%f"

# VCS style formats.
FMT_UNSTAGED="%{$oxide_reset_color%} %{$oxide_orange%}●"
FMT_STAGED="%{$oxide_reset_color%} %{$oxide_limegreen%}✚"
FMT_ACTION="(%{$oxide_limegreen%}%a%{$oxide_reset_color%})"
FMT_VCS_STATUS="on %{$oxide_turquoise%} %b%u%c%{$oxide_reset_color%}"

zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr    "${FMT_UNSTAGED}"
zstyle ':vcs_info:*' stagedstr      "${FMT_STAGED}"
zstyle ':vcs_info:*' actionformats  "${FMT_VCS_STATUS} ${FMT_ACTION}"
zstyle ':vcs_info:*' formats        "${FMT_VCS_STATUS}"
zstyle ':vcs_info:*' nvcsformats    ""
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

# Check for untracked files.
+vi-git-untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
            git status --porcelain | grep --max-count=1 '^??' &> /dev/null; then
        hook_com[staged]+="%{$oxide_reset_color%} %{$oxide_red%}●"
    fi
}

local function p-print(){
	echo "%{$FG[$1]%}$L_BRACKET$2$R_BRACKET"
}

local function getHost(){
	p-print 010 " $HOST"
}

local function getUser(){
	[ "$USER" = 'root' ] && p-print 001 "root" # || p-print 012 "$USER"
}

# Executed before each prompt.
add-zsh-hook precmd vcs_info

# Oxide prompt style.

PROMPT=$'\n%{$oxide_rust%}%~%{$oxide_reset_color%} ${vcs_info_msg_0_}\n%(?.%{$oxide_limegreen%}.%{$oxide_red%})%(!.#.▶)%{$oxide_reset_color%} '
# RPROMPT=$'%{$oxide_limegreen%}$USER'
