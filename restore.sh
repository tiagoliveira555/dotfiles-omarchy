#!/bin/bash
set -e

sudo pacman -S --needed --noconfirm stow git jq

# zsh: instala e define como shell padrão
sudo pacman -S --needed --noconfirm zsh
sudo chsh -s /usr/bin/zsh "$USER"

cd ~/dotfiles

# Adota os arquivos existentes e restaura a versão do repositório
stow --adopt --no-folding -t ~ hypr bin git nvim tmux zsh ideavim
git checkout -- hypr bin git nvim tmux zsh ideavim

# monitors.lua: arquivo copiado, pois o Omarchy pode reescrevê-lo
mkdir -p ~/.config/hypr
cp ~/dotfiles/hypr-local/monitors.lua ~/.config/hypr/monitors.lua

# VS Code
~/.local/bin/vscode-setup

# Idioma do Omarchy
omarchy language pt-BR

# Áudio
sudo pacman -S --needed --noconfirm \
  sof-firmware alsa-firmware alsa-ucm-conf

# GPU híbrida (Intel + NVIDIA)
~/.local/bin/gpu-hybrid-setup

# Personalizações do Omarchy
mkdir -p ~/.config/omarchy/plugins

# Vincula o plugin personalizado ao repositório
ln -sfn ~/dotfiles/omarchy/plugins/tiago.screen-recording \
  ~/.config/omarchy/plugins/tiago.screen-recording

echo "Pronto. Reinicie."
