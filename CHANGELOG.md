# Changelog

## [1.1.0] - 2026-02-17

### Added
- **Extension Support (`-e`)**: Easily install PHP extensions (e.g., `phpv -e imagick 81`) from the AUR.
- **Smart Install**: Prioritizes prebuilt binaries from configured repositories (like Chaotic-AUR) to speed up installation, falling back to AUR compilation if not found.
- **Automated Dependencies**: Automatically handles the missing `c-client` dependency by downloading a prebuilt binary from the repository.
- **Force Build (`--build`)**: Added flag to force compilation from source, bypassing binary checks.
- **Version Flag (`-v`)**: Added `--version` / `-v` to check current installed version.

### Changed
- Refactored argument parsing logic.
- Improved help & usage instructions.
