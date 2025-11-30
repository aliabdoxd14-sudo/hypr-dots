# Minimal fish config for the Blue Hyperland prompt
# This file is intended to be copied to ~/.config/fish/config.fish

set -x LANG en_US.UTF-8

# Friendly greeting (Arabic)
function fish_greeting
    echo "مرحبا — شل أزرق لHyperland — تم ضبطه بواسطة quickshell"
end

# Helpful aliases
alias ll='ls -lah'
alias la='ls -A'

# If the prompt functions are present in functions/, fish will auto-load them.
# Nothing else required — the prompt functions live in ~/.config/fish/functions
