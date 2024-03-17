# oh-my-zsh installation path.
export ZSH="$HOME/.oh-my-zsh"

# The ZSH theme to use
ZSH_THEME="smt"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gitignore git-extras macos kubectl brew ansible zsh-autosuggestions nvm python)

source $ZSH/oh-my-zsh.sh
source $ZDOTDIR/.aliasesrc
source $ZDOTDIR/.exportsrc
source $ZDOTDIR/.hooksrc

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Custom format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}"

PROMPT='
%{$fg[green]%}[%~% ] %{$reset_color%}$(git_prompt_short_sha)$(git_prompt_info)
%{$fg[red]%}%!%{$reset_color%} $(prompt_char) : '

RPROMPT=''


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# Add alias to .aliasesrc
# ~/.config/zsh/.aliasesrc


# Auto completion

# minio
complete -o nospace -C /usr/local/bin/mc mc


# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        source "$BASE16_SHELL/profile_helper.sh"
        