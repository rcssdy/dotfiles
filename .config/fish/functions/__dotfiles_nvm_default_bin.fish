function __dotfiles_nvm_default_bin
    set -l versions_dir $NVM_DIR/versions/node
    if not test -d $versions_dir
        return 1
    end

    if test -r $NVM_DIR/alias/default
        set -l target (string trim < $NVM_DIR/alias/default)

        while test -n "$target"
            if string match -rq '^v[0-9]' -- $target
                set -l candidate $versions_dir/$target/bin
                if test -d $candidate
                    printf '%s\n' $candidate
                    return 0
                end
                return 1
            end

            switch $target
            case node
                break
            case system
                return 1
            case '*'
                set -l alias_file $NVM_DIR/alias/$target
                if not test -r $alias_file
                    break
                end

                set -l resolved (string trim < $alias_file)
                if test -z "$resolved" -o "$resolved" = "$target"
                    break
                end

                set target $resolved
            end
        end
    end

    set -l latest_bin
    set -l latest_version

    for dir in $versions_dir/v*
        if not test -d $dir
            continue
        end

        set -l node_version (string replace -r '^.*/v' '' -- $dir)
        if test -z "$latest_version"
            set latest_version $node_version
            set latest_bin $dir/bin
            continue
        end

        set -l newest (printf '%s\n%s\n' $latest_version $node_version | sort -V | tail -n 1)
        if test "$newest" = "$node_version"
            set latest_version $node_version
            set latest_bin $dir/bin
        end
    end

    if test -n "$latest_bin"
        printf '%s\n' $latest_bin
    end
end
