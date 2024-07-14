### `phpenv` Script Documentation

#### Overview

The `phpenv` script is designed to manage and switch between different PHP versions on your system. It can also install new PHP versions from the Arch User Repository (AUR) if needed. This document provides detailed instructions on using the script effectively.

#### Prerequisites

Before using the script, ensure that your system meets the following requirements:

-   **Operating System**: Manjaro Linux (or any Arch-based distribution)
-   **Required Tools**: `git`, `makepkg`, `pacman`
-   **Dependencies**: Various development and runtime libraries

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

3. **Install Required Dependencies**

    The script checks and installs the following dependencies if they are not already present on your system:

    - autoconf
    - automake
    - patchelf
    - apache
    - postgresql-libs
    - unixodbc
    - libfbclient
    - freetds
    - tidy
    - oniguruma
    - aspell
    - enchant
    - libvoikko
    - hspell
    - nuspell
    - aspell

4. **Update PATH Environment Variable**

    Ensure that `$HOME/bin` is included in your `PATH` by adding the following line to your `~/.bashrc`, `~/.zshrc`, or the relevant shell configuration file:

    ```bash
    export PATH="$HOME/bin:$PATH"
    ```

    After updating the configuration file, reload it with:

    ```bash
    source ~/.bashrc  # or source ~/.zshrc
    ```

#### Script Usage

The script can be used in two primary modes:

1. **Activate an Existing PHP Version**
2. **Install and Activate a New PHP Version**

##### Activate an Existing PHP Version

To activate an existing PHP version, use the following command:

```bash
phpenv [VERSION]
```

Example:

```bash
phpenv 81
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

This command will:

1. Check and install the required dependencies if they are not already present.
2. Clone the AUR repository for the specified PHP version.
3. Build and install the PHP version using `makepkg`.
4. Create symbolic links in `$HOME/bin` pointing to the new PHP version's binaries.

#### Detailed Script Walkthrough

1. **Script Initialization**

    The script starts by enabling debug mode if `DEBUG` is set and defines color variables for output formatting.

2. **Argument Parsing**

    The script parses the input arguments to determine if it needs to install a new PHP version (`-i` flag) or simply activate an existing one.

3. **Tool and Dependency Checks**

    The script verifies the presence of essential tools (`git` and `makepkg`) and installs required dependencies using `pacman`.

4. **Directory Setup**

    The script ensures that `$HOME/bin` and `$HOME/src` directories exist. If not, it creates them.

5. **Cloning and Building PHP**

    If the `-i` flag is used, the script clones the AUR repository for the specified PHP version, navigates into the directory, and builds the package using `makepkg -si`. Before starting the build process, the script prints a message indicating that the build is starting.

6. **Creating Symbolic Links**

    The script removes existing symbolic links in `$HOME/bin` for PHP binaries and creates new links pointing to the specified PHP version's binaries.

7. **Output and Verification**

    Finally, the script prints a success message and the PHP version to verify the activation.

#### Example Usage

**Activate PHP 8.1:**

```bash
phpenv 81
```

**Install and Activate PHP 8.3:**

```bash
phpenv -i 83
```

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

    When trying to install PHP 8.1, you may encounter an error related to the `c-client` package. This issue is due to an implicit declaration of the `safe_flock` function in GCC 13. To fix this, add `-Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types` to the `CFLAGS` in the `c-client` `PKGBUILD` file:

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

#### Conclusion

The `phpenv` script simplifies the process of managing multiple PHP versions on your system, allowing you to easily switch between them or install new versions as needed. Follow the instructions in this document to ensure proper usage and troubleshooting.
