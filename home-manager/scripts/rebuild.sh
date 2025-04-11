#!/usr/bin/env bash
set -e
pushd ~/nixos &>/dev/null

git add .

# Early return if no changes were detected (thanks @singiamtel!)
if git diff --quiet HEAD -- '*.nix'; then
    echo "No changes detected, exiting."
    popd &>/dev/null
    exit 0
fi

# Autoformat your nix files
alejandra . &>/dev/null \
  || ( alejandra . ; echo "formatting failed!" && exit 1)

git add .

# Shows your changes
git status

# Rebuild, output simplified errors, log trackebacks
sudo nixos-rebuild switch --flake ./ &>nixos-switch.log || (cat nixos-switch.log | grep --color error && exit 1)

# Get current generation metadata
current=$(nixos-rebuild list-generations | grep current)

# Commit all changes witih the generation metadata
git commit -m "$current"

popd &>/dev/null