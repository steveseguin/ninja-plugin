# OBS VDO.Ninja Plugin - Install / Update / Uninstall

This package currently uses script-assisted file-copy install (no GUI installer yet).
Every release archive includes `QUICKSTART.md` for first-run steps.

## Windows (`obs-vdoninja-windows-x64.zip`)

### Install or update

1. Extract the ZIP.
2. Open PowerShell in the extracted folder.
3. Run system-wide install (admin):

```powershell
.\install.ps1
```

Per-user install (no admin):

```powershell
.\install.ps1 -CurrentUser
```

Skip post-install quick-start popup:

```powershell
.\install.ps1 -NoQuickStartPopup
```

Portable OBS path:

```powershell
.\install.ps1 -ObsRoot "D:\OBS\obs-studio"
```

### Uninstall

```powershell
.\uninstall.ps1
```

Remove plugin + data:

```powershell
.\uninstall.ps1 -RemoveData
```

## Linux (`obs-vdoninja-linux-x86_64.tar.gz`)

### Install or update

```bash
chmod +x install.sh
sudo ./install.sh
```

### Uninstall

```bash
chmod +x uninstall.sh
sudo ./uninstall.sh
```

Remove plugin + data:

```bash
sudo ./uninstall.sh --remove-data
```

## macOS (`obs-vdoninja-macos-arm64.zip`)

### Install or update

```bash
chmod +x install.sh
./install.sh
```

### Uninstall

```bash
chmod +x uninstall.sh
./uninstall.sh
```

Remove plugin + data:

```bash
./uninstall.sh --remove-data
```

## Manual install fallback

If scripts are not usable:

- Copy plugin binaries from `obs-plugins/64bit` or `lib/obs-plugins` into your OBS plugin binary path.
- Copy `data/obs-plugins/obs-vdoninja` or `share/obs/obs-plugins/obs-vdoninja` into your OBS data path.

## Verify in OBS

After install/update, restart OBS and confirm:

- `Settings -> Stream` includes `VDO.Ninja`
- `Add Source` includes `VDO.Ninja Source`
