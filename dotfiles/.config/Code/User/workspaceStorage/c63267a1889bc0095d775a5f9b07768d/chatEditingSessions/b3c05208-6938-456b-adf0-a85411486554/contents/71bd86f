#!/usr/bin/env fish
# Simple installer for the generated theme
# Usage: ./apply-theme.fish [path/to/theme.json]

function __usage
    echo "Usage: apply-theme.fish [path/to/theme.json]"
    exit 1
end

set theme_src
if test (count $argv) -ge 1
    set theme_src $argv[1]
else
    set theme_src (pwd)/themes/illogical-impulse-inspired.json
end

if not test -f $theme_src
    echo "Theme not found: $theme_src"
    __usage
end

mkdir -p ~/.config/quickshell
cp $theme_src ~/.config/quickshell/theme.json
chmod 644 ~/.config/quickshell/theme.json
echo "Installed theme to ~/.config/quickshell/theme.json"
echo "To enable: add the sample prompt snippet from README.md to your ~/.config/fish/config.fish or restart quickshell if it reads ~/.config/quickshell/theme.json automatically."
