# prj - project jumper

function prj
    # Set project directory
    set -q PRJ_DIR || set -gx PRJ_DIR $HOME/Projects

    argparse -n prj -i h/help v/version -- $argv

    if test -n "$_flag_help"
        echo "$_flag_help h"
        echo "prj:    The project jumper"
        echo "usage:  prj [-h/--help] [-v/--version] [<query...>]"
        return 0
    end

    if test -n "$_flag_version"
        echo "prj ver 1.0.0"
        return 0
    end

    # Check reqs
    if not type -q fzf
        echo "fzf command not found" >&2
        exit 1
    else if not type -q fd
        echo "fd command not found" >&2
        exit 1
    end
    if not test -d "$PRJ_DIR"
        echo "prj: Project home directory not found '$PRJ_DIR'" >&2
        exit 1
    end

    set --local selection (
        fd --type d --hidden --max-depth 5 '\.git$' $PRJ_DIR |
        string replace -r -- '^'$PRJ_DIR'/' "" |
        string replace -r -- '/\.git/?$' "" |
        sort -u |
        fzf --layout=reverse-list --query="$argv"
    )

    if test -n "$selection" -a -d "$PRJ_DIR/$selection"
        cd "$PRJ_DIR/$selection"
    end
end
