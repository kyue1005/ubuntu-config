#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Symlink dotfiles to $HOME
for file in .bashrc .bash_aliases .bash_autocomplete .bash_func .mytheme.omp.json .vimrc; do
  if [ -f "$SCRIPT_DIR/$file" ]; then
    ln -sf "$SCRIPT_DIR/$file" "$HOME/$file"
  fi
done

if [ -d "$SCRIPT_DIR/.vim" ]; then
  ln -sfn "$SCRIPT_DIR/.vim" "$HOME/.vim"
fi

# Setup daily Brewfile backup cron job
CRON_JOB="0 0 * * * $SCRIPT_DIR/update-brewfile.sh >/dev/null 2>&1"
(crontab -l 2>/dev/null | grep -F "$SCRIPT_DIR/update-brewfile.sh") || \
(crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -

echo "Setup completed successfully."
