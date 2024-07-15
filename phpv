#!/bin/bash

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored messages
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

# Function to clone or update PHP version from AUR
clone_or_update_php() {
  local version="$1"
  local aur_repo="https://aur.archlinux.org/php${version}.git"
  local install_dir="$HOME/src/php${version}"

  # Create source directory if it doesn't exist
  if [ ! -d "$HOME/src" ]; then
    mkdir -p "$HOME/src" || {
      print_error "Could not create directory $HOME/src"
      exit 1
    }
  fi

  # Navigate to the source directory
  cd "$HOME/src" || {
    print_error "Could not change directory to $HOME/src"
    exit 1
  }

  # Check if directory exists and is not empty
  if [ -d "$install_dir" ] && [ -n "$(ls -A $install_dir)" ]; then
    print_info "Updating existing PHP version $version..."
    cd "$install_dir" || {
      print_error "Could not change directory to $install_dir"
      exit 1
    }
    # Attempt to pull changes from 'master' branch first
    if ! git pull origin master; then
      # If 'master' branch fails, try 'main' branch
      print_info "Trying 'main' branch..."
      if ! git pull origin main; then
        print_error "Failed to pull latest changes from $aur_repo"
        exit 1
      fi
    fi
  else
    print_info "Cloning PHP version $version from $aur_repo..."
    git clone "$aur_repo" "$install_dir" || {
      print_error "Failed to clone PHP version ${version} from AUR"
      exit 1
    }
    cd "$install_dir" || {
      print_error "Could not change directory to $install_dir"
      exit 1
    }
  fi
}

# Function to build and install PHP version using makepkg
build_and_install_php() {
  local version="$1"
  print_info "Building and installing PHP version $version..."
  print_info "This may take a while..."
  makepkg -si --noconfirm || {
    print_error "Failed to build or install PHP version $version"
    exit 1
  }
}

# Function to create symbolic links for PHP binaries
create_symlinks() {
  local version="$1"

  # List of binaries to link
  local binaries=(php php-cgi php-config phpize php-fpm phpdbg pear pecl)

  # Remove existing symbolic links
  for bin in "${binaries[@]}"; do
    rm -f "${HOME}/bin/${bin}"
  done

  # Create new symbolic links for the installed PHP version
  for bin in "${binaries[@]}"; do
    local bin_path
    bin_path=$(command -v "${bin}${version}")
    if [ -n "$bin_path" ]; then
      ln -s "$bin_path" "${HOME}/bin/${bin}" || {
        print_warning "Failed to create symbolic link for $bin"
      }
    else
      print_warning "Binary ${bin}${version} not found"
    fi
  done

  # Verify symbolic links creation
  if [ $? -eq 0 ]; then
    print_success "Switched to PHP version ${version}."
  else
    print_error "Failed to create symbolic links for PHP version ${version}."
    exit 1
  fi
}

# Function to switch PHP version
switch_php_version() {
  local version="$1"

  # Check if PHP binary exists for the specified version
  if ! command -v "php${version}" &>/dev/null; then
    print_error "PHP version ${version} is not installed."
    exit 1
  fi

  # Create symbolic links for the PHP version
  create_symlinks "$version"

  # Verify PHP version after switching
  print_info "Verifying PHP version:"
  php -v
}

# Main script logic

# Check if PHP version argument is provided
if [ $# -ne 1 ] && [ $# -ne 2 ]; then
  print_error "Invalid number of arguments."
  print_info "Usage for install/update: $0 -i <version>"
  print_info "Usage for switch: $0 <version>"
  exit 1
fi

if [ $# -eq 2 ] && [ "$1" == "-i" ]; then
  action="install_or_update"
  version="$2"
elif [ $# -eq 1 ]; then
  action="switch"
  version="$1"
else
  print_error "Invalid arguments."
  exit 1
fi

case "$action" in
install_or_update)
  clone_or_update_php "$version"
  build_and_install_php "$version"
  create_symlinks "$version"
  ;;
switch)
  switch_php_version "$version"
  ;;
*)
  print_error "Unknown action: $action"
  exit 1
  ;;
esac
