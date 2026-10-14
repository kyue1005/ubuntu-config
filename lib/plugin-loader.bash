#!/usr/bin/env bash
# Oh-My-Zsh style plugin loader for Bash

load_plugins() {
  local plugins_dir="${1:-$HOME/ubuntu-config/plugins}"
  [ -d "$plugins_dir" ] || return 0

  for plugin in "${plugins[@]}"; do
    local pdir="$plugins_dir/$plugin"
    [ -d "$pdir" ] || continue

    # 1. Monolithic / OMZ-style plugin file: <plugin>.plugin.bash
    if [ -f "$pdir/$plugin.plugin.bash" ]; then
      . "$pdir/$plugin.plugin.bash"
    fi

    # 2. Functions (loaded first so aliases/completions can reference functions)
    local func_disabled="DISABLE_${plugin^^}_FUNC"
    if [ "${ENABLE_PLUGIN_FUNCS:-true}" = "true" ] && [ "${!func_disabled:-false}" != "true" ]; then
      if [ -f "$pdir/func.bash" ]; then
        . "$pdir/func.bash"
      elif [ -f "$pdir/functions.bash" ]; then
        . "$pdir/functions.bash"
      fi
    fi

    # 3. Aliases
    local alias_disabled="DISABLE_${plugin^^}_ALIAS"
    if [ "${ENABLE_PLUGIN_ALIASES:-true}" = "true" ] && [ "${!alias_disabled:-false}" != "true" ]; then
      if [ -f "$pdir/alias.bash" ]; then
        . "$pdir/alias.bash"
      elif [ -f "$pdir/aliases.bash" ]; then
        . "$pdir/aliases.bash"
      fi
    fi

    # 4. Autocomplete / Completions
    local comp_disabled="DISABLE_${plugin^^}_AUTOCOMPLETE"
    if [ "${ENABLE_PLUGIN_AUTOCOMPLETE:-true}" = "true" ] && [ "${!comp_disabled:-false}" != "true" ]; then
      if [ -f "$pdir/autocomplete.bash" ]; then
        . "$pdir/autocomplete.bash"
      elif [ -f "$pdir/completion.bash" ]; then
        . "$pdir/completion.bash"
      fi
    fi
  done
}
