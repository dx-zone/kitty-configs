#!/bin/bash

# Use $HOME to dynamically reference the current user's home directory
kitty_config_dir="$HOME/.config/kitty"

echo "Select a profile:"
echo "   (1) Coding"
echo "   (2) Screencasting"
read -r profile

if [ "$profile" -eq 1 ]; then
    rm "$kitty_config_dir/kitty.conf"
    cp "$kitty_config_dir/kitty-coding.conf" "$kitty_config_dir/kitty.conf"
    echo "Get in the flow!"
elif [ "$profile" -eq 2 ]; then
    rm "$kitty_config_dir/kitty.conf"
    cp "$kitty_config_dir/kitty-screencasting.conf" "$kitty_config_dir/kitty.conf"
    echo "Have fun recording!"
else
    echo "What the hell?"
fi
