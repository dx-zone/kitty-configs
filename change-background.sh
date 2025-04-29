#!/bin/bash

# Directory containing background images
BACKGROUND_DIR="$HOME/.config/kitty/backgrounds"

# Kitty configuration file
KITTY_CONFIG="$HOME/.config/kitty/kitty.conf"

# File to track the last used background
LAST_USED_FILE="$HOME/.config/kitty/last_background.txt"

# List all PNG files in the backgrounds directory
IMAGES=("$BACKGROUND_DIR"/*.png)

# Check if the directory contains any PNG files
if [[ ${#IMAGES[@]} -eq 0 ]]; then
  echo "No PNG files found in $BACKGROUND_DIR"
  exit 1
fi

# Determine the next background in the cycle
current_index=0
if [[ -f "$LAST_USED_FILE" ]]; then
  last_background=$(cat "$LAST_USED_FILE")

  # Find the index of the last used background
  for i in "${!IMAGES[@]}"; do
    if [[ "${IMAGES[$i]}" == "$last_background" ]]; then
      current_index=$(( (i + 1) % ${#IMAGES[@]} ))
      break
    fi
  done
fi

new_background="${IMAGES[$current_index]}"

# Update the Kitty configuration file with the new background
sed -i.bak "s|^background_image .*|background_image ${new_background}|g" "$KITTY_CONFIG"

# Save the new background as the last used
echo "$new_background" > "$LAST_USED_FILE"

# Reload Kitty's configuration
KITTY_SOCKET=$(find "$HOME/.config/kitty" -type s -name '.kitty_socket-*' | head -n 1)

if [[ -n "$KITTY_SOCKET" && -S "$KITTY_SOCKET" ]]; then
    kitty @ --to=unix:"$KITTY_SOCKET" load-config
    echo "Background has been updated to: $(basename "$new_background")"
else
    echo "Kitty socket not found. Please manually reload the configuration or restart Kitty."
fi
