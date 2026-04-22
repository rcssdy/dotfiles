set -gx VIRTUAL_ENV_DISABLE_PROMPT true

if type -q tide
    set -g tide_left_prompt_frame_enabled true
    set -g tide_left_prompt_items pwd git newline character
    set -g tide_left_prompt_prefix ''
    set -g tide_left_prompt_separator_diff_color ''
    set -g tide_left_prompt_separator_same_color ''
    set -g tide_left_prompt_suffix ''

    set -g tide_right_prompt_frame_enabled true
    set -g tide_right_prompt_items node time
    set -g tide_right_prompt_prefix ''
    set -g tide_right_prompt_separator_diff_color ''
    set -g tide_right_prompt_separator_same_color ''
    set -g tide_right_prompt_suffix ''

    set -g tide_prompt_add_newline_before false
    set -g tide_prompt_color_frame_and_connection 565f89
    set -g tide_prompt_color_separator_same_color 7f849c
    set -g tide_prompt_icon_connection '─'
    set -g tide_prompt_min_cols 34
    set -g tide_prompt_pad_items true
    set -g tide_prompt_transient_enabled false

    set -g tide_character_color 7dcfff
    set -g tide_character_color_failure f7768e
    set -g tide_character_icon 'λ'
    set -g tide_character_vi_icon_default 'λ'
    set -g tide_character_vi_icon_replace '▶'
    set -g tide_character_vi_icon_visual 'V'

    set -g tide_pwd_bg_color 24283b
    set -g tide_pwd_color_anchors 7aa2f7
    set -g tide_pwd_color_dirs c0caf5
    set -g tide_pwd_color_truncated_dirs 7dcfff
    set -g tide_pwd_icon ''
    set -g tide_pwd_icon_home ''
    set -g tide_pwd_icon_unwritable ''
    set -g tide_pwd_markers .bzr .citc .git .hg .node-version .python-version .ruby-version .shorten_folder_marker .svn .terraform bun.lockb Cargo.toml composer.json CVS go.mod package.json build.zig

    set -g tide_git_bg_color 7aa2f7
    set -g tide_git_bg_color_unstable e0af68
    set -g tide_git_bg_color_urgent f7768e
    set -g tide_git_color_branch 1f2335
    set -g tide_git_color_conflicted 1f2335
    set -g tide_git_color_dirty 1f2335
    set -g tide_git_color_operation 1f2335
    set -g tide_git_color_staged 1f2335
    set -g tide_git_color_stash 1f2335
    set -g tide_git_color_untracked 1f2335
    set -g tide_git_color_upstream 1f2335
    set -g tide_git_icon ''
    set -g tide_git_truncation_length 24
    set -g tide_git_truncation_strategy ''

    set -g tide_node_bg_color 24283b
    set -g tide_node_color 9ece6a
    set -g tide_node_icon ''

    set -g tide_time_bg_color bb9af7
    set -g tide_time_color 1f2335
    set -g tide_time_format '%T'

    set -g tide_status_bg_color 24283b
    set -g tide_status_bg_color_failure 24283b
    set -g tide_status_color 9ece6a
    set -g tide_status_color_failure f7768e
    set -g tide_status_icon '✔'
    set -g tide_status_icon_failure '✘'

    set -g tide_cmd_duration_bg_color 24283b
    set -g tide_cmd_duration_color e0af68
    set -g tide_cmd_duration_decimals 0
    set -g tide_cmd_duration_threshold 3000

    set -g tide_context_always_display false
    set -g tide_context_bg_color 24283b
    set -g tide_context_color_default e0af68
    set -g tide_context_color_root f7768e
    set -g tide_context_color_ssh e0af68
    set -g tide_context_hostname_parts 1

    set -g tide_jobs_bg_color 24283b
    set -g tide_jobs_color 9ece6a
    set -g tide_jobs_icon ''
    set -g tide_jobs_number_threshold 1000
end
