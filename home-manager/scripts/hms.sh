#!/usr/bin/env bash
# Default values
FLAG=""

# Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
  case $1 in
  -f | --force)
    FLAG="true"
    shift
    ;;         # Set FLAG to true if -f or --force is passed
  -h | --help) # Display help message
    echo "Usage: $0 [-f|--flag]"
    echo "Options:"
    echo "  -f, --force   Force the command even without changes"
    echo "  -h, --help    Show this help message."
    exit 0
    ;;
  *)
    echo "Unknown option: $1"
    echo "Use -h or --help for usage information."
    exit 1
    ;;
  esac
done

set -e
pushd ~/nixos &>/dev/null

# Stage all files so they can be checked
git add .

# Script logic
if [ "$FLAG" == "true" ]; then
  echo "Skipping checking for changes..."
else
  echo "Checking for changes..."
  # Early return if no changes were detected (thanks @singiamtel!)
  if git diff --quiet HEAD -- '*.nix'; then
    echo "No changes detected, exiting."
    popd &>/dev/null
    exit 0
  fi
fi

# Autoformat your nix files
alejandra . &>/dev/null ||
  (
    alejandra .
    echo "formatting failed!" && exit 1
  )

# Stage the formatted files
git add .

# Shows your changes
git status

# Rebuild, output simplified errors, log trackebacks
home-manager switch --flake ./ &>home-manager-switch.log || (cat home-manager-switch.log | grep --color error && exit 1)

# Get current generation metadata
current=$(home-manager generations | grep -c home-manager-generation)

# Commit all changes witih the generation metadata
git commit -m "Home-Manager-Generation: $current"

popd &>/dev/null
