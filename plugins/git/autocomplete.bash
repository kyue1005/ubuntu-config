# Git completions (alias mapping for 'g')
if type __git_complete >/dev/null 2>&1; then
  __git_complete g __git_main 2>/dev/null
fi
