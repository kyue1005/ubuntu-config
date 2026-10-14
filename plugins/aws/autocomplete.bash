# AWS completions
if type _aws_regions >/dev/null 2>&1; then
  complete -F _aws_regions asr
fi

if type _aws_profiles >/dev/null 2>&1; then
  complete -F _aws_profiles asp acp aws_change_access_key
fi

if command -v aws_completer >/dev/null 2>&1; then
  complete -C "$(command -v aws_completer)" aws
fi
