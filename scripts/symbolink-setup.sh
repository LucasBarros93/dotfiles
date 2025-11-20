#!/bin/bash

# echo $BASH_SOURCE
# echo "$(dirname $BASH_SOURCE)"
# echo "$(cd $(dirname $BASH_SOURCE) && pwd) "
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
)

normal_symbolinks(){

    for package in ${PACKAGES[@]}; do
        echo "Symbolink $DOTFILE_DIR/$package -> $CONFIG_DIR/$package"
        ln -sf $DOTFILE_DIR/$package $CONFIG_DIR/$package
    done

}

zsh_symbolinks(){
    echo "Symbolink $ZSH_DIR/.zshrc -> $HOME/.zsh"
    ln -sf $ZSH_DIR/.zshrc $HOME/.zsh

    echo "Symbolink $ZSH_DIR/.p10k.zsh -> $HOME/.p10k.zsh"
    ln -sf $ZSH_DIR/.p10k.zsh $HOME/.p10k.zsh
    
}

echo "Creating the $CONFIG_DIR dir"
mkdir -p $CONFIG_DIR

normal_symbolinks
zsh_symbolinks
