#!/usr/bin/env bash

# darkmodern.nvim — colorscheme showcase
# AI-generated code for colorscheme highlighting demonstration only.
# No functional guarantees. Not intended for production use.

set -euo pipefail

readonly GREETING="Hello, World!"
readonly MAX_COUNT=5

# --- Utility functions ---

log_info() {
    local msg="$1"
    echo "[INFO] ${msg}"
}

checksum() {
    local -a arr=("$@")
    local sum=0
    for val in "${arr[@]}"; do
        (( sum += val ))
    done
    echo "${sum}"
}

# --- Main logic ---

main() {
    local -a values=(10 20 30 40 50)
    local -A labels=(
        [alpha]=1.5
        [beta]=2.0
        [gamma]=0.75
    )

    log_info "Starting up..."

    local total
    total=$(checksum "${values[@]}")

    if (( total > 100 )); then
        echo "${GREETING}"
    else
        echo "sum = ${total}"
    fi

    for key in "${!labels[@]}"; do
        printf "  %-8s => %s\n" "${key}" "${labels[$key]}"
    done
}

main "$@"
