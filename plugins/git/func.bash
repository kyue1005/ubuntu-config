function gtidy() {
  # 1. Prune remote tracking branches and deleted tags in a single network call
  git fetch --prune --prune-tags origin || return 1

  # 2. Find and delete local branches whose upstream tracking branch is gone
  local gone_branches
  gone_branches=$(git branch -vv | awk '/: gone]/ {print $1}')

  if [ -n "$gone_branches" ]; then
    echo "$gone_branches" | xargs git branch -D
  else
    echo "No stale branches to clean up."
  fi
}
