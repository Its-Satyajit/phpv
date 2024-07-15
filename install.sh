#!/bin/bash

# Function to print colored messages
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

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

# Install PHPV script and update PATH
install_phpv() {
    # Create required directories if they don't exist
    print_info "Creating required directories..."
    mkdir -p "$HOME/src"
    mkdir -p "$HOME/bin"

    # Check if phpv script exists locally, otherwise download from GitHub
    if [ -f "phpv" ]; then
        print_info "Using local phpv script..."
    else
        print_info "Downloading phpv script from GitHub..."
        if ! curl -fsSL -o phpv https://raw.githubusercontent.com/Its-Satyajit/phpv/main/phpv; then
            print_error "Failed to download phpv script from GitHub."
            exit 1
        fi
    fi

    # Install main script
    print_info "Installing main script..."
    cp phpv "$HOME/bin/phpv"
    chmod +x "$HOME/bin/phpv"

    # Update PATH environment variable
    print_info "Updating PATH environment variable..."

    # Check if .bashrc exists and update PATH
    if [ -f "$HOME/.bashrc" ]; then
        if ! grep -q 'export PATH="$HOME/bin:$PATH"' "$HOME/.bashrc"; then
            echo 'export PATH="$HOME/bin:$PATH"' >>"$HOME/.bashrc"
            print_success "Updated PATH in $HOME/.bashrc"
        else
            print_warning "PATH is already configured in $HOME/.bashrc"
        fi
    else
        print_error "Could not find $HOME/.bashrc"
    fi

    # Check if .bash_profile exists and update PATH
    if [ -f "$HOME/.bash_profile" ]; then
        if ! grep -q 'export PATH="$HOME/bin:$PATH"' "$HOME/.bash_profile"; then
            echo 'export PATH="$HOME/bin:$PATH"' >>"$HOME/.bash_profile"
            print_success "Updated PATH in $HOME/.bash_profile"
        else
            print_warning "PATH is already configured in $HOME/.bash_profile"
        fi
    else
        print_error "Could not find $HOME/.bash_profile"
    fi

    # Check if .zshrc exists and update PATH
    if [ -f "$HOME/.zshrc" ]; then
        if ! grep -q 'export PATH="$HOME/bin:$PATH"' "$HOME/.zshrc"; then
            echo 'export PATH="$HOME/bin:$PATH"' >>"$HOME/.zshrc"
            print_success "Updated PATH in $HOME/.zshrc"
        else
            print_warning "PATH is already configured in $HOME/.zshrc"
        fi
    else
        print_error "Could not find $HOME/.zshrc"
    fi

    # Check if .profile exists and update PATH
    if [ -f "$HOME/.profile" ]; then
        if ! grep -q 'export PATH="$HOME/bin:$PATH"' "$HOME/.profile"; then
            echo 'export PATH="$HOME/bin:$PATH"' >>"$HOME/.profile"
            print_success "Updated PATH in $HOME/.profile"
        else
            print_warning "PATH is already configured in $HOME/.profile"
        fi
    else
        print_warning "Could not find $HOME/.profile"
    fi

    # Reload shell configuration
    source "$HOME/.bashrc" 2>/dev/null || source "$HOME/.bash_profile" 2>/dev/null || source "$HOME/.zshrc" 2>/dev/null || true

    # Final check
    if command -v phpv >/dev/null; then
        print_success "Installation completed successfully!"
    else
        print_error "Installation failed. Check PATH configuration."
    fi

    # Print main functions from phpv script
    print_info "Usage for install/update: phpv -i <version>"
    print_info "Usage for switch: phpv <version>"
}

# Execute installation
install_phpv
