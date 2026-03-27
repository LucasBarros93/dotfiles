#!/bin/bash

# Conta atualizações oficiais
pac=$(checkupdates 2>/dev/null)
pac_count=$(echo "$pac" | wc -w | awk '{print $1}')
if [ -z "$pac" ]; then pac_count=0; else pac_count=$(echo "$pac" | wc -l); fi

# Conta atualizações do AUR (remova estas 3 linhas se não usar AUR)
aur=$(yay -Qua 2>/dev/null)
if [ -z "$aur" ]; then aur_count=0; else aur_count=$(echo "$aur" | wc -l); fi

# Total
total=$((pac_count + aur_count))

if [ "$total" -gt 15 ]; then
    # Gera uma lista para o tooltip (o que aparece quando passa o mouse)
    tooltip="Pacman: $pac_count\nAUR: $aur_count\n\nPacotes:\n$pac\n$aur"
    # Escapa quebras de linha para o formato JSON
    tooltip=$(echo "$tooltip" | sed -z 's/\n/\\n/g' | sed 's/\\n$//')
    
    echo "{\"text\": \"$total\", \"tooltip\": \"$tooltip\", \"class\": \"outdated\"}"
else
    echo "{\"text\": \"0\", \"tooltip\": \"System is updated!\", \"class\": \"updated\"}"
fi
