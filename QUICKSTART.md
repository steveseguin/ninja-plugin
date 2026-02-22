# OBS VDO.Ninja Plugin - Quick Start

This guide gets you from install to first working stream quickly.

## 1) Confirm plugin loaded in OBS

After installation, restart OBS and check:

- `Settings -> Stream` includes service: `VDO.Ninja`
- `Add Source` includes: `VDO.Ninja Source`

If either is missing, reinstall and confirm plugin/data paths from `INSTALL.md`.

## 2) Publish your first stream

1. Open `Settings -> Stream`
2. Service: `VDO.Ninja`
3. Set:
   - `Stream ID` (example: `mytest123`)
   - Optional `Password`
   - Optional `Room ID`
4. Click `Start Streaming`

Viewer link pattern:

- No password: `https://vdo.ninja/?view=mytest123`
- With password: `https://vdo.ninja/?view=mytest123&password=yourpass`

## 3) Ingest a VDO.Ninja stream in OBS

1. `Add Source -> VDO.Ninja Source`
2. Enter Stream ID (and optional room/password)
3. Confirm video/audio appears in preview/program

## 4) Recommended first validation pass

- Open two viewer tabs to verify multi-viewer behavior.
- Refresh a viewer page and confirm playback resumes.
- Try one run with password and one run without.
- If using rooms, test `room + scene + view` links for room workflows.

## 5) Useful advanced options

- `Salt` (default `vdo.ninja`) for compatibility/self-hosting needs
- Custom signaling WebSocket URL
- Custom STUN/TURN servers
- Force TURN for difficult NAT/network paths

## 6) Troubleshooting basics

- Restart OBS after install/update.
- Verify stream ID/password exactly match viewer URL.
- Check OBS logs and VDO.Ninja stats for packet loss/RTT.
- Use `INSTALL.md` for reinstall/uninstall paths.

Additional docs:

- `README.md`
- `TESTING_OBS_MANUAL.md`
- `SECURITY_AND_TRUST.md`
