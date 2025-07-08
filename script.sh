#!/bin/bash
set -e  # Encerra o script em caso de erro

echo "Iniciando pós-instalação para Arch + Hyprland..."

# Atualizando o sistema
echo "Atualizando pacotes..."
sudo pacman -Syu --noconfirm

# Instalando codecs multimídia
echo "Instalando codecs..."
sudo pacman -S --needed --noconfirm gstreamer gst-plugins-base gst-plugins-libav gst-plugins-good gst-plugins-bad gst-plugins-ugly ffmpeg

# Instalando pacotes essenciais do sistema
echo "Instalando pacotes essenciais..."
sudo pacman -S --needed --noconfirm \
  qt5-wayland qt6-wayland xorg-xwayland \
  xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk \
  polkit-kde-agent gnome-keyring xdg-user-dirs-gtk uwsm sddm

# Instalando fontes
echo "Instalando fontes..."
sudo pacman -S --needed --noconfirm \
  noto-fonts noto-fonts-emoji noto-fonts-cjk noto-fonts-extra noto-fonts-compat ttf-noto-nerd

# Instalando dependências
echo "Instalando ferramentas básicas..."
sudo pacman -S --needed --noconfirm git base-devel curl wget unzip unrar

# Instalando yay (AUR helper)
echo "Instalando yay..."
cd /tmp && git clone https://aur.archlinux.org/yay && cd yay
makepkg -si --noconfirm
cd .. && rm -rf yay

# Instalando Hyprland e complementos
echo "Instalando Hyprland e pacotes relacionados..."
sudo pacman -S --needed --noconfirm hyprland hyprpaper hyprlock
yay -S --needed --noconfirm --norebuild --noredownload hyprshot

# Instalando utilitários úteis
echo "Instalando utilitários..."
sudo pacman -S --needed --noconfirm \
  pavucontrol rofi-wayland kitty fastfetch neovim waybar mpv nwg-bar btop tmux rofimoji

# Instalando temas e personalização
echo "Instalando temas e ícones..."
sudo pacman -S --needed --noconfirm breeze breeze-gtk breeze5 nwg-look papirus-icon-theme
yay -S --needed --noconfirm --norebuild --noredownload qt5ct-kde qt6ct-kde

# Instalando pacotes do AUR
echo "Instalando pacotes extras do AUR..."
yay -S --needed --noconfirm --norebuild --noredownload brave-bin qview asdf-vm

# Ajustes finais
echo "Atualizando diretórios padrão..."
xdg-user-dirs-update

echo "Finalizado. Reinicie o sistema para aplicar tudo."
