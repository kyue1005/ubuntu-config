# Kubectl cached completion
COMP_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/bash-completions"
[ -d "$COMP_CACHE_DIR" ] || mkdir -p "$COMP_CACHE_DIR"

if command -v kubectl >/dev/null 2>&1; then
  KUBECTL_BIN="$(command -v kubectl)"
  if [ ! -f "$COMP_CACHE_DIR/kubectl" ] || [ "$KUBECTL_BIN" -nt "$COMP_CACHE_DIR/kubectl" ]; then
    kubectl completion bash > "$COMP_CACHE_DIR/kubectl" 2>/dev/null
  fi
  source "$COMP_CACHE_DIR/kubectl"
  # Also hook completion for 'k' alias if alias exists
  complete -o default -F __start_kubectl k 2>/dev/null
fi
