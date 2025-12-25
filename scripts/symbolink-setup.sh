#!/bin/bash

# ================= COLORS =================
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
WHITE='\033[0;37m'

# ================= PATHS =================
DOTFILE_DIR="$(dirname $(cd $(dirname $BASH_SOURCE) && pwd))"
CONFIG_DIR="$HOME/.config"

ZSH_DIR="$DOTFILE_DIR/zsh"
XINIT_DIR="$DOTFILE_DIR/xinit"
GREETD_DIR="$DOTFILE_DIR/greetd"

PACKAGES=(
    # WM
	"bspwm"
	"sxhkd"
	"picom"

    # TEXT EDITOR
	"nvim"

    # SHELL
	"kitty"
	"tmux"

    # UTILS
	"polybar"
	"rofi"

    # PRETTY
	"bat"
    "fastfetch"
)

# ================= FUNCTIONS =================
normal_symbolinks() {

	for package in ${PACKAGES[@]}; do

		if [[ -L "$CONFIG_DIR/$package" ]]; then
			echo -e "${RED}Removing the exist $CONFIG_DIR/$package"
			rm -rf $CONFIG_DIR/$package
		fi

		echo -e "${WHITE}Symbolink $DOTFILE_DIR/$package -> $CONFIG_DIR/$package"
		ln -sf $DOTFILE_DIR/$package $CONFIG_DIR/$package
		echo ""
	done

}

zsh_symbolinks() {
    if [[ -f "$HOME/.zshrc" ]]; then
        echo -e "${RED}Moving the exist .zshrc to .zshrc.bak"
        mv $HOME/.zshrc $HOME/.zshrc.bak
	fi

	echo -e "${WHITE}Symbolink $ZSH_DIR/.zshrc -> $HOME/.zshrc"
	ln -sf $ZSH_DIR/.zshrc $HOME/.zshrc

    if [[ -f "$HOME/.p10k.zsh" ]]; then
        echo -e "${RED}Moving the exist .p10k.zsh to .p10k.zsh.bak"
        mv $HOME/.p10k.zsh $HOME/.p10k.zsh.bak
	fi

	echo -e "${WHITE}Symbolink $ZSH_DIR/.p10k.zsh -> $HOME/.p10k.zsh"
	ln -sf $ZSH_DIR/.p10k.zsh $HOME/.p10k.zsh

}

copy_files() {
    if [[ -f "$HOME/.xinitrc" ]]; then
        echo -e "${RED}Moving the exist .xinitrc to .xinitrc.bak"
        mv $HOME/.xinitrc $HOME/.xinitrc.bak
	fi

	echo -e "${WHITE}Copy $XINIT_DIR/.xinitrc -> $HOME/.xinitrc"
	cp $XINIT_DIR/.xinitrc $HOME/.xinitrc

    if [[ -f "/etc/greetd/config.toml" ]]; then
        echo -e "${RED}Moving the exist config.toml to config.toml.bak (greetd)"
        sudo mv /etc/greetd/config.toml /etc/greetd/config.toml.bak
	fi

    echo -e "${WHITE}Copy $GREETD_DIR/config.toml -> /etc/greetd/config.toml"
    sudo cp $GREETD_DIR/config.toml /etc/greetd/config.toml
    echo -e "${RED}You need to start the greetd.service"

    if [[ ! -f "$HOME/Pictures/wpp/wpp.png" ]]; then
        echo -e "${WHITE}Copy $DOTFILE_DIR/bspwm/wpp.png -> $HOME/Pictures/wpp/wpp.png"
        cp $DOTFILE_DIR/bspwm/wpp.png $HOME/Pictures/wpp/wpp.png
    else
        echo -e "${RED}Wallpaper file already exists"
    fi

}

# ================= MAIN =================
main() {
	echo -e "${BLUE}  DOTFILES SYMLINK SETUP"
	echo -e "${BLUE}  Dotfiles: $DOTFILE_DIR"
	echo -e "${BLUE}  Config: $CONFIG_DIR"
	echo -e "${BLUE}=========================="

	# Cria diretório se não existir
	if [[ ! -d "$CONFIG_DIR" ]]; then
		echo -e "${GREEN}  Creating $CONFIG_DIR"
		mkdir -p "$CONFIG_DIR"
	fi

	normal_symbolinks
	zsh_symbolinks
    copy_files

	echo -e "${BLUE} Done!"
}

# Só executa se for chamado diretamente
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	main "$@"
fi
