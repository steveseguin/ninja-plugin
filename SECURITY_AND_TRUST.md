# Security and Trust Notes

## Release Verification

Every release includes `checksums.txt` with SHA-256 hashes for packaged artifacts.

## Binary Signing Status

- Windows: code signing not currently configured
- macOS: notarization/signing not currently configured
- Linux: unsigned tarball distribution

This means OS trust warnings may appear, especially on Windows/macOS.

## Recommended Verification Flow

1. Download artifact and `checksums.txt` from the same release tag.
2. Verify SHA-256 before install.
3. Use only official repository release URLs.

## Operational Security Guidance

- Keep OBS and plugin versions up to date.
- Use passwords for streams when practical.
- For controlled environments, set custom signaling and ICE servers.
- Treat remote-control style data-channel actions as sensitive; keep disabled unless explicitly trusted.

## Roadmap

- Add release signing/notarization pipeline.
- Add signed SBOM/provenance metadata if distribution requirements demand it.
