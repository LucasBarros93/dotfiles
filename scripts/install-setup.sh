#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
WHITE='\033[0;37m'

X11=(
    "xorg-server"
    "xorg-xinit"
    "xorg-xrandr"
    "xorg-xset"

    "xorg-xev"
    "xorg-xprop"
    "xorg-xinput"
    "xorg-xauth"

    # "xorg-fonts-encodings" 
    # "xorg-xdpyinfo"
    # "xorg-xkbcomp"
    # "xorg-xrdb"
    # "xorg-server-common"
    "xorg-xmodmap"
    "xorg-setxkbmap"
)

PACKAGES=(
	"bspwm"
	"sxhkd"
	"picom"

	"nvim"

	"kitty"
	"tmux"

	"polybar"
	"rofi"

	"bat"

    "fastfetch"

    "noto-fonts-cjk"
    "ttf-thai-tlw"
    "noto-fonts"
    "noto-fonts-extra"

    "feh"

    "ttf-jetbrains-mono-nerd"
    "ttf-font-awesome"

    "escrotum-git"
    "at"
    "xclip"
)

essential_installation() {
    echo -e "${WHITE}Installing git and base-devel..."

    if ! sudo pacman -S --needed --noconfirm git base-devel; then
        echo -e "${RED}Failed to install git and base-devel"
        return 1
    fi

    echo -e "${GREEN}git and base-devel installed"

    if command -v yay >/dev/null 2>&1; then
        echo -e "${GREEN}yay is already installed"
        return 0
    fi

    echo -e "${WHITE}Installing yay..."

    local tmpdir
    tmpdir="$(mktemp -d)"

    if ! git clone https://aur.archlinux.org/yay.git "$tmpdir/yay"; then
        echo -e "${RED}Failed to clone yay repository"
        rm -rf "$tmpdir"
        return 1
    fi

    if ! (cd "$tmpdir/yay" && makepkg -si --noconfirm); then
        echo -e "${RED}Failed to build/install yay"
        rm -rf "$tmpdir"
        return 1
    fi

    rm -rf "$tmpdir"
    echo -e "${GREEN}yay installed successfully"
}

x11_instalation() {
    echo -e "${WHITE}Starting x11 installation"

	for package in ${X11[@]}; do
        
        if sudo pacman -S --needed --noconfirm $package; then
            echo -e "${GREEN}$package instaled"
        else
            echo -e "${RED}$ failed"
        if

    done
}

normal_instalation() {
    echo -e "${WHITE}Starting normal installation"

	for package in ${PACKAGES[@]}; do
        
        if yay -S --needed --noconfirm $package; then
            echo -e "${GREEN}$package instaled"
        else
            echo -e "${RED}$ failed"
        if

    done
}

main() {
	echo -e "${BLUE}  INSTALL SETUP"
	echo -e "${BLUE}=========================="

    essential_installation
    x11_instalation
    normal_instalation

	echo -e "${BLUE} Done!"
}

# Só executa se for chamado diretamente
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	main "$@"
fi
