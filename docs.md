

# Keybinds
## General Information

- **Main Modifier**: SUPER (Windows/Command key)
  - Configured as `$mainMod` variable throughout binds
  - Can be changed by modifying `SUPER` to your preferred modifier (`CTRL`, `ALT`, etc.)

### Application Shortcuts

| Keybind | Action |
|---------|--------|
| $mainMod + Q | Open terminal (defined in config variables) |
| $mainMod + E | Launch file manager (configured variable) |
| $mainMod + R | Show application launcher menu |



## Window Management

### Basic Operations
| Keybind | Action |
|---------|--------|
| $mainMod + C | Close active window |
| $mainMod + V | Toggle floating mode for current window |
| $mainMod + F | Toggle fullscreen for current window |

### Focus Movement (Arrow Keys)
Use with main modifier to move focus between windows:
- Left/Right: Move horizontally
- Up/Down: Move vertically



## Workspace Management

### Switching Workspaces
Number keys 1-0 switch workspaces, where '0' represents workspace 10.

| Keybind | Action |
|---------|--------|
| $mainMod + [number] | Focus workspace number |

With Shift to move active window:
| Keybind | Action |
|---------|--------|
| $mainMod+SHIFT + [number] | Move current window to that workspace |

### Special Workspace (Scratchpad)
| Keybind | Action |
|---------|--------|
| $mainMod + D | Toggle special "magic" scratchpad workspace |
| $mainMod+SHIFT + D | Send active window directly to magic workspace |



## Window Arrangement

| Keybind | Action |
|---------|--------|
| $mainMod + P | Tiled layout (dwindle) - see note below |
| $mainMod + J | Toggle split mode for windows |

**Note**: The `togglefloating` and window arrangement binds use the "Dwindle" tiling algorithm by default.



## Window Movement & Resizing

### Focus Between Windows
See arrow key section above (using main modifier)

### Drag to Move/Resize
| Keybind | Action |
|---------|--------|
| $mainMod + Left Mouse Button drag | Move window position |
| $mainMod + Right Mouse Button drag | Resize active window |



## Multimedia & System Controls

These work without the main modifier by default:

### Volume Control (Laptop Keys)
| Keybind | Action |
|---------|--------|
| Audio Raise/Lower/Mute keys | Adjust volume and mute state using PipeWire (`wpctl`) |
| Mic Mute key | Toggle microphone input |

### Brightness Controls
Works with laptop brightness controls:
- Increase/decrease screen brightness



## Media Player Control (Requires playerctl)

These media control buttons work globally:

| Keybind | Action |
|---------|--------|
| Play/Pause button | Pause/play current track |
| Previous Track | Go to previous song in playlist |
| Next Track | Skip to next song |



## Screenshots

| Keybind | Action |
|---------|--------|
| $mainMod+SHIFT + S | Region selection screenshot (hyprshot) |
| Print Screen key | Full output capture |



## Special Functions

| Keybind | Action |
|---------|--------|
| $mainMod + L | Lock screen using hyprlock |
| Mouse Scroll with main modifier held | Cycle through existing workspaces |

## Raw keybinds
```
###################
### KEYBINDINGS ###
###################

$mainMod = SUPER

# See https://wiki.hypr.land/Configuring/Keywords/
# Example binds, see https://wiki.hypr.land/Configuring/Binds/ for more
bind = $mainMod, Q, exec, $terminal
bind = $mainMod, C, killactive,
bind = $mainMod, M, exec, command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit
bind = $mainMod, E, exec, $fileManager
bind = $mainMod, V, togglefloating,
bind = $mainMod, R, exec, $menu
bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, J, layoutmsg, togglesplit, # dwindle 

# Move focus with mainMod + arrow keys
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

# Example special workspace (scratchpad)
bind = $mainMod, D, togglespecialworkspace, magic
bind = $mainMod SHIFT, D, movetoworkspace, special:magic

# Screenshots (hyprshot)
bind = $mainMod SHIFT, S, exec, hyprshot -m region
bind = $mainMod, PRINT, exec, hyprshot -m output

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

# Laptop multimedia keys for volume and LCD brightness
bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
bindel = ,XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+
bindel = ,XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-

# Requires playerctl
bindl = , XF86AudioNext, exec, playerctl next
bindl = , XF86AudioPause, exec, playerctl play-pause
bindl = , XF86AudioPlay, exec, playerctl play-pause
bindl = , XF86AudioPrev, exec, playerctl previous

# Screen lock
bind = $mainMod, L, exec, hyprlock

# Fullscreen bind
bind = $mainMod, F, fullscreen

# Browser bind
bind = $mainMod, B, exec, vivaldi
```





# Mounting Drives

## Local Storage Configuration (fstab entries)

These are example fstab configurations for mounting local drives with proper permissions:

```
UUID=F650F98550F94CBD  /mnt/drive1  ntfs3  rw,uid=1000,gid=1000,umask=022,noatime  0  0
UUID=8C96B70B96B6F4B4  /mnt/drive2  ntfs3  rw,uid=1000,gid=1000,umask=022,noatime  0  0
UUID=90AB-IJKL        /mnt/drive3  vfat   rw,user,fmask=600,dmask=755    0      0
```

