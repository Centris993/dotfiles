#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
CONFIGS_DIR="${REPO_ROOT}/configs"

# Verify GNU Stow exists
if ! command -v stow >/dev/null 2>&1; then
    echo "GNU Stow is required."
    echo "Install it with:"
    echo "  sudo pacman -S stow"
    exit 1
fi

# Verify configs directory exists
if [[ ! -d "${CONFIGS_DIR}" ]]; then
    echo "Missing configs directory:"
    echo "  ${CONFIGS_DIR}"
    exit 1
fi

# Ensure required directories exist
mkdir -p "${HOME}/.config"
mkdir -p "${HOME}/.local/bin"

echo "--- Stowing Dotfiles ---"
echo "Configs Directory: ${CONFIGS_DIR}"
echo

cd "${CONFIGS_DIR}"

# Loop through every package
for dir in */; do

    # Skip if no directories exist
    [[ ! -d "${dir}" ]] && continue

    pkg="${dir%/}"

    echo "Processing package: ${pkg}"

    # Special package for home-directory dotfiles
    if [[ "${pkg}" == "home" ]]; then

        echo "Target: ${HOME}"

        stow -v -R -t "${HOME}" "${pkg}"

    else

        echo "Target: ${HOME}/.config"

        stow -v -R -t "${HOME}/.config" "${pkg}"

    fi

    echo
done

echo "--- Dotfiles Updated ---"