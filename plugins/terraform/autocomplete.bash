# Terraform completions
if command -v terraform >/dev/null 2>&1; then
  complete -C "$(command -v terraform)" terraform tf 2>/dev/null
fi
