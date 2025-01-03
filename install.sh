#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_error() {
    echo -e "${RED}Error: $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}Warning: $1${NC}"
}

print_success() {
    echo -e "${GREEN}$1${NC}"
}

print_info() {
    echo -e "${BLUE}$1${NC}"
}

install_phpv() {
    print_info "Crafting directories like a master builder..."
    mkdir -p "$HOME/src"
    mkdir -p "$HOME/bin"

    if [ -f "phpv" ]; then
        print_info "Found a local copy of phpv, because we believe in magic!"
    else
        print_info "Summoning phpv script from the mystical GitHub realms..."
        if ! curl -fsSL -o phpv https://raw.githubusercontent.com/Its-Satyajit/phpv/main/phpv; then
            print_error "Oh no! Failed to download phpv script from GitHub. The dragons must be restless."
            exit 1
        fi
    fi

    print_info "Enchanting the main script into $HOME/bin/phpv..."
    cp phpv "$HOME/bin/phpv"
    chmod +x "$HOME/bin/phpv"

    print_info "Updating the enchanted PATH environment..."

    update_shell_config() {
        local config_file="$1"
        local shell_name="$2"
        if [ -f "$config_file" ]; then
            if ! grep -q 'export PATH="$HOME/bin:$PATH"' "$config_file"; then
                echo 'export PATH="$HOME/bin:$PATH"' >>"$config_file"
                print_success "Added a sprinkle of magic to your $shell_name with PATH update."
            else
                print_warning "PATH was already enchanted in $shell_name, no extra magic needed."
            fi
        else
            print_warning "$config_file not found. Checking for the next shell configuration file."
        fi
    }

    update_shell_config "$HOME/.bash_profile" "bash profile"
    update_shell_config "$HOME/.bashrc" "bash"
    update_shell_config "$HOME/.zshrc" "zsh"
    update_shell_config "$HOME/.profile" "profile"

    print_info "Casting spells to refresh your magical settings..."
    source "$HOME/.bash_profile" 2>/dev/null || \
    source "$HOME/.bashrc" 2>/dev/null || \
    source "$HOME/.zshrc" 2>/dev/null || \
    source "$HOME/.profile" 2>/dev/null || true

    if command -v phpv >/dev/null; then
        print_success "Installation complete! Your PHPV wand is now ready to wield."
    else
        print_error "Oops! The installation ritual failed. Time to consult the ancient scrolls of PATH configuration."
    fi

    print_info "To summon the powers of PHPV:"
    print_info "For installation or update: phpv -i <version>"
    print_info "For switching PHP versions: phpv <version>"
}

install_phpv
