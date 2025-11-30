function fish_prompt
    # Colors (hex) — tuned for the blue Hyperland theme
    set -l COLOR_ACCENT '#8fc9ff'
    set -l COLOR_BLUE   '#4da6ff'
    set -l COLOR_CYAN   '#60e6ff'
    set -l COLOR_RED    '#ff6b6b'
    set -l COLOR_NORMAL '#cfe8ff'

    # Show last exit status when non-zero
    if test $status -ne 0
        set_color $COLOR_RED
        printf '✘ %d ' $status
        set_color normal
    end

    # user@host (compact)
    set_color $COLOR_ACCENT
    printf '%s@%s ' (whoami) (hostname -s)
    set_color normal

    # Working directory (uses fish's prompt_pwd for shortening)
    set_color $COLOR_CYAN
    printf '%s' (prompt_pwd)
    set_color normal

    # Git info (branch + dirty indicator)
    if type -q git
        set -l branch (__qs_git_branch)
        if test -n "$branch"
            printf ' '
            set_color $COLOR_BLUE
            printf ' %s' $branch
            set_color normal
            set -l dirty (__qs_git_dirty)
            if test -n "$dirty"
                set_color $COLOR_RED
                printf '*'
                set_color normal
            end
        end
    end

    printf '\n'

    # Prompt symbol line (accent arrow)
    set_color $COLOR_ACCENT
    printf '➜ '
    set_color normal
end
