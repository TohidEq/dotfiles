function fish_right_prompt
    # COMMAND DURATION
    if test "$TERM" = xterm-256color -a "$INSIDE_EMACS"
        return
    else
        if set -q CMD_DURATION
            if test $CMD_DURATION -gt 10
                set_color yellow
                echo -n "$CMD_DURATION ms "
            end
        end

        set_color normal
        echo (right_prompt_starship)
    end
end
