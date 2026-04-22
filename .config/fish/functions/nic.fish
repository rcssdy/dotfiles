function nic
    set -l session_name (basename "$PWD")
    if test (count $argv) -gt 0
        set session_name $argv[1]
    end

    if set -q TMUX; and test -n "$TMUX"
        echo 'Already in a tmux session. Detach first or run from outside tmux.'
        return 1
    end

    if tmux has-session -t "$session_name" 2>/dev/null
        tmux attach-session -t "$session_name"
        return 0
    end

    set -l cols (tput cols)
    set -l rows (tput lines)

    tmux new-session -d -s "$session_name" -c "$PWD" -x $cols -y $rows
    tmux split-window -v -t "$session_name" -c "$PWD" -l 20%
    tmux select-pane -t "$session_name" -U
    tmux split-window -h -t "$session_name" -c "$PWD" -l 40%
    tmux send-keys 'opencode' C-m
    tmux select-pane -L
    tmux send-keys 'nvim' C-m
    tmux attach-session -t "$session_name"
end
