#!/bin/zsh

# Check if we're in a Git repository
if ! git rev-parse --is-inside-workdir >/dev/null 2>&1; then
  echo "Error: Not a Git repository."
  exit 1
fi

# Check if we're on the main branch
if [[ $(git branch --show-current) != "main" ]]; then
  # Store current branch (if not main)
  previous_branch=$(git branch --show-current)

  # Switch to the main branch
  git checkout main

  # Update the branch from the remote repo
  git pull
  echo "Switched to main branch and updated."

  # Check if a previous branch was stored and delete it locally
  if [[ -n "$previous_branch" ]]; then
    git branch -d "$previous_branch"
    echo "Deleted local branch: $previous_branch"
  fi

else
  echo "Already on the main branch. No need to switch or update."
fi
