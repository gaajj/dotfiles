#!/bin/bash

DIRS=(
  "$HOME"
  "$HOME/Documents"
  "$HOME/development"
)

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(
    { printf "%s\n" "${DIRS[@]}"; fd . "${DIRS[@]}" --type=dir --max-depth=1 --full-path; } \
    | fzf
  )
fi

[[ ! $selected ]] && exit 0

selected_name=$(basename "$selected" | tr . _)
if ! tmux has-session -t "$selected_name"; then
  tmux new-session -ds "$selected_name" -c "$selected"
  #tmux select-window -t "$selected_name:1"
fi

tmux switch-client -t "$selected_name"
