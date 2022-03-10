#!/bin/sh
set -e

SCRIPT_ROOT=`dirname $0`

cp "$HOME/Library/Application Support/Code/User/keybindings.json" "${SCRIPT_ROOT}/"
cp "$HOME/Library/Application Support/Code/User/settings.json" "${SCRIPT_ROOT}/"

