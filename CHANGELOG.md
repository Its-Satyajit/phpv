# Changelog

## [1.3.0](https://github.com/Its-Satyajit/phpv/compare/phpv-v1.2.1...phpv-v1.3.0) (2026-02-17)


### Features

* **update:** Add self-update functionality to phpv ([20a6b24](https://github.com/Its-Satyajit/phpv/commit/20a6b24419fe14cf2ab5cb99d2b9edc71b1d6ada))

## [1.2.1](https://github.com/Its-Satyajit/phpv/compare/phpv-v1.2.0...phpv-v1.2.1) (2026-02-17)


### Bug Fixes

* **php:** Add comprehensive PHP version management script ([1c7d45d](https://github.com/Its-Satyajit/phpv/commit/1c7d45dff4a2b0f0818298714b94b41567144752))

## [1.2.0](https://github.com/Its-Satyajit/phpv/compare/phpv-v1.1.0...phpv-v1.2.0) (2026-02-17)


### Features

* **build:** Add build flexibility with --nocheck and --build flags ([5ed45ae](https://github.com/Its-Satyajit/phpv/commit/5ed45aeadf486ed219cd18bf5c03e48f3233d45c))
* **cli:** Enhance PHP version management with flexible installation ([3dc7e7e](https://github.com/Its-Satyajit/phpv/commit/3dc7e7e457fb41aab537a0ca93b2aff50ff9aa31))
* **phpv:** Add PHP extension installation and version display ([e0d93f2](https://github.com/Its-Satyajit/phpv/commit/e0d93f2d7178be95179cfa5a15f778cc7eba4376))
* update phpenv Added -u Option ([b88ded0](https://github.com/Its-Satyajit/phpv/commit/b88ded0fd207d08a264e0d6ffd4e3374ee1eda41))


### Bug Fixes

* fallback mechanism ([78fcc3d](https://github.com/Its-Satyajit/phpv/commit/78fcc3d73ca70704dc825f6a2ac90bdaafff719c))
* fallback mechanism ([0125da9](https://github.com/Its-Satyajit/phpv/commit/0125da9ceaf700f90898d7b80a05a2b66dfbd3c6))
* fallback mechanism   Merge pull request [#5](https://github.com/Its-Satyajit/phpv/issues/5) from UncleJ4ck/patch-1 ([78fcc3d](https://github.com/Its-Satyajit/phpv/commit/78fcc3d73ca70704dc825f6a2ac90bdaafff719c))
* Logic Flow ([466e07c](https://github.com/Its-Satyajit/phpv/commit/466e07cf7a8df506c1c8e222235a092ac5d82e16))

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
