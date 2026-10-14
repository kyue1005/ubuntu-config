# Pulumi cached completion
COMP_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/bash-completions"
[ -d "$COMP_CACHE_DIR" ] || mkdir -p "$COMP_CACHE_DIR"

if command -v pulumi >/dev/null 2>&1; then
  PULUMI_BIN="$(command -v pulumi)"
  if [ ! -f "$COMP_CACHE_DIR/pulumi" ] || [ "$PULUMI_BIN" -nt "$COMP_CACHE_DIR/pulumi" ]; then
    pulumi gen-completion bash > "$COMP_CACHE_DIR/pulumi" 2>/dev/null
  fi
  source "$COMP_CACHE_DIR/pulumi"
fi
