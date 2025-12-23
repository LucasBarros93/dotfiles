#!/usr/bin/env bash

# Detecta monitores conectados
MONITORS=$(bspc query -M | wc -l)

if [ "$MONITORS" -eq 1 ]; then
  # Apenas o notebook
  bspc monitor eDP-1 -d 1 2 3 4 5 6 7 8 9 10
else
  # Notebook + monitor externo
  bspc monitor eDP-1 -d 2 4 6 8 10
  bspc monitor HDMI-1 -d 1 3 5 7 9
fi
