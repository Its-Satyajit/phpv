## PHPV: Effortless PHP Version Management for Arch Linux-based Systems

### Welcome to PHPV

Welcome to PHPV, your trusty sidekick for effortlessly managing PHP versions on Arch Linux-based distributions like Manjaro, EndeavourOS, Garuda Linux, and ArcoLinux. Whether you're a seasoned code wizard or just dipping your toes into PHP, PHPV simplifies PHP version management with a dash of wit and reliability.

### Installation Guide

#### Step 1: Download PHPV

Kick off your PHPV journey by snagging it straight from GitHub. Open your terminal and cast this spell:

```bash
curl -sSL https://raw.githubusercontent.com/Its-Satyajit/phpv/main/install.sh | bash
```

Watch PHPV weave its magic—it’s like having a tech-savvy fairy godparent handle the heavy lifting for you.

#### Manual Installation

If you're the hands-on type, embrace your inner wizard and manually install PHPV with these enchanted steps:

1. **Clone the Repository**:

    ```bash
    git clone https://github.com/Its-Satyajit/phpv.git
    ```

2. **Enter the Realm**:

    ```bash
    cd phpv
    ```

3. **Enchant the Script**:

    ```bash
    chmod +x phpv
    ```

4. **Empower Your Bin**:

    ```bash
    mv phpv $HOME/bin/phpv
    ```

5. **Summon PATH Update**:
   Add this spell to your shell configuration file (`$HOME/.bashrc`, `$HOME/.bash_profile`, `$HOME/.zshrc`, or `$HOME/.profile`):

    ```bash
    export PATH="$HOME/bin:$PATH"
    ```

6. **Refresh Your Magic**:
    ```bash
    source "$HOME/.bashrc"  # or .bash_profile, .zshrc, .profile based on your shell
    ```

### How to Use PHPV

#### Installing or Updating PHP Versions

Need the latest PHP version or looking to update an existing one? PHPV makes it easier than summoning a phoenix:

```bash
phpv -i <version>
```

Replace `<version>` with the shorthand notation for the PHP version you desire:

-   **8.0**: `80`
-   **7.4**: `74`
-   **8.3**: `83`
-   And so forth.

#### Switching PHP Versions

Curious about PHP 7.4 or itching to explore PHP 8.3? PHPV lets you switch versions as effortlessly as a magic wand:

```bash
phpv <version>
```

Choose your version shorthand, wave your wand (or hit enter), and PHPV handles the rest—because your time is precious, and coding should be enchanting.

### Troubleshooting Made Simple

#### Dealing with PHP Compilation Issues

Facing hurdles while compiling PHP, especially with c-client? PHPV offers a quick fix:

-   **Download Pre-built Binary**: Skip the compilation maze with our pre-built binary from the PHPV treasury:

    [c-client-2007f-20-x86_64.pkg.tar.zst](https://github.com/Its-Satyajit/phpv/blob/main/c-client/c-client-2007f-20-x86_64.pkg.tar.zst)

    It’s like having a trusty phoenix feather for your PHP spells.

-   **Verify Integrity**: Ensure the purity of your download with these spell-binding checksums:

    -   **MD5**: 96d92a8b98afd78d2f2c80f8b0d76473
    -   **SHA1**: 4451582984bf02b1b78425b75100ca20018c8557
    -   **SHA256**: c6c9a0a411f476be1357f5aad8db897ce4d47f3f78757acd2aade3e477e2fe4d
    -   **SHA512**: 9628031b0f0efe4024c515f0a882418d7665b3267644f3bf0f12adbc5f200a9cca3049ab218be176ae8562673edca46190ca44de1154a32e0bf828028470ef1e

    Ensure peace of mind with a verification spell on [VirusTotal](https://www.virustotal.com/gui/file/c6c9a0a411f476be1357f5aad8db897ce4d47f3f78757acd2aade3e477e2fe4d?nocache=1).

### Conclusion: Your PHP Companion

PHPV isn't just a tool—it’s your PHP version companion. With PHPV, managing PHP versions is as enchanting as your favorite magical creature. Dive in, savor the simplicity, and let PHPV handle the PHP versions while you focus on conjuring exceptional code.
