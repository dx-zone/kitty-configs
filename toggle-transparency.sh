#!/bin/bash

# Path to the Kitty configuration file
KITTY_CONFIG="$HOME/.config/kitty/kitty.conf"

# Dynamically locate Kitty's socket in ~/.config/kitty (handling random suffixes)
KITTY_SOCKET=$(find "$HOME/.config/kitty" -type s -name '.kitty_socket-*' | head -n 1)

# Check if the socket exists
if [[ -z "$KITTY_SOCKET" ]] || [[ ! -S "$KITTY_SOCKET" ]]; then
    echo "Error: Kitty's socket file not found. Make sure Kitty is running."
    exit 1
fi

# Check the current background_opacity value in the config
if grep -q "background_opacity 1.0" "$KITTY_CONFIG"; then
    # Switch to transparency (set to 0.9)
    sed -i '' 's/background_opacity 1.0/background_opacity 0.9/' "$KITTY_CONFIG"
    echo "Transparency enabled (background_opacity set to 0.9)."
else
    # Switch to opaque (set to 1.0)
    sed -i '' 's/background_opacity 0.9/background_opacity 1.0/' "$KITTY_CONFIG"
    echo "Transparency disabled (background_opacity set to 1.0)."
fi

# Reload Kitty's configuration using the dynamically identified socket
if ! kitty @ --to=unix:"$KITTY_SOCKET" load-config; then
    echo "Failed to reload Kitty. Please manually reload with Ctrl+Shift+F5."
    exit 1
fi

exit 0
