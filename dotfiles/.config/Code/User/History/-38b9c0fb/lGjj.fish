function __qs_git_branch --description 'Return current git branch or commit short-hash'
    if not type -q git
        return 1
    end
    # If not in a git repository, exit silently
    git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return 1

    # Try symbolic-ref (branch), fall back to short commit
    set -l branch (git symbolic-ref --short HEAD 2>/dev/null)
    if test -z "$branch"
        set branch (git rev-parse --short HEAD 2>/dev/null)
    end
    printf '%s' $branch
end

function __qs_git_dirty --description 'Return non-empty string if repo has working tree changes'
    if not type -q git
        return 1
    end
    git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return 1
    if test -n "(git status --porcelain 2>/dev/null)"
        printf '*'
    end
end
