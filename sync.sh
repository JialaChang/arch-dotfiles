#!/bin/bash

SCRIPT_DIR="$(dirname "$0")"

sync_dir() {
  local src=$1
  local dest=$2
  if [ -d "$src" ]; then
    rm -rf "$dest"
    cp -r "$src" "$dest"
    echo " -> synced $src"
  else
    echo " -> $src not found, skipping..."
  fi
}

sync_file() {
  local src=$1
  local dest=$2
  if [ -f "$src" ]; then
    cp "$src" "$dest"
    echo " -> synced $src"
  else
    echo " -> $src not found, skipping..."
  fi
}

echo "==> Syncing configs..."
sync_dir ~/.config/hypr "$SCRIPT_DIR/hypr"
sync_dir ~/.config/kitty "$SCRIPT_DIR/kitty"
sync_dir ~/.config/nvim "$SCRIPT_DIR/nvim"
sync_dir ~/.config/waybar "$SCRIPT_DIR/waybar"
sync_file ~/.bashrc "$SCRIPT_DIR/bashrc"
sync_file ~/.zshrc "$SCRIPT_DIR/zshrc"

echo "==> Exporting packages..."
"$SCRIPT_DIR/pkg.sh" export

echo "==> Done!"
