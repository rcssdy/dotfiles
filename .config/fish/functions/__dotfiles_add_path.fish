function __dotfiles_add_path
    for candidate in $argv
        if test -d $candidate
            fish_add_path -m $candidate
        end
    end
end
