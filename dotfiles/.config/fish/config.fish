# ~/.config/fish/config.fish

# Disable welcome message
set -g fish_greeting ""

# Set default editor
set -x EDITOR nvim

# Add local bin directories to PATH
set -x PATH $HOME/bin $HOME/.local/bin $PATH

# Simple aliases
alias ll="ls -lah"
alias gs="git status"

# Simple prompt
function fish_prompt
    echo -n (pwd) "> "
end
