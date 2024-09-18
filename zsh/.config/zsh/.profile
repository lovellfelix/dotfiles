# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# k9s
export KUBE_EDITOR=$EDITOR
export K9S_CONFIG_DIR="$HOME/.config/k9s"

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

#rust
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
if [ -d "$HOME/.cargo" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# Set up fzf
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --no-ignore-vcs"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND="fd --type d . --color=never"

# Set up fzf catppuccin macchiato theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
--prompt '∷ ' --pointer '❯' --marker ' '"

# fzf tab completion
# tree command with fzf preview. Use `tree **` to list directories and files
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
  tree) find . -type d | fzf --preview 'tree -C {}' "$@" ;;
  *) fzf "$@" ;;
  esac
}

# Setup bat as a replacement for cat
if [ "$(command -v bat)" ]; then
  export BAT_THEME="Catppuccin Macchiato"
  alias cat='bat -p --wrap character'
  export MANPAGER="sh -c 'col -bx | bat -l man -p"
fi

if [ "$(command -v atuin)" ]; then
  eval "$(atuin init zsh --disable-up-arrow)"

  export ATUIN_NOBIND="true"

  fzf-atuin-history-widget() {
    local atuin_opts="--cmd-only"
    local fzf_opts=(
      "--height=${FZF_TMUX_HEIGHT:-80%}"
      --tac
      "-n2..,.."
      --tiebreak=index
      "--query=${LBUFFER}"
      "+m"
      "--bind=ctrl-d:reload(atuin search $atuin_opts -c $PWD),ctrl-r:reload(atuin search $atuin_opts)"
    )

    selected=$(
      eval "atuin search ${atuin_opts}" |
        fzf "${fzf_opts[@]}"
    )
    local ret=$?
    if [ -n "$selected" ]; then
      # the += lets it insert at current pos instead of replacing
      LBUFFER+="${selected}"
    fi
    zle reset-prompt
    return $ret
  }
  zle -N fzf-atuin-history-widget
  zle -N _atuin_search_widget _atuin_search
  bindkey '^r' fzf-atuin-history-widget
  bindkey '^x' atuin-search
  bindkey '^ ' autosuggest-accept
  _zsh_autosuggest_strategy_atuin_top() {
    suggestion=$(atuin search --cmd-only --limit 1 --search-mode prefix $1)
  }
  ZSH_AUTOSUGGEST_STRATEGY=(atuin_top history completion)
fi

# setup tmuxinator if it exists
if [ "$(command -v tmuxinator)" ]; then
  function tmuxinator_fzf() {
    {
      exec </dev/tty
      exec <&1
      local session
      session=$(tmuxinator list -n | tail -n +2 | fzf --height 40% --reverse --border-label 'Select a tmuxinator project: ' --border --prompt '∷ ')
      [[ -z "$session" ]] && return
      tmuxinator start $session
    }
  }

  zle -N tmuxinator_fzf

  # Bind Ctrl+Z to the tmuxinator_fzf function in all relevant keymaps
  bindkey -M emacs '^Z' tmuxinator_fzf
  bindkey -M vicmd '^Z' tmuxinator_fzf
  bindkey -M viins '^Z' tmuxinator_fzf
fi
