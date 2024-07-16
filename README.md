## PHPV: Effortless PHP Version Management for Arch Linux-based Systems

### Welcome to PHPV

Welcome to PHPV, your ultimate companion for mastering PHP versions on Arch Linux-based distributions like Manjaro, EndeavourOS, Garuda Linux, and ArcoLinux. Whether you're a seasoned developer or just getting started, PHPV simplifies PHP version management with a twist of programmer humor.

### Installation Guide

#### Step 1: Download PHPV

Begin your PHPV journey by downloading it directly from GitHub. Open your terminal and brace yourself for the unpredictable world of PHP version management:

```bash
curl -sSL https://raw.githubusercontent.com/Its-Satyajit/phpv/main/install.sh | bash
```

Watch PHPV weave its magic—it’s like navigating through a maze of code without a map.

#### Manual Installation

If you prefer hands-on adventures, follow these steps to manually install PHPV:

1. **Clone the Repository**:

    ```bash
    git clone https://github.com/Its-Satyajit/phpv.git
    ```

2. **Navigate to the Code Abyss**:

    ```bash
    cd phpv
    ```

3. **Give the Script Some Power**:

    ```bash
    chmod +x phpv
    ```

4. **Empower Your Binary Arsenal**:

    ```bash
    mv phpv $HOME/bin/phpv
    ```

5. **Channel Your Energy**:
   Add this to your shell configuration (`$HOME/.bashrc`, `$HOME/.bash_profile`, `$HOME/.zshrc`, or `$HOME/.profile`):

    ```bash
    export PATH="$HOME/bin:$PATH"
    ```

6. **Reload Your Terminal Aura**:
    ```bash
    source "$HOME/.bashrc"  # or .bash_profile, .zshrc, .profile, depending on your shell
    ```

### How to Use PHPV

#### Installing or Updating PHP Versions

Need the latest PHP version or just eager to watch the world burn with updates? PHPV’s got your back:

```bash
phpv -i <version>
```

Replace `<version>` with your desired PHP version shorthand:

-   **8.0**: `80`
-   **7.4**: `74`
-   **8.3**: `83`
-   And beyond—like handling bugs in production.

#### Switching PHP Versions

Tired of PHP 7.4’s quirks or curious about the chaos PHP 8.3 brings? PHPV switches versions faster than an asynchronous callback:

```bash
phpv <version>
```

Choose your version shorthand, brace yourself (or just hit enter), and PHPV handles the rest—because debugging should be as thrilling as merging conflicts on a Friday afternoon.

### Troubleshooting Made Simple

#### Confronting PHP Compilation Demons

Struggling with PHP compilation issues, especially those elusive c-client ones? PHPV offers a comedic solution:

-   **Pre-built Binary Summoning**: Skip the compilation labyrinth with our pre-built binary, straight from the PHPV vault:

    [c-client-2007f-20-x86_64.pkg.tar.zst](https://github.com/Its-Satyajit/phpv/blob/main/c-client/c-client-2007f-20-x86_64.pkg.tar.zst)

    It’s like using advanced wizardry—just without the arcane sacrifices.

-   **Verification Charm**: Ensure your download’s integrity with these incantations:

    -   **MD5**: 96d92a8b98afd78d2f2c80f8b0d76473
    -   **SHA1**: 4451582984bf02b1b78425b75100ca20018c8557
    -   **SHA256**: c6c9a0a411f476be1357f5aad8db897ce4d47f3f78757acd2aade3e477e2fe4d
    -   **SHA512**: 9628031b0f0efe4024c515f0a882418d7665b3267644f3bf0f12adbc5f200a9cca3049ab218be176ae8562673edca46190ca44de1154a32e0bf828028470ef1e

    Ensure peace of mind by verifying on [VirusTotal](https://www.virustotal.com/gui/file/c6c9a0a411f476be1357f5aad8db897ce4d47f3f78757acd2aade3e477e2fe4d?nocache=1).

### Conclusion: Your PHP Companion

PHPV isn't just a tool—it’s your sidekick through the journey of PHP version management. Embrace the humor, navigate the challenges, and let PHPV handle the PHP versions while you explore the unpredictable world of coding.
