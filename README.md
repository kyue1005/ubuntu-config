# ubuntu-config

Modular configuration stack for Ubuntu (WSL2) with Bash, Oh-My-Posh, Homebrew, Mise, and Vim.

## Quickstart

Run the setup script to symlink dotfiles into `$HOME` and register the daily Brewfile backup cron job:

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

## Structure

* `.bashrc` - Main interactive shell entry point
* `.bash_aliases` - Aliases for `kubectl`, `git`, `terraform`, and `pulumi`
* `.bash_func` - AWS profile/region helpers (`asp`, `asr`, `acp`), Git cleanup (`gtidy`), and socat helper (`ksocat`)
* `.bash_autocomplete` - Fast cached shell completions for `pulumi`, `kubectl`, and `aws`
* `.mytheme.omp.json` - Oh-My-Posh prompt configuration
* `.vimrc` / `.vim` - Vim configuration and plugins
* `Brewfile` - Homebrew bundle manifest (auto-dumped daily via `update-brewfile.sh`)
