# Brew exists on disk, enable it.
if [[ -f "/opt/homebrew/bin/brew" ]] then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set Zinit home directory to store the zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it doesn't exist
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi


# Source Zinit 
source "${ZINIT_HOME}/zinit.zsh"

# Source the .profile file
# If on macOS, source the .profile-macos file
if [ Darwin = `uname` ]; then
  source $ZDOTDIR/.profile-macos
fi

# If on Linux, source the .profile-linux file
if [ Linux = `uname` ]; then
  source $HOME/.profile-linux
fi

# zinit plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
zinit light Aloxaf/fzf-tab

# zinit snippets
zinit snippet OMZP::ansible
zinit snippet OMZP::kubectl
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

plugins=(git gitignore git-extras macos kubectl brew ansible zsh-autosuggestions nvm python)

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

source $ZDOTDIR/.aliasesrc

# keybindings
bindkey -e
bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search
bindkey '^[w' kill-region

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Auto completion
source <(fzf --zsh)

# Oh My Posh prompt
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $XDG_CONFIG_HOME/ohmyposh/zen.toml)"
fi

# zle_highlight=('paste:none')