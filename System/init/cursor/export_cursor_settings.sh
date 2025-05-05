#!/bin/bash

# Create the directory if it doesn't exist
mkdir -p "$(dirname "$0")"

# Get the Cursor settings directory
CURSOR_SETTINGS_DIR="$HOME/Library/Application Support/Cursor/User"

# Check if the Cursor settings directory exists
if [ ! -d "$CURSOR_SETTINGS_DIR" ]; then
    echo "Error: Cursor settings directory not found at $CURSOR_SETTINGS_DIR"
    exit 1
fi

# Copy settings.json
if [ -f "$CURSOR_SETTINGS_DIR/settings.json" ]; then
    cp "$CURSOR_SETTINGS_DIR/settings.json" "$(dirname "$0")/settings.json"
    echo "✓ Exported settings.json"
else
    echo "Warning: settings.json not found in Cursor settings directory"
fi

# Copy keybindings.json if it exists
if [ -f "$CURSOR_SETTINGS_DIR/keybindings.json" ]; then
    cp "$CURSOR_SETTINGS_DIR/keybindings.json" "$(dirname "$0")/keybindings.json"
    echo "✓ Exported keybindings.json"
fi

# Copy snippets directory if it exists
if [ -d "$CURSOR_SETTINGS_DIR/snippets" ]; then
    cp -r "$CURSOR_SETTINGS_DIR/snippets" "$(dirname "$0")/"
    echo "✓ Exported snippets directory"
fi

echo "Cursor settings export completed!" 