## Configuration steps:
1. Create mount points: `sudo mkdir -p /mnt/{drive1,drive2,drive3}`
2. Identify UUIDs with: `lsblk -f`
3. Add entries to `/etc/fstab` using your actual drive UUIDs and file systems
4. Reload systemctl daemon: `sudo systemctl daemon-reload`
5. Apply changes by running: `sudo mount -a`

### Synology NAS NFS Mount

Steps for mounting a network share from Synology:


### Create mount point:
mkdir /mnt/synology

### Temporary test mount (replace with your details):
mount -t nfs nas.ip.address:/volume1/share_name /mnt/synology

### Permanent fstab entry format:
nas.ip.address:/YOUR_SHARE_NAME  /mnt/synology  nfs4  defaults,_netdev,noatime,x-systemd.automount,rw,user 0 0


### Optional symlink for convenience (replace with your actual share path):
`ln -s /mnt/synology/YOUR_SUBFOLDER ~/Downloads`

# Network Configuration

## Manual network setup using nmcli:

### Wired Connection Example (192.168.1.x)


### View current connection settings:
nmcli c show "Wired connection 1"

### Configure static IP address:
nmcli con mod "Wired connection 1" ipv4.method manual
nmcli con mod "Wired connection 1" ipv4.addresses "192.168.1.50/24"
nmcli con mod "Wired connection 1" ipv4.gateway "192.168.1.1"

### Set DNS servers (Cloudflare and Google):
nmcli con mod "Wired connection 1" ipv4.dns "1.1.1.1,8.8.8.8"
nmcli con mod "Wired connection 1" ipv4.ignore-auto-dns yes

### Apply changes:
nmcli con down "Wired connection 1"; nmcli con up "Wired connection 1"

### Verify configuration:
nmcli -p device show


## Changing IP Address Example (to 192.168.1.150)


### Update the address while keeping other settings:
nmcli c mod "Wired connection 1" ipv4.addresses "192.168.1.150/24"

### Reapply configuration (same commands as above):
nmcli con down "Wired connection 1"; nmcli con up "Wired connection 1"


Note: Replace all IP addresses and hostnames with your actual network details.






# No Sound / Mic Fix

## Steps to Resolve Audio Issues with Realtek ALC897 Codec

1. **Open Alsamixer**
    - Turn off automute on all devices.

2. **Use HDAJackRetask Utility**
   1. Select the `Realtek ALC897` codec from the dropdown list.
   2. Enable:
      - "Show unconnected pins"
      - "Advanced override"

3. **Configure Pins for Mic/Headset Jacks**
    - For all pins labeled **"Not Connected"**, adjust settings to be recognized as a microphone.
    - Click **Apply Now**.
   4. Test each mic to identify the correct headset microphone.
      *(Note: This may disable your laptop's internal mic.)*

5. **Deactivate Overrides One by One**
    - Determine which specific override corresponds to your jack.

6. **Install Boot Override & Restart**
    - Click **"Install boot override"**.
    - Reboot the system.

7. **Restart PipeWire (if applicable)**
   ```
   systemctl --user restart wireplumber pipewire pipewire-pulse
   ```





# Running Steam Games with Proton

## Adding Non-Steam Applications to Steam

1. Right-click in library view and select "Add a non-Steam Game"
2. Browse for the game's executable file (.exe)
3. Ensure it shows as running under Proton in its properties

### Skyrim Special Edition Configuration Example

### Compatibility Folder Settings
Set custom compatibility folder path:
```
STEAM_COMPAT_DATA_PATH="/mnt/drive2/SteamLibrary/steamapps/compatdata/975370/" %command%
```

## File Mounting for Game Data (Optional)
Mount local folders into Proton filesystem:
```
STEAM_COMPAT_MOUNTS="/path/to/folder1:/path/to/folder2" %command%
Example: STEAM_COMPAT_MOUNTS="~/Documents/My Games/Skyrim Special Edition/:/drive_c/users/steamuser/My Documents/My Games/" %command%
```

### Game Files Location
Main game installation:
```
/mnt/drive3/SteamLibrary/steamapps/common/Skyrim Special Edition/
Data folder path: /mnt/drive3/.../Skyrim Special Edition/Data/

SKSE configuration location (after setup):
/mnt/drive2/SteamLibrary/steamapps/compatdata/489830/pfx/drive_c/users/steamuser/My Documents/My Games/Skyrim Special Edition/SKSE/
```

### Downgrading Skyrim Special Edition

1. Open Steam console with: `steam steam://open/console`
2. Use these commands to download specific versions:

**For version 1.6.640:**
```
download_depot 489830 489831 3660787314279169352
download_depot 489830 489832 2756691988703496654
download_depot 489830 489833 5291801952219815735
```

**For version 1.5.97:**
```
download_depot 489830 489831 7848722008564294070
download_depot 489830 489832 8702665189575304780
download_depot 489830 489833 2289561010626853674
```

### Post-Download Steps:
- Files download to: `~/.local/share/Steam/ubuntu12_32/steamapps/content/`
- Move downloaded files to your game folder at `.../SteamLibrary/steamapps/common/Skyrim Special Edition/`

### Mod Organizer 2 Linux Installation
Follow the guide from [Furglitch's modorganizer2-linux-installer](https://github.com/Furglitch/modorganizer2-linux-installer) for setting up MO2 on Linux.

### Important Notes:
- Always make sure to NOT use NTFS drives with steam/proton (linking errors)
- Consider creating backups of your save data and configuration before making changes to the Proton filesystem
