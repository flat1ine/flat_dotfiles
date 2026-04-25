#!/bin/bash

# HYPR ARCH SETUP - REPL Version
# originally meant for CachyOS x86_64 Linux 6.18.9-2-cachyos and hyprland 0.53.3-2.1
# shell: fish 4.4.0 terminal: kitty 0.45.0

echo "flat_dotfiles HYPR ARCH SETUP - REPL Version"
echo "originally meant for CachyOS x86_64 Linux 6.18.9-2-cachyos and hyprland 0.53.3-2.1"
echo "shell: fish 4.4.0 terminal: kitty 0.45.0"
echo "====================="

module_dotfiles() {
    echo "[*] Running Dotfiles & Base Setup..."
    # move all dotfiles
    cp -r ./.config ~ 2>/dev/null || echo "! Warning: Could not copy .config (might already exist or be missing)"
    cp -r ./.local ~ 2>/dev/null || echo "! Warning: Could not copy .local"
    [ -f "./.vimrc" ] && cp ./.vimrc ~ || echo "! Skipping vimrc, file not found in current dir"

    # persist aliases to fish config
    echo "[*] Persisting aliases (vi=vim, yay=paru) to ~/.config/fish/config.fish..."
    mkdir -p ~/.config/fish 2>/dev/null || true

    if ! grep -q "alias vi 'vim --save'" ~/.config/fish/config.fish 2>/dev/null; then
        echo "alias vi 'vim --save'" >> ~/.config/fish/config.fish || echo "! Warning: Could not append alias to fish config."
    fi

    if ! grep -q "alias yay 'paru --save'" ~/.config/fish/config.fish 2>/dev/null; then
        echo "alias yay 'paru --save'" >> ~/.config/fish/config.fish || echo "! Warning: Could not append alias to fish config."
    fi
}

module_hyprland() {
    echo "[*] Running Hyprland / Desktop Environment setup..."
    paru -Syu mako --noconfirm
    paru -Syu hyprshot --noconfirm
    paru -Syu fuzzel --noconfirm
    paru -Syu hyprlock --noconfirm
    paru -Syu waybar --noconfirm
    paru -Syu hypridle --noconfirm
    paru -Syu adw-gtk-theme qt6ct kvantum --noconfirm
    paru -Syu archlinux-xdg-menu --noconfirm
    ln -fs /etc/xdg/menus/arch-applications.menu ~/.config/menus/applications.menu 2>/dev/null || echo "! Warning: Could not link xdg menu"
    paru -Syu imv mpv vivaldi --noconfirm
    paru -Syu xwaylandvideobridge --noconfirm
}

module_audio() {
    echo "[*] Running Audio & Input Processing setup..."
    paru -Syu easyeffects lsp-plugins calf --noconfirm
    # Download and move LADSPA plugin if it exists or needs to be fetched?
    LADSPA_URL="https://github.com/Rikorose/DeepFilterNet/releases/download/v0.5.6/libdeep_filter_ladspa-0.5.6-x86_64-unknown-linux-gnu.so"
    FILENAME=$(basename "$LADSPA_URL")

    if [ ! -f "$FILENAME" ]; then
        echo "[*] Downloading DeepFilterNet LADSPA plugin..."
        curl -LO "$LADSPA_URL" || echo "! Failed to download plugin."
    fi

    sudo mv -v "$FILENAME" /usr/lib64/ladspa/libdeep_filter_ladspa.so 2>/dev/null || {
         echo "! Error: Could not move LADSPA file (check if directory exists or permissions)"
    }

    easyeffects -l mascnprvoice_noisereduction 2>/dev/null || echo "! Warning: Could not load easyeffects preset."
}

module_networking() {
    echo "[*] Running Networking & DNS setup (Cloudflare)..."
    paru -S dnscrypt-proxy --noconfirm
    sudo systemctl stop systemd-resolved 2>/dev/null || true
    sudo systemctl disable --now systemd-resolved 2>/dev/null || true
    [ -f "/etc/dnscrypt-proxy/dnscrypt-proxy.toml" ] && sudo cp /etc/dnscrypt-proxy/dnscrypt-proxy.toml /etc/dnscrypt-proxy/dnscrypt-proxy.toml.bak

    sudo sed -i \
      -e "s|^#\?listen_addresses =.*|listen_addresses = ['127.0.0.53:53']|" \
      -e "s|^#\?dnscrypt_servers =.*|dnscrypt_servers = false|" \
      -e "s|^#\?doh_servers =.*|doh_servers = true|" \
      -e "s|^#\?require_dnssec =.*|require_dnssec = true|" \
      -e "s|^#\?cache =.*|cache = true|" \
      -e "s|^#\?cache_size =.*|cache_size = 4096|" \
      "/etc/dnscrypt-proxy/dnscrypt-proxy.toml"

    sudo sed -i -e "s|^#.\?server_names =.*|server_names = ['cloudflare', 'cloudflare-security']|" "/etc/dnscrypt-proxy/dnscrypt-proxy.toml"
    sudo systemctl enable --now dnscrypt-proxy 2>/dev/null || echo "! Error: Failed to start dnscrypt-proxy."
}

module_dev() {
    echo "[*] Running Development & AI Tools setup..."
    paru -Syu code docker --noconfirm
    sudo systemctl start docker && sudo systemctl enable docker 2>/dev/null || echo "! Warning: Docker service failed to start"

    # Sublime Text (requires repo addition)
    if ! grep -q "sublimehq-pub.gpg" /etc/pacman.key 2>/dev/null; then # Rough check if we've done this before? Not perfect but better than nothing for a script.
        echo "[*] Setting up Sublime Text repository..."
        curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg || echo "! Failed to add Sublime key"
        echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf > /dev/null
    fi
    paru -Syu sublime-text --noconfirm

    # AI Toolkit (Claude)
    echo "[*] Installing Claude CLI..."
    curl -fsSL https://claude.ai/install.sh | bash || echo "! Failed to install Claude"
}

module_utilities() {
    echo "[*] Running Utilities & Gaming setup..."
    paru -Syu exiftool protontricks 7zip jq wine-mono obs-studio tree --noconfirm
    paru -Syu synology-drive qt5-wayland --noconfirm
    paru -Syu discord steam --noconfirm
}

run_all() {
    module_dotfiles
    module_hyprland
    module_audio
    module_networking
    module_dev
    module_utilities
}

main_menu() {
    while true; do
        echo ""
        echo "--- Installation Menu ---"
        echo "[Enter] RUN ALL MODULES (Default)"
        echo "1) Dotfiles & Base Setup"
        echo "2) Hyprland / Desktop Environment"
        echo "3) Audio & Input Processing"
        echo "4) Networking & DNS (Cloudflare)"
        echo "5) Development & AI Tools"
        echo "6) Utilities & Gaming"
        echo "q) Quit"
        read -p "Select an option: " choice

        case $choice in
            ""|7|" ") run_all ;;
            1) module_dotfiles ;;
            2) module_hyprland ;;
            3) module_audio ;;
            4) module_networking ;;
            5) module_dev ;;
            6) module_utilities ;;
            q|Q) echo "Exiting."; exit 0 ;;
            *) echo "[!] Invalid option. Please try again." ;;
        esac

        echo ""
        echo "[+] Module execution finished."
    done
}

main_menu
