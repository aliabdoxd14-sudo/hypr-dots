function fish_right_prompt
    # Right prompt: virtualenv (if any) + time
    set -l COLOR_ACCENT '#8fc9ff'
    set -l COLOR_CYAN   '#60e6ff'

    # Virtualenv name (Python venvs)
    if set -q VIRTUAL_ENV
        set -l venv (basename $VIRTUAL_ENV)
        set_color $COLOR_CYAN
        printf '[%s] ' $venv
        set_color normal
    end

    # Current time
    set_color $COLOR_ACCENT
    printf '%s' (date +"%H:%M")
    set_color normal
end

