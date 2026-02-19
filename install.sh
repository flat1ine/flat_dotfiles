### HYPR ARCH SETUP
# originally meant for CachyOS x86_64 Linux 6.18.9-2-cachyos and hyprland 0.53.3-2.1
# shell: fish 4.4.0 terminal: kitty 0.45.0
# RUN WITH 'sudo -E ./install.sh' !!! to preserve environemnt vars

#modified:
#mkdir -p ~/SynologyDrive/flat_dotfiles
#mkdir -p ~/SynologyDrive/flat_dotfiles/.config/hypr
#mkdir -p ~/SynologyDrive/flat_dotfiles/.config/fish
#mkdir -p ~/SynologyDrive/flat_dotfiles/.config/kitty
#mkdir -p ~/SynologyDrive/flat_dotfiles/.config/mako
#mkdir -p ~/SynologyDrive/flat_dotfiles/.config/fuzzel
#mkdir -p ~/SynologyDrive/flat_dotfiles/.config/ashell
#mkdir -p ~/SynologyDrive/flat_dotfiles/.config/menus
#mkdir -p ~/SynologyDrive/flat_dotfiles/.config/vivaldi
#mkdir -p ~/SynologyDrive/flat_dotfiles/.config/mpv
#mkdir -p ~/SynologyDrive/flat_dotfiles/.config/waybar
#mkdir -p ~/SynologyDrive/flat_dotfiles/.config/pipewire/pipewire.conf.d
#mkdir -p ~/SynologyDrive/flat_dotfiles/.config/wireplumber/wireplumber.conf.d
#mkdir -p ~/SynologyDrive/flat_dotfiles/.local/share/easyeffects/output
#mkdir -p ~/SynologyDrive/flat_dotfiles/.local/share/easyeffects/input

#cp ~/.config/hypr/hyprland.conf ~/SynologyDrive/flat_dotfiles/.config/hypr/hyprland.conf
#cp ~/.config/kitty/kitty.conf ~/SynologyDrive/flat_dotfiles/.config/kitty/kitty.conf
#cp ~/.config/mako/config ~/SynologyDrive/flat_dotfiles/.config/mako/config
#cp ~/.config/fuzzel/fuzzel.ini ~/SynologyDrive/flat_dotfiles/.config/fuzzel/fuzzel.ini
#cp ~/.config/ashell/config.toml ~/SynologyDrive/flat_dotfiles/.config/ashell/config.toml
#cp ~/.config/hypr/hyprlock.conf ~/SynologyDrive/flat_dotfiles/.config/hypr/hyprlock.conf 
#cp ~/.config/menus/applications.menu ~/SynologyDrive/flat_dotfiles/.config/menus/applications.menu 
#cp ~/.config/mimeapps.list ~/SynologyDrive/flat_dotfiles/.config/mimeapps.list 
#cp ~/.config/mpv/mpv.conf ~/SynologyDrive/flat_dotfiles/.config/mpv/mpv.conf 
#cp ~/.config/waybar/config.jsonc ~/SynologyDrive/flat_dotfiles/.config/waybar/config.jsonc 
#cp ~/.config/waybar/style.css ~/SynologyDrive/flat_dotfiles/.config/waybar/style.css 
#cp ~/.config/waybar/power_menu.xml ~/SynologyDrive/flat_dotfiles/.config/waybar/power_menu.xml 
#cp ~/.config/hypr/hypridle.conf ~/SynologyDrive/flat_dotfiles/.config/hypr/hypridle.conf 
#cp ~/.config/pipewire/pipewire.conf.d/custom.conf ~/SynologyDrive/flat_dotfiles/.config/pipewire/pipewire.conf.d/custom.conf
#cp ~/.config/wireplumber/wireplumber.conf.d/disable-suspension.conf ~/SynologyDrive/flat_dotfiles/.config/wireplumber/wireplumber.conf.d/disable-suspension.conf
#cp ~/.config/fish/config.fish ~/SynologyDrive/flat_dotfiles/.config/fish/config.fish
#cp ~/.config/dolphinrc ~/SynologyDrive/flat_dotfiles/.config/dolphinrc
#cp -r ~/.config/fish ~/SynologyDrive/flat_dotfiles/.config/fish # recursive
#cp -r ~/.config/vivaldi ~/SynologyDrive/flat_dotfiles/.config/vivaldi # recursive

#cp ~/.local/share/easyeffects/output/LoudnessEqualizer.json ~/SynologyDrive/flat_dotfiles/.local/share/easyeffects/output/LoudnessEqualizer.json
#cp ~/.local/share/easyeffects/input/mascnprvoice_noisereduction.json ~/SynologyDrive/flat_dotfiles/.local/share/easyeffects/input/mascnprvoice_noisereduction.json

#cp ~/.vimrc ~/SynologyDrive/flat_dotfiles/

#find ~/SynologyDrive/flat_dotfiles/ -not -path "*/vivaldi*" -ls

#create repo
#cd flat_dotfiles
#git init
#git add .
#git commit -m "Initial commit"
# go on github and make the project
#git remote add origin https://github.com/USERNAME/REPONAME.git
#git push -u origin main

