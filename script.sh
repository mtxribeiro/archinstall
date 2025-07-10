#!/bin/bash
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav
sudo pacman -S --needed --noconfirm wireplumber pipewire pipewire-alsa pipewire-jack pipewire-pulse pavucontrol
sudo pacman -S --needed --noconfirm gtk3 gtk4 qt5-wayland qt6-wayland xorg-xwayland xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk polkit-kde-agent gnome-keyring xdg-user-dirs xdg-user-dirs-gtk
sudo pacman -S --needed --noconfirm noto-fonts noto-fonts-emoji noto-fonts-cjk noto-fonts-extra ttf-noto-nerd
sudo pacman -S --needed --noconfirm ffmpeg xdg-utils git base-devel curl wget zip unzip mpv imv
command -v yay &>/dev/null || (cd /tmp && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd ~ && rm -rf /tmp/yay)
xdg-user-dirs-update
sudo pacman -Scc --noconfirm
cd "$HOME"
echo -e "\n\033[1;32mInstalação concluída. Por favor, reinicie o sistema.\033[0m"
