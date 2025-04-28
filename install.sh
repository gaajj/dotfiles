#!/bin/bash

set -e  # Exit on error

DOTFILES_DIR="$HOME/.dotfiles"
CONFIG_DIR="$HOME/.config"
SSH_DIR="$HOME/.ssh"
BACKUP_DIR="$DOTFILES_DIR/backup/backup_$(date +%Y%m%d%H%M%S)"

mkdir -p "$BACKUP_DIR"

# Backup function
backup_if_needed() {
    if [ -e "$1" ] && [ ! -L "$1" ]; then
        echo "Backing up $1 to $BACKUP_DIR"
        mkdir -p "$(dirname "$BACKUP_DIR/$1")"
        mv "$1" "$BACKUP_DIR/$1"
    fi
}

echo "Linking top-level dotfiles..."

# Top-level dotfiles (like .bashrc, .bash_aliases)
for file in "$DOTFILES_DIR"/.*; do
    filename=$(basename "$file")
    [[ "$filename" == "." || "$filename" == ".." || "$filename" == ".git" || "$filename" == ".config" || "$filename" == ".ssh" || "$filename" == "backup" ]] && continue

    target="$HOME/$filename"

    backup_if_needed "$target"
    ln -sf "$file" "$target"
    echo "Linked $target → $file"
done

echo "Linking .config files..."

mkdir -p "$CONFIG_DIR"
for config in "$DOTFILES_DIR/.config"/*; do
    configname=$(basename "$config")
    target="$CONFIG_DIR/$configname"

    backup_if_needed "$target"
    ln -sf "$config" "$target"
    echo "Linked $target → $config"
done

echo "Linking .ssh files..."

if [ -d "$DOTFILES_DIR/.ssh" ]; then
    mkdir -p "$SSH_DIR"

    for sshfile in "$DOTFILES_DIR/.ssh/"*; do
        sshfilename=$(basename "$sshfile")
        target="$SSH_DIR/$sshfilename"

        backup_if_needed "$target"
        ln -sf "$sshfile" "$target"
        echo "Linked $target → $sshfile"
    done
fi

echo "Setting up custom systemd user services..."

SYSTEMD_USER_DIR="$HOME/.config/systemd/user"
mkdir -p "$SYSTEMD_USER_DIR"

for service in "$DOTFILES_DIR/services"/*.service; do
    [ -e "$service" ] || continue
    servname=$(basename "$service")
    target="$SYSTEMD_USER_DIR/$servname"

    backup_if_needed "$target"
    ln -sf "$service" "$target"
    echo "Linked systemd service $target → $service"

    # Ask if user wants to enable
    read -rp "Do you want to enable $servname? [y/N]: " yn
    if [[ "$yn" =~ ^[Yy]$ ]]; then
        systemctl --user enable "$servname"
        echo "Enabled $servname"
    else
        echo "Skipped enabling $servname"
    fi
done

echo "All dotfiles linked successfully."
echo "Any existing files were backed up to: $BACKUP_DIR"

