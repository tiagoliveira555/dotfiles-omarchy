#!/bin/bash
set -e
sudo pacman -S --needed --noconfirm stow git jq
cd ~/dotfiles
stow --no-folding -t ~ hypr bin git nvim zsh

# locale pt_BR
sudo sed -i 's/^#\(pt_BR.UTF-8 UTF-8\)/\1/' /etc/locale.gen
sudo locale-gen
sudo localectl set-locale LANG=pt_BR.UTF-8

# áudio: firmware do SOF (o perfil com Speaker é aplicado pelo script audio-speaker-profile)
sudo pacman -S --needed --noconfirm sof-firmware alsa-firmware alsa-ucm-conf

# GPU híbrida (Intel + GTX 1650): pacotes e limpeza do supergfxctl
~/.local/bin/gpu-hybrid-setup

echo "Pronto. Reinicie."
