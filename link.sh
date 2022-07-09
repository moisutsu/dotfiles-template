#!/bin/bash -eu

DOT_DIRECTORY="$HOME/dotfiles"
DOTCONFIG_DIRECTORY="$HOME/.config"
BACKUP_DIRECTORY="$HOME/.backup/dotfiles"
DOTCONFIG_FILES=()

cd "$(dirname "$0")"

mkdir -p "$BACKUP_DIRECTORY"

for f in .??*
do
    [[ $f = ".git" ]] && continue
    [[ $f = ".gitignore" ]] && continue
    [[ $f = ".DS_Store" ]] && continue
    if [ -e "$HOME/$f" ] && [ ! -L "$HOME/$f" ]; then
        mv "$HOME/$f" "$BACKUP_DIRECTORY"
    fi
    ln -snfv "$DOT_DIRECTORY/$f" "$HOME/$f"
done

rmdir -p "$BACKUP_DIRECTORY" 2>/dev/null

mkdir -p "$DOTCONFIG_DIRECTORY"
for f in "${DOTCONFIG_FILES[@]}"
do
    ln -snfv "$DOT_DIRECTORY/$f" "$DOTCONFIG_DIRECTORY/$f"
done
