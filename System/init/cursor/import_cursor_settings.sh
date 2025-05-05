#!/bin/bash

# Get the Cursor settings directory
CURSOR_SETTINGS_DIR="$HOME/Library/Application Support/Cursor/User"

# Create the Cursor settings directory if it doesn't exist
mkdir -p "$CURSOR_SETTINGS_DIR"

# Get the directory where this script is located
SCRIPT_DIR="$(dirname "$0")"

# Import settings.json
if [ -f "$SCRIPT_DIR/settings.json" ]; then
    cp "$SCRIPT_DIR/settings.json" "$CURSOR_SETTINGS_DIR/settings.json"
    echo "✓ Imported settings.json"
else
    echo "Warning: settings.json not found in source directory"
fi

# Import keybindings.json if it exists
if [ -f "$SCRIPT_DIR/keybindings.json" ]; then
    cp "$SCRIPT_DIR/keybindings.json" "$CURSOR_SETTINGS_DIR/keybindings.json"
    echo "✓ Imported keybindings.json"
fi

# Import snippets directory if it exists
if [ -d "$SCRIPT_DIR/snippets" ]; then
    cp -r "$SCRIPT_DIR/snippets" "$CURSOR_SETTINGS_DIR/"
    echo "✓ Imported snippets directory"
fi

echo "Cursor settings import completed!"
echo "Please restart Cursor for changes to take effect." 