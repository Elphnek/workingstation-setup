#!/bin/bash

echo "=== Phase 2: Capturing Current Configuration ==="
OUTPUT_DIR="files/current_config"
mkdir -p "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR/sources.list.d"

# Capture installed packages
echo "Capturing installed packages..."
dpkg -l | grep "^ii" | awk '{print $2}' > "$OUTPUT_DIR/installed_packages.txt"

# Capture snap packages
echo "Capturing snap packages..."
snap list > "$OUTPUT_DIR/snap_packages.txt"

# Capture repository sources
echo "Capturing repository sources..."
if [ -d "/etc/apt/sources.list.d" ]; then
    cp /etc/apt/sources.list.d/*.list "$OUTPUT_DIR/sources.list.d/" 2>/dev/null || true
    cp /etc/apt/sources.list "$OUTPUT_DIR/sources.list" 2>/dev/null || true
fi

# Capture personal configurations
echo "Capturing personal configurations..."
cp ~/.bashrc "$OUTPUT_DIR/bashrc" 2>/dev/null || touch "$OUTPUT_DIR/bashrc"
[ -f ~/.gitconfig ] && cp ~/.gitconfig "$OUTPUT_DIR/gitconfig" || touch "$OUTPUT_DIR/gitconfig"

# Capture Guake configuration if exists
if [ -d ~/.gconf/apps/guake ]; then
    echo "Capturing Guake configuration..."
    mkdir -p "$OUTPUT_DIR/guake_conf"
    cp -r ~/.gconf/apps/guake/* "$OUTPUT_DIR/guake_conf/" 2>/dev/null || true
fi

# Capture GNOME settings
echo "Capturing GNOME settings..."
dconf dump / > "$OUTPUT_DIR/dconf-settings.ini"

# List all custom keybindings
echo "Capturing keyboard shortcuts..."
gsettings list-recursively org.gnome.settings-daemon.plugins.media-keys > "$OUTPUT_DIR/keyboard-shortcuts.txt"

echo "Configuration capture complete! Check $OUTPUT_DIR for captured configs."
ls -la "$OUTPUT_DIR"
