#!/usr/bin/env bash
set -euo pipefail

REMOVE_DATA=0
if [[ "${1:-}" == "--remove-data" ]]; then
  REMOVE_DATA=1
fi

DST_PLUGIN_DIR="${HOME}/Library/Application Support/obs-studio/plugins/obs-vdoninja/bin/64bit"
DST_DATA_DIR="${HOME}/Library/Application Support/obs-studio/plugins/obs-vdoninja/data"

echo "Uninstalling OBS VDO.Ninja plugin..."
echo "Plugin dir: $DST_PLUGIN_DIR"
echo "Data dir:   $DST_DATA_DIR"

if [[ -f "$DST_PLUGIN_DIR/obs-vdoninja.so" ]]; then
  rm -f "$DST_PLUGIN_DIR/obs-vdoninja.so"
  echo "Removed: $DST_PLUGIN_DIR/obs-vdoninja.so"
fi
if [[ -f "$DST_PLUGIN_DIR/libobs-vdoninja.so" ]]; then
  rm -f "$DST_PLUGIN_DIR/libobs-vdoninja.so"
  echo "Removed: $DST_PLUGIN_DIR/libobs-vdoninja.so"
fi

if [[ "$REMOVE_DATA" -eq 1 && -d "$DST_DATA_DIR" ]]; then
  rm -rf "$DST_DATA_DIR"
  echo "Removed data: $DST_DATA_DIR"
fi

echo
echo "Uninstall complete. Restart OBS Studio."
