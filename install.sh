#!/bin/bash

# HYPR ARCH SETUP - Interactive Version
# originally meant for CachyOS x86_64 Linux 6.18.9-2-cachyos and hyprland 0.53.3-2.1
# shell: fish 4.4.0 terminal: kitty 0.45.0
# RUN WITH 'sudo -E ./install.sh' !!! to preserve environemnt vars
# REQUIRES paru pacman
echo "flat_dotfiles hyperland arch linux install"
echo "====================="
echo ""

# alias
alias vi=vim --save
alias yay=paru --save

# install mako (notification daemon)
yay -Syu mako --noconfirm

# test notifications:
#notify-send -u low "hello world\!" "This is a low urgency message"
# 
#notify-send -u normal "hello world\!" "This is a normal message"
# 
#notify-send -u critical \
#  "This is a critical message\!" \
#  "OK, that was just a demo ;)"

# install screenshot handler (grim + slurp)
yay -Syu hyprshot --noconfirm

# install app launcher (fuzzel)
yay -Syu fuzzel --noconfirm

# install a screen locker (hyprlock)
yay -Syu hyprlock --noconfirm

# install a status bar (waybar)
yay -Syu waybar --noconfirm

# install idle management daemon
yay -Syu hypridle --noconfirm

# install dark mode (adwaita + qt6)
yay -Syu adw-gtk-theme qt6ct kvantum --noconfirm

# install archlinux-xdg-menu to fix dolphin (wtf)
yay -Syu archlinux-xdg-menu --noconfirm
ln -fs /etc/xdg/menus/arch-applications.menu ~/.config/menus/applications.menu

# install image viewer (imv)
yay -Syu imv --noconfirm

# install video player (mpv)
yay -Syu mpv --noconfirm

# install web browser (vivaldi)
yay -Syu vivaldi --noconfirm

# install calculator (galculator)
yay -Syu galculator --noconfirm

# install sublime-text
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
#stable x86
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
yay -Syu sublime-text --noconfirm


# install screen sharing ability 
# XWayland Video Bridge https://invent.kde.org/system/xwaylandvideobridge
# By design, X11 applications can't access window or screen contents for wayland clients. This is fine in principle, but it breaks screen sharing in tools like Discord, MS Teams, Skype, etc and more.
yay -Syu xwaylandvideobridge --noconfirm

# install audio eq + input processing (needed for shit mic)
yay -Syu easyeffects lsp-plugins calf --noconfirm
# absolute legend: https://adamgradzki.com/adding-deepfilternet-noise-reduction-to-easy-effects-on-arch-linux.html
curl -LO https://github.com/Rikorose/DeepFilterNet/releases/download/v0.5.6/libdeep_filter_ladspa-0.5.6-x86_64-unknown-linux-gnu.so
sudo mv -v libdeep_filter_ladspa-0.5.6-x86_64-unknown-linux-gnu.so /usr/lib64/ladspa/libdeep_filter_ladspa.so

#easyeffects -l LoudnessEqualizer
easyeffects -l mascnprvoice_noisereduction

# dnscrypt-proxy setup (cloudflare)
yay -S dnscrypt-proxy --noconfirm
sudo systemctl stop systemd-resolved
sudo systemctl disable --now systemd-resolved || true
sudo cp /etc/dnscrypt-proxy/dnscrypt-proxy.toml /etc/dnscrypt-proxy/dnscrypt-proxy.toml.bak
sudo sed -i \
  -e "s|^#\?listen_addresses =.*|listen_addresses = ['127.0.0.53:53']|" \
  -e "s|^#\?dnscrypt_servers =.*|dnscrypt_servers = false|" \
  -e "s|^#\?doh_servers =.*|doh_servers = true|" \
  -e "s|^#\?require_dnssec =.*|require_dnssec = true|" \
  -e "s|^#\?cache =.*|cache = true|" \
  -e "s|^#\?cache_size =.*|cache_size = 4096|" \
  "/etc/dnscrypt-proxy/dnscrypt-proxy.toml"
sudo sed -i -e "s|^#.\?server_names =.*|server_names = ['cloudflare', 'cloudflare-security']|" "/etc/dnscrypt-proxy/dnscrypt-proxy.toml"

sudo systemctl enable --now dnscrypt-proxy
# may need to reboot
# browse to https://1.1.1.1/help to verify

# generate gpg key
#gpg --full-generate-key

# other tools
yay -Syu exiftool protontricks 7zip jq wine-mono obs-studio tree --noconfirm

# synology drive
yay -Syu synology-drive qt5-wayland --noconfirm
# mounted D/Project to ~/SynologyDrive
# NFS mount downloads steps below
#sudo mkdir /mnt/synology
#sudo mount -t nfs YOUR_NAS_IP:/volume1/YOUR_SHARE_NAME /mnt/synology
#sudo vi /etc/fstab
# YOUR_NAS_IP:/YOUR_SHARE_NAME /mnt/synology nfs defaults 0 0
#ln -s /mnt/synology/YOUR_SHARE_NAME ~/Downloads


# discord + steam
yay -Syu discord --noconfirm
yay -Syu steam --noconfirm

# dev environment
yay -Syu code docker --noconfirm
systemctl start docker && systemctl enable docker
