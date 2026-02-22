#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PKG_ROOT="$SCRIPT_DIR"
if [[ ! -d "$PKG_ROOT/lib/obs-plugins" && ! -d "$PKG_ROOT/obs-plugins/64bit" ]]; then
  if [[ -d "$(dirname "$SCRIPT_DIR")/lib/obs-plugins" || -d "$(dirname "$SCRIPT_DIR")/obs-plugins/64bit" ]]; then
    PKG_ROOT="$(dirname "$SCRIPT_DIR")"
  fi
fi

SRC_PLUGIN_DIR=""
if [[ -d "$PKG_ROOT/lib/obs-plugins" ]]; then
  SRC_PLUGIN_DIR="$PKG_ROOT/lib/obs-plugins"
elif [[ -d "$PKG_ROOT/obs-plugins/64bit" ]]; then
  SRC_PLUGIN_DIR="$PKG_ROOT/obs-plugins/64bit"
else
  echo "Could not find plugin binaries in package."
  exit 1
fi

SRC_DATA_DIR=""
if [[ -d "$PKG_ROOT/share/obs/obs-plugins/obs-vdoninja" ]]; then
  SRC_DATA_DIR="$PKG_ROOT/share/obs/obs-plugins/obs-vdoninja"
elif [[ -d "$PKG_ROOT/data/obs-plugins/obs-vdoninja" ]]; then
  SRC_DATA_DIR="$PKG_ROOT/data/obs-plugins/obs-vdoninja"
else
  echo "Could not find plugin data directory in package."
  exit 1
fi

DST_PLUGIN_DIR="${HOME}/Library/Application Support/obs-studio/plugins/obs-vdoninja/bin/64bit"
DST_DATA_DIR="${HOME}/Library/Application Support/obs-studio/plugins/obs-vdoninja/data"

echo "Installing OBS VDO.Ninja plugin from package..."
echo "Source:      $PKG_ROOT"
echo "Plugin dst:  $DST_PLUGIN_DIR"
echo "Data dst:    $DST_DATA_DIR"

mkdir -p "$DST_PLUGIN_DIR" "$DST_DATA_DIR"
cp -a "$SRC_PLUGIN_DIR"/. "$DST_PLUGIN_DIR"/
cp -a "$SRC_DATA_DIR"/. "$DST_DATA_DIR"/

QUICKSTART_PATH="$PKG_ROOT/QUICKSTART.md"
echo
echo "Install complete."
echo
echo "Next steps:"
echo "1. Restart OBS Studio"
echo "2. Open Settings -> Stream and select VDO.Ninja"
echo "3. Set Stream ID (and optional password/room)"
echo "4. Start streaming and open your view URL"
if [[ -f "$QUICKSTART_PATH" ]]; then
  echo
  echo "Quick guide: $QUICKSTART_PATH"
  if [[ -t 0 && -t 1 ]]; then
    read -r -p "Open QUICKSTART.md now? [Y/n] " RESP
    if [[ ! "$RESP" =~ ^[Nn]$ ]]; then
      open "$QUICKSTART_PATH" >/dev/null 2>&1 || true
    fi
  fi
fi
