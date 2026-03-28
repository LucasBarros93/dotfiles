#!/bin/bash

# Verifica updates do pacman + AUR (se tiver yay/paru)
PACMAN_UPDATES=$(checkupdates 2>/dev/null | wc -l)

AUR_UPDATES=$(yay -Qua 2>/dev/null | wc -l)

TOTAL=$((PACMAN_UPDATES + AUR_UPDATES))

if [ "$TOTAL" -gt 15 ]; then
    echo "{\"text\": \" $TOTAL\", \"tooltip\": \"Pacman: $PACMAN_UPDATES  AUR: $AUR_UPDATES\", \"class\": \"outdated\"}"
else
    echo "{\"text\": \" $TOTAL\", \"tooltip\": \"Pacman: $PACMAN_UPDATES  AUR: $AUR_UPDATES\", \"class\": \"updated\"}"
fi
