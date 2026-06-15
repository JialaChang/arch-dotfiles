#!/bin/bash

cd "$(dirname "$0")"

echo "==> Starting install Starle's dotfiles..."

# funtions
backup() {
    local dir=$1
    if [ -d "$dir/" ]; then
        echo "==> Backup $dir..."
	cp -r "$dir/" "${dir}.backup.${date +%Y%m%d-%H%M%S}/"
    fi
}

deploy() {
    local src=$1
    local dest=$2
    echo "==> Deploy $src to $dest..."
    mkdir -p "$dest/"
    cp -r "$src/" "$dest/"
}

# backup files 
backup "$HOME/.config/hypr"
backup "$HOME/.config/kitty"

# deploy files {src} {dest}
deploy "./hypr" "$HOME/.config/hypr"
deploy "./kitty" "$HOME/.config/kitty"

echo "==> Success :> !!"
