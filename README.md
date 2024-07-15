### Documentation

#### Overview

The `phpenv` script is designed to manage and switch between different PHP versions on your system. It can also install new PHP versions from the Arch User Repository (AUR) if needed. This document provides detailed instructions on using the script effectively.

##### Switch Php Versions

![](assets/20240715_020724_Switch.png)

##### Install Php Versions

![](assets/20240715_020736_Install.png)

#### Prerequisites

Before using the script, ensure that your system meets the following requirements:

-   **Operating System**: Manjaro Linux (or any Arch-based distribution)
-   **Required Tools**: `git`, `makepkg`, `pacman`

#### Installation

1. **Download and Save the Script**

    Save the script to a file named `phpenv` in a directory included in your `PATH`, such as `$HOME/bin`. Ensure the script is executable:

    ```bash
    chmod +x $HOME/bin/phpenv
    ```

2. **Ensure Necessary Tools are Installed**

    The script requires `git` and `makepkg` to function. These tools are usually pre-installed on Manjaro Linux. Verify their presence using:

    ```bash
    which git makepkg
    ```

3. **Update PATH Environment Variable**

    Ensure that `$HOME/bin` is included in your `PATH` by adding the following line to your `~/.bashrc`, `~/.zshrc`, or the relevant shell configuration file:

    ```bash
    export PATH="$HOME/bin:$PATH"
    ```

    After updating the configuration file, reload it with:

    ```bash
    source ~/.bashrc  # or source ~/.zshrc
    ```

#### Script Usage

The script can be used in four primary modes:

1. **Activate an Existing PHP Version**
2. **Install and Activate a New PHP Version**
3. **Verbose Output Mode**
4. **Dry Run Mode**
5. **Help Information**

##### Activate an Existing PHP Version

To activate an existing PHP version, use the following command:

```bash
phpenv [VERSION]
```

Example:

```bash
phpenv 83
```

This command will create symbolic links in `$HOME/bin` pointing to the specified PHP version's binaries.

##### Install and Activate a New PHP Version

To install and activate a new PHP version from the AUR, use the `-i` flag followed by the version number:

```bash
phpenv -i [VERSION]
```

Example:

```bash
phpenv -i 83
```

This command will install the specified PHP version and create symbolic links in `$HOME/bin` pointing to the new PHP version's binaries.

##### Verbose Output Mode

To enable verbose mode and get detailed logging of the script’s actions, use the `-v` flag:

```bash
phpenv -v [VERSION]
```

Example:

```bash
phpenv -v 83
```

This command will provide detailed output of the script’s operations while activating the specified PHP version.

##### Dry Run Mode

To perform a dry run and see what the script would do without making any changes, use the `--dry-run` flag:

```bash
phpenv --dry-run [VERSION]
```

Example:

```bash
phpenv --dry-run -i 83
```

This command will show the steps the script would take to install and activate the specified PHP version without actually performing any actions.

##### Help Information

To display usage information and exit, use the `-h` or `--help` flag:

```bash
phpenv -h
```

This command will display the usage information for the script.

#### Detailed Script Walkthrough

1. **Script Initialization**:

    - The script starts by enabling debug mode if `DEBUG` is set and defines color variables (`red`, `green`, `yellow`, `reset`) for terminal output formatting.

2. **Argument Parsing**:

    - It parses command-line arguments to determine whether to install a new PHP version (`-i` flag) or activate an existing one. It also handles options like verbose output (`-v`), dry-run (`--dry-run`), and help (`-h` or `--help`).

3. **Tool and Dependency Checks**:

    - The script checks if essential tools (`git` and `makepkg`) are installed using `command -v`. It displays an error and exits if any tool is missing.

4. **Directory Setup**:

    - It ensures that the `$HOME/bin` and `$HOME/src` directories exist. If not, it creates them using `mkdir -p`.

5. **Cloning and Building PHP**:

    - If the `-i` flag is set (`INSTALL=true`), the script clones the AUR repository for the specified PHP version, navigates into the directory, and builds the package using `makepkg -si`. Before starting the build process, it logs a message indicating the start of the build.

6. **Creating Symbolic Links**:

    - After installing PHP or if the `-i` flag was not used, the script removes existing symbolic links in `$HOME/bin` for PHP binaries and creates new links pointing to the specified PHP version's binaries.

