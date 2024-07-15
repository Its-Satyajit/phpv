## PHPV: Effortless PHP Version Management for Arch Linux-based Systems

### Welcome to PHPV

Welcome to PHPV, your go-to tool for effortlessly managing PHP versions on Arch Linux-based distributions like Manjaro, EndeavourOS, Garuda Linux, and ArcoLinux. Whether you're a seasoned developer or just getting started, PHPV simplifies PHP version management with a touch of humor and reliability.

### Installation Guide

#### Step 1: Download PHPV

Get started by downloading PHPV directly from GitHub. Open your terminal and enter the following command:

```bash
curl -sSL https://raw.githubusercontent.com/Its-Satyajit/phpv/main/install.sh | bash
```

Watch as PHPV sets itself up—it’s like having your tech-savvy friend do the heavy lifting, with a sprinkle of charm.

#### Step 2: Follow Setup Instructions

PHPV guides you through setup effortlessly:

-   **Create Necessary Directories**: PHPV ensures everything has a place, setting up `$HOME/src` and `$HOME/bin`.
-   **Update Your PATH**: No more lost scripts! PHPV updates your PATH so it's always just a command away.

### How to Use PHPV

#### Installing or Updating PHP Versions

Need the latest PHP version or looking to update an existing one? PHPV makes it a breeze:

```bash
phpv -i <version>
```

Simply replace `<version>` with the PHP version number you need (e.g., 8.3, 8.4, or even 9.0).

#### Switching PHP Versions

Curious about PHP 7.4 or keen to explore PHP 8.1? PHPV lets you switch versions effortlessly:

```bash
phpv <version>
```

Choose your version, hit enter, and PHPV handles the rest—because your time is valuable, and coding should be seamless.

### Troubleshooting Made Simple

#### Dealing with PHP Compilation Issues

Encountering roadblocks while compiling PHP, particularly with c-client? PHPV offers a quick fix:

-   **Download Pre-built Binary**: Skip the compilation hassle with our pre-built binary from the PHPV repository:

    [c-client-2007f-20-x86_64.pkg.tar.zst](https://github.com/Its-Satyajit/phpv/blob/main/c-client/c-client-2007f-20-x86_64.pkg.tar.zst)

    It's like ordering takeout when your culinary adventures hit a snag.

-   **Verify Integrity**: Ensure your download's integrity with these checksums:

    -   **MD5**: 96d92a8b98afd78d2f2c80f8b0d76473
    -   **SHA1**: 4451582984bf02b1b78425b75100ca20018c8557
    -   **SHA256**: c6c9a0a411f476be1357f5aad8db897ce4d47f3f78757acd2aade3e477e2fe4d
    -   **SHA512**: 9628031b0f0efe4024c515f0a882418d7665b3267644f3bf0f12adbc5f200a9cca3049ab218be176ae8562673edca46190ca44de1154a32e0bf828028470ef1e

    Ensure peace of mind with a verification check on [VirusTotal](https://www.virustotal.com/gui/file/c6c9a0a411f476be1357f5aad8db897ce4d47f3f78757acd2aade3e477e2fe4d?nocache=1).

### Conclusion: Your PHP Companion

PHPV isn't just a tool—it’s your PHP version companion. With PHPV, managing PHP versions is as delightful as your favorite pizza delivery (minus the calories). Dive in, enjoy the simplicity, and let PHPV handle the PHP versions while you focus on crafting exceptional code.
