#!/usr/bin/env bash

SNIPPETS="$HOME/.config/nvim/lua/leaf/plugins/snippets"
DEST="$HOME/.local/share/nvim/lazy/friendly-snippets/snippets/"

rm -rf "$DEST/snippets"

cp -r "$SNIPPETS"/* "$DEST"/
