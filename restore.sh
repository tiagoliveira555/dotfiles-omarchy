#!/bin/bash
set -e

sudo pacman -S --needed --noconfirm stow git jq

# zsh: instala e define como shell padrão
sudo pacman -S --needed --noconfirm zsh
sudo chsh -s /usr/bin/zsh "$USER"

cd ~/dotfiles

# Adota os arquivos existentes e restaura a versão do repositório
stow --adopt --no-folding -t ~ hypr bin git nvim tmux zsh
git checkout -- hypr bin git nvim tmux zsh

# monitors.lua: arquivo copiado, pois o Omarchy pode reescrevê-lo
mkdir -p ~/.config/hypr
cp ~/dotfiles/hypr-local/monitors.lua ~/.config/hypr/monitors.lua

# VS Code
~/.local/bin/vscode-setup

# Locale pt_BR
sudo sed -i 's/^\#\(pt_BR.UTF-8 UTF-8\)/\1/' /etc/locale.gen
sudo locale-gen
sudo localectl set-locale LANG=pt_BR.UTF-8

# Áudio
sudo pacman -S --needed --noconfirm \
    sof-firmware alsa-firmware alsa-ucm-conf

# GPU híbrida (Intel + NVIDIA)
~/.local/bin/gpu-hybrid-setup

# Personalizações do Omarchy
mkdir -p ~/.config/omarchy/plugins

# Vincula o shell.json ao repositório
ln -sfn ~/dotfiles/omarchy/shell.json ~/.config/omarchy/shell.json

# Vincula os plugins personalizados ao repositório
for plugin in \
    tiago.clock \
    tiago.weather \
    tiago.notifications \
    tiago.screen-recording
do
    ln -sfn ~/dotfiles/omarchy/plugins/"$plugin" \
        ~/.config/omarchy/plugins/"$plugin"
done

echo "Pronto. Reinicie."
