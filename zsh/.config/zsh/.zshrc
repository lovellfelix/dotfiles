# Set Zinit home directory to store the zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it doesn't exist
if [ ! -d "$ZINIT_HOME" ]; then
   command mkdir -p "$(dirname $ZINIT_HOME)"
   command git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source Zinit 
source "${ZINIT_HOME}/zinit.zsh"

# If on macOS, source the .profile-macos file
if [ Darwin = `uname` ]; then
  source $ZDOTDIR/.profile-macos
fi

# If on Linux, source the .profile-linux file
if [ Linux = `uname` ]; then
  source $ZDOTDIR/.profile-linux
fi

# Source the .profile file for all OS
source $ZDOTDIR/.profile

# zinit plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
zinit light Aloxaf/fzf-tab
# evalcache and zsh-defer plugins are used to improve the performance of the shell.
zinit light mroth/evalcache
zinit light romkatv/zsh-defer

# zinit snippets
zinit snippet OMZP::ansible
zinit snippet OMZP::aliases
zinit snippet OMZP::kubectl
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZP::direnv

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

source $ZDOTDIR/.aliases

# keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey '^[w' kill-region

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'  # Case-insensitive (all), partial-word, and then substring completion.
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Auto completion
source <(fzf --zsh)
source <(kubectl completion zsh)

# disable paste highlighting
zle_highlight=('paste:none')

# Oh My Posh prompt
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  # Check if the ohmyposh config directory exists else create a symlink to the dotfiles directory
  # TODO: load with default config if no config is found
  if [ ! -d "$XDG_CONFIG_HOME/ohmyposh" ] && [ -d "$DOTFILESDIR/ohmyposh/.config/ohmyposh" ]; then
    ln -s "$DOTFILESDIR/ohmyposh/.config/ohmyposh" "$XDG_CONFIG_HOME/ohmyposh"
  fi
  zsh-defer eval "$(oh-my-posh init zsh --config "$XDG_CONFIG_HOME/ohmyposh/zen.toml")"
fi

# Tmux plugin manager
TPM_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/tmux/plugins/tpm"

if [ ! -d "$TPM_HOME" ]; then
  command mkdir -p "$(dirname $TPM_HOME)"
  command git clone https://github.com/tmux-plugins/tpm.git "$TPM_HOME"
  # Install tpm plugins
  $TPM_HOME/bin/install_plugins
  # Source the tmux config file if it exists and tmux is running
  if [ -n "$TMUX" ] && [ -f "$XDG_CONFIG_HOME/tmux/tmux.conf" ]; then
    tmux source-file $XDG_CONFIG_HOME/tmux/tmux.conf
  fi
fi

