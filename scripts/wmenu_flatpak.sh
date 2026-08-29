#!/bin/sh

# Get a list of installed Flatpak app IDs
choice=$(flatpak list --app --columns=application | wmenu -f "JetBrainsMonoNL Nerd Font Mono 16" -i -p "Run Flatpak:")

# If you selected an app, run it
if [ -n "$choice" ]; then
    flatpak run "$choice"
fi
