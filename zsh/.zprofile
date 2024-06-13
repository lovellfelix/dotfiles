# export PATH="$PATH:/usr/local/bin"
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export ZDOTDIR=$HOME/.config/zsh
export ZSH_COMPDUMP=$XDG_CACHE_HOME/zsh/zcompdump
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# History in cache directory
HISTSIZE=50000
HISTFILE=$ZDOTDIR/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Language settings for UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#k9s
export TERM=xterm-256color
export KUBE_EDITOR=nvim
export K9S_CONFIG_DIR="$HOME/.config/k9s"

#nvm
export NVM_DIR="$HOME/.nvm"

#krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
