function fish_prompt
    # Left prompt: user@host + cwd + git branch (blue-themed)
    set_color blue
    printf '%s@%s ' (whoami) (hostname -s)
    set_color normal

    set_color cyan
    printf '%s' (prompt_pwd)
    set_color normal

    # Git branch (if any)
    if type -q git
        set -l gbranch (git -C (pwd) rev-parse --abbrev-ref HEAD ^/dev/null 2>/dev/null)
        if test -n "$gbranch"
            printf ' '
            set_color brblue
            printf ' %s' $gbranch
            set_color normal
        end
    end

    printf '\n'

    # Prompt symbol line (with bright blue arrow)
    set_color brblue
    printf '➜ '
    set_color normal
end