# script setup

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
yay -Syu waybar

# install idle management daemon
yay -Syu hypridle

# install dark mode (adwaita + qt6)
yay -Syu adw-gtk-theme qt6ct kvantum

# install image viewer (imv)
yay -Syu imv

# install video player (mpv)
yay -Syu mpv

# install web browser (vivaldi)
yay -Syu vivaldi

# install calculator (galculator)
yay -Syu galculator

# install sublime-text
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
#stable x86
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
yay -Syu sublime-text --noconfirm

# install archlinux-xdg-menu to fix dolphin (wtf)
yay -Syu archlinux-xdg-menu
ln -fs /etc/xdg/menus/arch-applications.menu ~/.config/menus/applications.menu

# install screen sharing ability 
# XWayland Video Bridge https://invent.kde.org/system/xwaylandvideobridge
# By design, X11 applications can't access window or screen contents for wayland clients. This is fine in principle, but it breaks screen sharing in tools like Discord, MS Teams, Skype, etc and more.
yay -Syu xwaylandvideobridge

# no sound / no mic fix
#alsamixer
# turn off automute on all devices
#Launch the HDAJackRetask utility
#Select the Realtek ALC897 codec from the drop down list
#Select show unconnected pins and advanced override
#For all the pins which have Not Connected as their name, adjust the settings as I have done in this screenshot for pin 0x19 and click apply now. #Pin config
#   Test all the mics. One of them should be your headset mic. You might lose your laptops internal mic.(I don't need it so it did't bother me).
#Try deactivating the overrides one by one to determine which pin is actually connected to the jack.
#Click install boot override
#Restart

# restart pipewire:
#systemctl --user restart wireplumber pipewire pipewire-pulse

# install audio eq + input processing (needed for shit mic)
yay -Syu easyeffects lsp-plugins calf
# absolute legend: https://adamgradzki.com/adding-deepfilternet-noise-reduction-to-easy-effects-on-arch-linux.html
curl -LO https://github.com/Rikorose/DeepFilterNet/releases/download/v0.5.6/libdeep_filter_ladspa-0.5.6-x86_64-unknown-linux-gnu.so
sudo mv -v libdeep_filter_ladspa-0.5.6-x86_64-unknown-linux-gnu.so /usr/lib64/ladspa/libdeep_filter_ladspa.so

easyeffects -l LoudnessEqualizer
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
yay -Syu exiftool protontricks 7zip jq wine-mono obs-studio tree

# synology drive
yay -Syu synology-drive qt5-wayland
# mounted D/Project to ~/SynologyDrive
# NFS mount downloads steps below
#sudo mkdir /mnt/synology
#sudo mount -t nfs YOUR_NAS_IP:/volume1/YOUR_SHARE_NAME /mnt/synology
#sudo vi /etc/fstab
# YOUR_NAS_IP:/YOUR_SHARE_NAME /mnt/synology nfs defaults 0 0
#ln -s /mnt/synology/YOUR_SHARE_NAME ~/Downloads


# discord + steam
yay -Syu discord
yay -Syu steam

# dev environment
yay -Syu code docker
systemctl start docker && systemctl enable docker


# running a steam game:
# add .exe as a non-steam app
# make sure it's running in proton in steam settings
# change compat folder if needed:
# STEAM_COMPAT_DATA_PATH="/mnt/drive2/SteamLibrary/steamapps/compatdata/975370/" %command%

# downgrade skyrim 
# https://github.com/Furglitch/modorganizer2-linux-installer
#steam steam://open/console
#For 1.6.640:
#    download_depot 489830 489831 3660787314279169352
#    download_depot 489830 489832 2756691988703496654
#    download_depot 489830 489833 5291801952219815735
#
#For 1.5.97:
#    download_depot 489830 489831 7848722008564294070
#    download_depot 489830 489832 8702665189575304780
#    download_depot 489830 489833 2289561010626853674
# move files downloaded in ~/.local/share/Steam/ubuntu12_32/steamapps/content/ to game folder /mnt/drive3/SteamLibrary/steamapps/common/Skyrim Special Edition/
# STEAM_COMPAT_MOUNTS="/path/to/folder1:/path/to/folder2" %command%

# my games prefix folder: /mnt/drive3/SteamLibrary/steamapps/compatdata/489830/pfx/drive_c/users/steamuser/My Documents/My Games/Skyrim Special Edition/SKSE/
# game folder: /mnt/drive3/SteamLibrary/steamapps/common/Skyrim Special Edition/Data/

# mount drives
#sudo mkdir /mnt/drive1 /mnt/drive2 /mnt/drive3
#lsblk -f
#sudo echo 'UUID=F650F98550F94CBD  /mnt/drive1  ntfs3  rw,uid=1000,gid=1000,umask=022,noatime  0  0' >> /etc/fstab
#sudo echo 'UUID=8C96B70B96B6F4B4  /mnt/drive2  ntfs3  rw,uid=1000,gid=1000,umask=022,noatime  0  0' >> /etc/fstab
# UUID=F650F98550F94CBD  /mnt/drive1  ntfs3  rw,uid=1000,gid=1000,umask=022,noatime  0  0
# UUID=8C96B70B96B6F4B4  /mnt/drive2  ntfs3  rw,uid=1000,gid=1000,umask=022,noatime  0  0
# UUID=90AB-IJKL  /mnt/drive3  ntfs3  rw,uid=1000,gid=1000,umask=022,noatime  0  0
#cat /etc/fstab
#sudo mount -a

