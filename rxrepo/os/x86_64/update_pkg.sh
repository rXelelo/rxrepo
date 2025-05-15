#!/bin/bash

# Script to check if a package in AUR has a newer version than locally installed
# and update it if necessary

# Function to compare version strings
# Returns 0 if version1 is newer than version2, 1 otherwise
compare_versions() {
    local version1=$1
    local version2=$2

    # Remove any potential release info (like -1, -2, etc.)
    v1=$(echo "$version1" | sed 's/-[0-9]\+$//')
    v2=$(echo "$version2" | sed 's/-[0-9]\+$//')

    if [ "$(vercmp "$v1" "$v2")" -gt 0 ]; then
        return 0
    else
        return 1
    fi
}

# Check if package name is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <package_name>"
    exit 1
fi

PACKAGE_NAME="$1"

# Check if the package is installed locally
if ! pacman -Q "$PACKAGE_NAME" &>/dev/null; then
    echo "Package $PACKAGE_NAME is not installed locally"
    exit 1
fi

# Get local version
LOCAL_VERSION=$(pacman -Q "$PACKAGE_NAME" | awk '{print $2}')
echo "Local version of $PACKAGE_NAME: $LOCAL_VERSION"

# Get AUR info using curl and parse with grep/sed
AUR_INFO=$(curl -s "https://aur.archlinux.org/rpc/?v=5&type=info&arg=$PACKAGE_NAME")

# Check if package exists in AUR
if echo "$AUR_INFO" | grep -q "\"resultcount\":0"; then
    echo "Package $PACKAGE_NAME not found in AUR"
    exit 1
fi

# Extract AUR version
AUR_VERSION=$(echo "$AUR_INFO" | grep -o '"Version":"[^"]*"' | sed 's/"Version":"//;s/"//')

if [ -z "$AUR_VERSION" ]; then
    echo "Failed to get AUR version information"
    exit 1
fi

echo "AUR version of $PACKAGE_NAME: $AUR_VERSION"

# Compare versions
if compare_versions "$AUR_VERSION" "$LOCAL_VERSION"; then
    echo "New version available in AUR. Updating $PACKAGE_NAME..."

    # Create temporary directory
    TMP_DIR=$(mktemp -d)
    cd "$TMP_DIR" || exit 1

    # Clone AUR repository
    git clone "https://aur.archlinux.org/$PACKAGE_NAME.git"
    cd "$PACKAGE_NAME" || exit 1

    # Build and install package
    makepkg -si --noconfirm

    # Clean up
    cd "$HOME" || exit 1
    rm -rf "$TMP_DIR"

    echo "$PACKAGE_NAME has been updated to version $AUR_VERSION"
else
    echo "Local version is up to date"
fi

exit 0
