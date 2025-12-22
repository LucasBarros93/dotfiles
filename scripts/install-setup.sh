#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
WHITE='\033[0;37m'

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

    "ttf-jetbrains-mono-nerd"
    "ttf-font-awesome"

    "escrotum"
    "at"
)

normal_instalation() {
    echo -e "${WHITE}Starting installation"

	for package in ${PACKAGES[@]}; do
        
        if sudo pacman -S --needed --noconfirm $package; then
            echo -e "${GREEN}$package instaled"
        else
            echo -e "${RED}$ failed"
        if
		echo ""

    done
}
