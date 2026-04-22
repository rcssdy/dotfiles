function fzf_change_directory
    if not type -q fzf
        echo 'fzf is not installed.' >&2
        return 1
    end

    set -l candidates $HOME/.config

    if type -q ghq
        set -l ghq_root (ghq root 2>/dev/null)
        if test -n "$ghq_root" -a -d "$ghq_root"
            set candidates $candidates (find $ghq_root -maxdepth 4 -type d -name .git 2>/dev/null | string replace -r '/\.git$' '')
        end
    end

    for dir in */
        set candidates $candidates $PWD/(string trim -r -c '/' -- $dir)
    end

    if test -d $HOME/Developments
        set candidates $candidates (find $HOME/Developments -mindepth 2 -maxdepth 2 -type d 2>/dev/null)
    end

    set -l selection (printf '%s\n' $candidates | awk '!seen[$0]++' | fzf)
    if test -n "$selection"
        cd $selection
        commandline -f repaint
    end
end
