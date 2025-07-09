#!/bin/bash

set -e

sudo pacman -Syu --noconfirm

kernel=$(uname -r)
case "$kernel" in
  *lts*) pkg="linux-lts-headers" ;;
  *zen*) pkg="linux-zen-headers" ;;
  *hardened*) pkg="linux-hardened-headers" ;;
  *) pkg="linux-headers" ;;
esac
sudo pacman -S --noconfirm --needed $pkg

gpu=$(lspci | grep -E "VGA|3D" | awk -F: '{print $3}' | tr '[:upper:]' '[:lower:]')

if echo "$gpu" | grep -q "nvidia"; then
  sudo pacman -S --noconfirm --needed nvidia-dkms nvidia-utils lib32-nvidia-utils
elif echo "$gpu" | grep -q "amd"; then
  sudo pacman -S --noconfirm --needed xf86-video-amdgpu mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon libva-mesa-driver
elif echo "$gpu" | grep -q "intel"; then
  sudo pacman -S --noconfirm --needed xf86-video-intel mesa lib32-mesa vulkan-intel lib32-vulkan-intel libva-intel-driver
fi

sudo pacman -S --needed --noconfirm gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav

sudo pacman -S --needed --noconfirm wireplumber pipewire pipewire-alsa pipewire-jack pipewire-pulse pavucontrol

sudo pacman -S --needed --noconfirm gtk3 gtk4 qt5-wayland qt6-wayland xorg-xwayland xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk polkit-kde-agent gnome-keyring xdg-user-dirs xdg-user-dirs-gtk

sudo pacman -S --needed --noconfirm noto-fonts noto-fonts-emoji noto-fonts-cjk noto-fonts-extra ttf-noto-nerd

sudo pacman -S --needed --noconfirm ffmpeg git base-devel curl wget zip unzip mpv imv

cd /tmp && git clone https://aur.archlinux.org/yay && cd yay && makepkg -si --noconfirm && cd .. && rm -rf yay

xdg-user-dirs-update
