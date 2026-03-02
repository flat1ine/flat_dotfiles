# flat_dotfiles
kitty + fish + hyprland dotfiles

## Environment

| Component | Tool |
|-----------|------|
| OS | Arch Linux |
| Window Manager | Hyprland |
| Terminal | Kitty |
| Shell | Fish |
| Status Bar | Waybar |
| Launcher | Fuzzel |
| Notifications | Mako |
| Text Editor | Sublime Text |
| Media Player | mpv |
| Image Viewer | imv |
| File Manager | Dolphin |
| Browser | Vivaldi |
| Audio | PipeWire + WirePlumber + EasyEffects |
| Screen Lock | Hyprlock |
| Idle Daemon | Hypridle |

## Directory Structure

```
.
├── .config
│   ├── ashell
│   │   └── config.toml
│   ├── dolphinrc
│   ├── fish
│   │   ├── config.fish
│   │   └── fish
│   │       ├── completions
│   │       ├── conf.d
│   │       ├── config.fish
│   │       ├── fish_variables
│   │       └── functions
│   │           ├── vi.fish
│   │           └── yay.fish
│   ├── fuzzel
│   │   └── fuzzel.ini
│   ├── hypr
│   │   ├── hypridle.conf
│   │   ├── hyprland.conf
│   │   └── hyprlock.conf
│   ├── kitty
│   │   └── kitty.conf
│   ├── mako
│   │   └── config
│   ├── menus
│   │   └── applications.menu
│   ├── mimeapps.list
│   ├── mpv
│   │   └── mpv.conf
│   ├── pipewire
│   │   └── pipewire.conf.d
│   │       └── custom.conf
│   ├── waybar
│   │   ├── config.jsonc
│   │   ├── power_menu.xml
│   │   └── style.css
│   └── wireplumber
│       └── wireplumber.conf.d
│           └── disable-suspension.conf
├── .local
│   └── share
│       └── easyeffects
│           ├── input
│           │   └── mascnprvoice_noisereduction.json
│           └── output
│               └── LoudnessEqualizer.json
├── install.sh
└── .vimrc
```

## Setup

Clone the repo and copy files to their respective locations, or symlink with stow. 

> Do not run install.sh unless you want ALL the dependencies and software packages.

```bash
git clone https://github.com/flat1ine/flat_dotfiles.git
cd flat_dotfiles
cp -r ./.config ~
cp -r ./.local ~
cp ./.vimrc ~
```

## Notes

- See docs.md https://github.com/flat1ine/flat_dotfiles/blob/main/docs.md for keybinds and manual setup steps.
- EasyEffects profiles live in `~/.local/share/easyeffects/` and are loaded automatically, configurable in the EasyEffects UI.
- WirePlumber's `disable-suspension.conf` prevents audio devices from suspending during idle.
- PipeWire's `custom.conf` overrides default sample rate / buffer settings.
