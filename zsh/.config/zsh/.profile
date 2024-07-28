# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#k9s
export KUBE_EDITOR=$EDITOR
export K9S_CONFIG_DIR="$HOME/.config/k9s"

#nvm
# export NVM_DIR="$HOME/.nvm"

#krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

#rust
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
if [ -d "$HOME/.cargo" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# Set up fzf catppuccin macchiato theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"