7. **Output and Verification**:
    - Finally, the script prints a success message indicating that PHP $VERSION has been successfully activated. It verifies the activation by displaying the PHP version using `php -v`.

#### Troubleshooting

1. **Error: `git` is not installed**

    Ensure `git` is installed on your system:

    ```bash
    sudo pacman -S git
    ```

2. **Error: `makepkg` is not installed**

    Ensure `makepkg` is installed on your system. This tool is usually part of the `base-devel` package group:

    ```bash
    sudo pacman -S base-devel
    ```

3. **Error: Failed to install dependency**

    If the script fails to install a dependency, try installing it manually using `pacman`:

    ```bash
    sudo pacman -S [dependency-name]
    ```

4. **Error: Directory already exists**

    If a directory for the PHP version already exists, the script will attempt to remove it. Ensure you have the necessary permissions:

    ```bash
    rm -rf $HOME/src/php[VERSION]
    ```

5. **Error: `safe_flock` implicit declaration**

    When trying to install PHP 8.1, you may encounter an error related to the `c-client` package. This issue is due to an implicit declaration of the `safe_flock` function in GCC 13. To fix this, add `-Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types` to the `CFLAGS` in the `c-client` `PKGBUILD` file. For more details, refer to [this Arch Linux forum post](https://bbs.archlinux.org/viewtopic.php?id=295976):

    ```diff
    diff --git a/PKGBUILD b/PKGBUILD
    index 635a4ad..8cdddeb 100644
    --- a/PKGBUILD
    +++ b/PKGBUILD
    @@ -26,7 +26,7 @@ prepare() {

    build() {
      cd "$srcdir/$_pkgbase-src"
    -  CFLAGS+=" -ffat-lto-objects"
    +  CFLAGS+=" -ffat-lto-objects -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types"
      # NOTE: if you wish to enforce SSL, use SSLTYPE=unix.nopwd

      yes "y" | make -j1 lnp EXTRAAUTHENTICATORS=gss PASSWDTYPE=pam SPECIALAUTHENTICATORS=ssl SSLTYPE=unix EXTRACFLAGS="${CFLAGS} -fPIC -lgssapi_krb5 -lkrb5 -lk5crypto -lcom_err -lpam" EXTRALDFLAGS="${LDFLAGS}"
    ```

    After applying this change, rebuild the `c-client` package, and then proceed with the PHP 8.1 installation.

#### Additional Resources

This Project is inspired by Butler's [Install PHP on Arch/Manjaro](https://gist.github.com/michaelbutler/4a89bb23e2d30f1b0585b98d2b67cf55) guide, which inspired this project.

#### Uploading `c-client` PKGBUILD and Prebuilt Package

If you encounter difficulties installing `c-client`, you can download the `c-client` PKGBUILD and a prebuilt package (`c-client-2007f-20-x86_64.pkg.tar.zst`) from the following links:

-   [Download `c-client` PKGBUILD](https://github.com/Its-Satyajit/phpenv/blob/main/c-client/PKGBUILD)
    [VirusTotal](https://www.virustotal.com/gui/file/c6c9a0a411f476be1357f5aad8db897ce4d47f3f78757acd2aade3e477e2fe4d?nocache=1)
-   [Download Prebuilt `c-client` Package](https://github.com/Its-Satyajit/phpenv/blob/main/c-client/c-client-2007f-20-x86_64.pkg.tar.zst)
    [VirusTotal](https://www.virustotal.com/gui/file/37ad0feee95cfc36a81e66cf4ea223ea1d47a47293a63ca62b363e44dc45790d/detection)

Ensure to verify the integrity of the prebuilt package using VirusTotal or another trusted source before installation.

Here are the checksums for uploaded version of `c-client-2007f-20-x86_64.pkg.tar.zst`:

-   **MD5:** 96d92a8b98afd78d2f2c80f8b0d76473
-   **SHA1:** 4451582984bf02b1b78425b75100ca20018c8557
-   **SHA256:** c6c9a0a411f476be1357f5aad8db897ce4d47f3f78757acd2aade3e477e2fe4d
-   **SHA512:** 9628031b0f0efe4024c515f0a882418d7665b3267644f3bf0f12adbc5f200a9cca3049ab218be176ae8562673edca46190ca44de1154a32e0bf828028470ef1e

These checksums can be used to verify the integrity of the downloaded `c-client-2007f-20-x86_64.pkg.tar.zst` package .
