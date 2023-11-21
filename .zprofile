#
# ~/.zprofile
#

export QT_QPA_PLATFORMTHEME="qt6ct"
export SHELL=/usr/bin/zsh
export EDITOR=nvim
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export BROWSER=/usr/bin/firefox
export LIBVA_DRIVER_NAME=nvidia
export XDG_SESSION_TYPE=wayland
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export WLR_NO_HARDWARE_CURSORS=1
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export TERMINAL=alacritty
export NO_AT_BRIDGE=1
export YTFZF_THUMB_DISP_METHOD='chafa'
export PATH="$PATH:$HOME/.bins"
#mount NAS drive if is there
#
if [ -z "${DISPLAY}" ] && [ "$(tty)" = "/dev/tty1" ]; then
    dbus-run-session Hyprland
fi



