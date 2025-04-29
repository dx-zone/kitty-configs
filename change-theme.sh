#!/bin/bash

# File containing the current theme configuration
CURRENT_THEME_CONF="$HOME/.config/kitty/current-theme.conf"

# Array of available themes
THEMES=(
  "cyberdream.conf"
  "cyberdream-transparent.conf"
  "oxocarbon.conf"
  "tokyonight_night.conf"
  "tokyonight_moon.conf"
  "tokyonight_storm.conf"
  "catppuccin-theme.conf"
  "monokai-inspired.conf"
  "monokai-inspired-vibrant.conf"
  "monokai-inspired-spectrum.conf"
)

# Path to the themes directory
THEME_DIR="$HOME/.config/kitty/themes"

# Function to get the current theme
get_current_theme() {
  # Extract the current theme from the configuration without using -P
  grep "^include" "$CURRENT_THEME_CONF" | sed 's|.*themes/||'
}

# Function to set the theme
set_theme() {
  THEME=$1
  echo "include $THEME_DIR/$THEME" > "$CURRENT_THEME_CONF"
  # Reload the configuration
  kitty @ load-config
}

# Get the current theme
CURRENT_THEME=$(get_current_theme)

# Find the index of the current theme in the array
CURRENT_INDEX=-1
for i in "${!THEMES[@]}"; do
  if [[ "${THEMES[$i]}" == "$CURRENT_THEME" ]]; then
    CURRENT_INDEX=$i
    break
  fi
done

# Compute the next theme (wrap around if necessary)
NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#THEMES[@]} ))
NEXT_THEME=${THEMES[$NEXT_INDEX]}

# Display the switch and set the new theme
echo "Switching theme: $CURRENT_THEME -> $NEXT_THEME"
set_theme "$NEXT_THEME"