# mounted D/Project to ~/SynologyDrive
# NFS mount downloads steps below
#sudo mkdir /mnt/synology
#sudo mount -t nfs YOUR_NAS_IP:/volume1/YOUR_SHARE_NAME /mnt/synology
#sudo vim /etc/fstab
# YOUR_NAS_IP:/YOUR_SHARE_NAME /mnt/synology nfs defaults 0 0
#ln -s /mnt/synology/YOUR_SHARE_NAME ~/Downloads

# network config (this should be manual)
#nmcli c show "Wired connection 1"
#
#nmcli connection modify "Wired connection 1" ipv4.method manual
#nmcli connection modify "Wired connection 1" ipv4.addresses "192.168.1.50/24"
#nmcli connection modify "Wired connection 1" ipv4.gateway "192.168.1.1"
#nmcli connection modify "Wired connection 1" ipv4.dns "1.1.1.1 8.8.8.8"
#nmcli connection modify "Wired connection 1" ipv4.ignore-auto-dns yes
#
#nmcli connection down "Wired connection 1"
#nmcli connection up "Wired connection 1"
#
#nmcli c show "Wired connection 1"
#
#nmcli connection modify "Wired connection 1" ipv4.addresses "192.168.1.150/24"
#nmcli connection modify "Wired connection 1" ipv4.gateway "192.168.1.1"
#nmcli connection modify "Wired connection 1" ipv4.dns "1.1.1.1 8.8.8.8"
#nmcli connection modify "Wired connection 1" ipv4.ignore-auto-dns yes
#nmcli connection modify "Wired connection 1" ipv4.method manual
#
#nmcli connection down "Wired connection 1"
#nmcli connection up "Wired connection 1"
#
#nmcli c show "Wired connection 1"
#

# all binds:
# Example binds, see https://wiki.hypr.land/Configuring/Binds/ for more
#bind = $mainMod, Q, exec, $terminal
#bind = $mainMod, C, killactive,
#bind = $mainMod, M, exec, command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit
#bind = $mainMod, E, exec, $fileManager
#bind = $mainMod, V, togglefloating,
#bind = $mainMod, R, exec, $menu
#bind = $mainMod, P, pseudo, # dwindle
#bind = $mainMod, J, togglesplit, # dwindle

# Move focus with mainMod + arrow keys
#bind = $mainMod, left, movefocus, l
#bind = $mainMod, right, movefocus, r
#bind = $mainMod, up, movefocus, u
#bind = $mainMod, down, movefocus, d

# Switch workspaces with mainMod + [0-9]
#bind = $mainMod, 1, workspace, 1
#bind = $mainMod, 2, workspace, 2
#bind = $mainMod, 3, workspace, 3
#bind = $mainMod, 4, workspace, 4
#bind = $mainMod, 5, workspace, 5
#bind = $mainMod, 6, workspace, 6
#bind = $mainMod, 7, workspace, 7
#bind = $mainMod, 8, workspace, 8
#bind = $mainMod, 9, workspace, 9
#bind = $mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
#bind = $mainMod SHIFT, 1, movetoworkspace, 1
#bind = $mainMod SHIFT, 2, movetoworkspace, 2
#bind = $mainMod SHIFT, 3, movetoworkspace, 3
#bind = $mainMod SHIFT, 4, movetoworkspace, 4
#bind = $mainMod SHIFT, 5, movetoworkspace, 5
#bind = $mainMod SHIFT, 6, movetoworkspace, 6
#bind = $mainMod SHIFT, 7, movetoworkspace, 7
#bind = $mainMod SHIFT, 8, movetoworkspace, 8
#bind = $mainMod SHIFT, 9, movetoworkspace, 9
#bind = $mainMod SHIFT, 0, movetoworkspace, 10

# Example special workspace (scratchpad)
#bind = $mainMod, D, togglespecialworkspace, magic
#bind = $mainMod SHIFT, D, movetoworkspace, special:magic

# Screenshots (hyprshot)
#bind = $mainMod SHIFT, S, exec, hyprshot -m region
#bind = $mainMod, PRINT, exec, hyprshot -m output

# Scroll through existing workspaces with mainMod + scroll
#bind = $mainMod, mouse_down, workspace, e+1
#bind = $mainMod, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
#bindm = $mainMod, mouse:272, movewindow
#bindm = $mainMod, mouse:273, resizewindow

# Laptop multimedia keys for volume and LCD brightness
#bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
#bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-

# Requires playerctl
#bindl = , XF86AudioNext, exec, playerctl next
#bindl = , XF86AudioPause, exec, playerctl play-pause
#bindl = , XF86AudioPlay, exec, playerctl play-pause
#bindl = , XF86AudioPrev, exec, playerctl previous