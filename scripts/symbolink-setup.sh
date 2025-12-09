#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
WHITE='\033[0;37m'

DOTFILE_DIR="$(dirname $(cd $(dirname $BASH_SOURCE) && pwd))"
CONFIG_DIR="$HOME/.config"

ZSH_DIR="$DOTFILE_DIR/zsh"

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
)

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
	echo -e "${WHITE}Symbolink $ZSH_DIR/.zshrc -> $HOME/.zsh"
	ln -sf $ZSH_DIR/.zshrc $HOME/.zshrc

	echo -e "${WHITE}Symbolink $ZSH_DIR/.p10k.zsh -> $HOME/.p10k.zsh"
	ln -sf $ZSH_DIR/.p10k.zsh $HOME/.p10k.zsh

}

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

	echo -e "${BLUE} Done!"
}

# Só executa se for chamado diretamente
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	main "$@"
fi
