#!/bin/bash

pacman_succ=0
pacman_fail=0
aur_succ=0
aur_fail=0

echo "==> Starting install packages..."

echo ""
echo "==> Installing pacman packages..."
while IFS= read -r pkg; do
    [[ "$pkg" =~ ^#|^$|\[aur\] ]] && continue
    echo "    -> installing $pkg..."
    if sudo pacman -S --needed --noconfirm "$pkg"; then
        ((pacman_succ++))
    else
        ((pacman_fail++))
    fi
done < "$(dirname "$0")/pkg.txt"

echo ""
echo "==> Installing AUR packages..."
while IFS= read -r pkg; do
    [[ "$pkg" =~ ^#|^$ ]] && continue
    [[ "$pkg" =~ ^\[aur\] ]] || continue
    pkg="${pkg#\[aur\] }"
    echo "    -> installing $pkg..."
    if yay -S --needed --noconfirm "$pkg"; then
        ((aur_succ++))
    else
        ((aur_fail++))
    fi
done < "$(dirname "$0")/pkg.txt"

echo ""
echo "==> Packages installed!"
echo "    pacman: $pacman_succ success, $pacman_fail failed"
echo "    aur: $aur_succ success, $aur_fail failed"
