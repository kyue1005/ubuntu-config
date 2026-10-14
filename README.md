# ubuntu-config

Modular configuration stack for Ubuntu (WSL2) with Bash, Oh-My-Posh, Homebrew, Mise, and Vim.

## Quickstart

Run the setup script to install core APT prerequisites (like `build-essential`), symlink dotfiles into `$HOME`, and register the daily Brewfile backup cron job:

```bash
./setup.sh
```

## Restore Packages & Runtimes

1. **Homebrew packages:**
   ```bash
   brew bundle --file=./Brewfile
   ```

2. **Language runtimes (via mise):**
   ```bash
   mise install
   ```

## Oh-My-Zsh Style Plugins for Bash

Plugins are organized under `plugins/<plugin-name>/` and can optionally provide:
* `alias.bash` (or `aliases.bash`): tool aliases
* `func.bash` (or `functions.bash`): helper functions
* `autocomplete.bash` (or `completion.bash`): shell completions

### Configuration (`.bashrc` or `~/.bash_custom`)

```bash
# Select which plugins to load:
plugins=(
  aws
  git
  kubectl
  pulumi
  terraform
)

# Global feature toggles (defaults to true)
ENABLE_PLUGIN_ALIASES=true
ENABLE_PLUGIN_FUNCS=true
ENABLE_PLUGIN_AUTOCOMPLETE=true

# Per-plugin overrides (optional):
# DISABLE_KUBECTL_ALIAS=true
# DISABLE_AWS_FUNC=true
```

## Directory Structure

* `.bashrc` - Main interactive shell entry point
* `lib/plugin-loader.bash` - Plugin discovery and loading engine
* `plugins/`
  * `aws/` - Profile/region switching (`asp`, `asr`, `acp`), MFA handling, `aws_completer`
  * `git/` - Aliases (`g`, `ga`, `gst`, `gco`, ...), `gtidy` function, completion
  * `kubectl/` - Aliases (`k`, `kgp`, `kl`, ...), `ksocat` helper, cached completion
  * `pulumi/` - Aliases (`pul`, `pulp`, `pulu`, ...), cached completion
  * `terraform/` - Aliases (`tf`, `tfa`, `tivp`, ...), completion
* `.mytheme.omp.json` - Oh-My-Posh prompt configuration
* `.vimrc` / `.vim` - Vim configuration and plugins
* `Brewfile` - Homebrew bundle manifest (auto-dumped daily via `update-brewfile.sh`)
