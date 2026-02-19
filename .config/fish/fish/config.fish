source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
# ~/.config/fish/config.fish

    # Append /opt/cuda/bin to PATH
    set -x PATH /opt/cuda/bin $HOME/.cargo/bin $PATH

    # Append /opt/cuda/lib64 to LD_LIBRARY_PATH
    if set -q LD_LIBRARY_PATH
        set -x LD_LIBRARY_PATH /opt/cuda/lib64 $LD_LIBRARY_PATH
    else
        set -x LD_LIBRARY_PATH /opt/cuda/lib64
    end
