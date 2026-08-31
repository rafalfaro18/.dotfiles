#!/usr/bin/env bash

# Capture tmux format variables passed as arguments
SESSION="$1"
WINDOW="$2"
TITLE="$3"
PANE_ID="$4"

# Trigger the notification and capture the user's action
ACTION=$(notify-send --action=default=Switch -u critical "tmux bell" "$SESSION / $WINDOW / $TITLE")

# If the notification was clicked, switch to the target pane
if [ "$ACTION" = "default" ]; then
    tmux switch-client -t "$PANE_ID"
    tmux select-pane -t "$PANE_ID"
fi
