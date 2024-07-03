#!/usr/bin/env bash
set -ex

# create k9s folders, if not exist
mkdir -p "${XDG_CONFIG_HOME}"/k9s
mkdir -p "${XDG_CONFIG_HOME}"/k9s/skins

# create config symlink
ln -sfv "${HOME}"/.dotfiles/k9s/config.yaml "${XDG_CONFIG_HOME}"/k9s/config.yaml
ln -sfv "${HOME}"/.dotfiles/k9s/aliases.yaml "${XDG_CONFIG_HOME}"/k9s/aliases.yaml

# create skin symlink
ln -sfv "${HOME}"/.dotfiles/k9s/skins/catppuccin-mocha.yaml "${XDG_CONFIG_HOME}"/k9s/skins/catppuccin-mocha.yaml
ln -sfv "${HOME}"/.dotfiles/k9s/skins/tokyo-night.yaml "${XDG_CONFIG_HOME}"/k9s/skins/tokyo-night.yaml