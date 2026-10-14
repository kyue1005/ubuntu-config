#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Ensure core APT packages are installed
CORE_APT_PACKAGES=(
  bind9-dnsutils
  build-essential
  ca-certificates
  curl
)

missing_packages=()
for pkg in "${CORE_APT_PACKAGES[@]}"; do
  if ! dpkg -s "$pkg" &>/dev/null; then
    missing_packages+=("$pkg")
  fi
done

if [ ${#missing_packages[@]} -gt 0 ]; then
  echo "Installing missing core APT packages: ${missing_packages[*]}..."
  sudo apt-get update -y
  sudo apt-get install -y "${missing_packages[@]}"
else
  echo "Core APT packages already installed."
fi

# Symlink dotfiles to $HOME
for file in .bashrc .mytheme.omp.json .vimrc; do
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
