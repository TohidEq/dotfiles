set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color 06D66A)
set red (set_color FF7575)
set gray (set_color 0d0d0d)

# Fish git prompt
set __fish_git_prompt_showdirtystate yes
set __fish_git_prompt_showstashstate yes
set __fish_git_prompt_showuntrackedfiles yes
set __fish_git_prompt_showupstream yes
# Status Chars
set __fish_git_prompt_char_dirtystate ' '
set __fish_git_prompt_char_stagedstate ' '
set __fish_git_prompt_char_untrackedfiles ' '
set __fish_git_prompt_char_stashstate ' '
set __fish_git_prompt_char_upstream_ahead ' '
set __fish_git_prompt_char_upstream_behind ' '

set __fish_git_prompt_char_invalidstate '⠀✖ '
set __fish_git_prompt_char_cleanstate '⠀✔ '

set __fish_git_prompt_char_upstream_diverged '  '

set __fish_git_prompt_char_upstream_equal ' '
# Enable color hints

# Colors for states
set __fish_git_prompt_color_branch green
# green git
set __fish_git_prompt_color_upstream 689d6a
set __fish_git_prompt_color_upstream_ahead 06D66A
set __fish_git_prompt_color_upstream_behind red

#red
set __fish_git_prompt_color_dirtystate FF7575
set __fish_git_prompt_color_stagedstate yellow
set __fish_git_prompt_color_untrackedfiles magenta
set __fish_git_prompt_color_stashstate blue
# red
set __fish_git_prompt_color_invalidstate FF7575
# green git
set __fish_git_prompt_color_cleanstate 689d6a

# Other formatting
set __fish_git_prompt_color_prefix normal
set __fish_git_prompt_color_suffix normal

function fish_prompt
    # save last command status in a different var
    set -l last_status $status

    # --- DIRECTORY ---
    if not test -w .
        # red
        set_color FF7575
        printf "⠀ !"
    else
        printf "   "
    end

    set_color normal
    echo -n (prompt_pwd) " "

    # Get git prompt output
    set git_raw (__fish_git_prompt)

    set git_clean (string sub -s 6 -e (math (string length $git_raw) - 4) $git_raw)

    set git_len (string length "$git_clean")

    set_color green
    if test $git_len -gt 3
        printf ' '
        printf '%s ' $git_clean
        set_color normal
    end

    # --- LANG ICONS ---
    if test -f "package.json"
        set_color 68a0b0
        echo -n "  "
        set_color normal
    end

    if test -f "go.mod"
        set_color 00aaff
        echo -n "  "
        set_color normal
    end

    if test -f "Cargo.toml"
        set_color dea584
        echo -n "  "
        set_color normal
    end

    if test -f "pom.xml" -o -f "build.gradle"
        set_color f0c674
        echo -n "  "
        set_color normal
    end

    if test -f "mix.exs"
        set_color a6e22e
        echo -n "  "
        set_color normal
    end

    if test -f "elm.json"
        set_color 519aba
        echo -n "  "
        set_color normal
    end

    if test -f gradlew -o -f "build.gradle"
        set_color e5a00d
        echo -n "  "
        set_color normal
    end

    if test -f "*.cabal"
        set_color d07fce
        echo -n "  "
        set_color normal
    end

    if test -f "project.toml" -o -f "Project.jl"
        set_color 955cc5
        echo -n "  "
        set_color normal
    end

    if test -f "*.nimble"
        set_color ff8c00
        echo -n " 󰆥 "
        set_color normal
    end

    if test -f "build.sbt"
        set_color c22a2a
        echo -n "  "
        set_color normal
    end

    echo ""
    echo -n "⠀"
    if test $last_status -eq 0
        set_color 06d66A
        echo -n " "
    else
        set_color ff7575
        echo -n " "
    end

    if test "$TERM" = xterm-256color -a "$INSIDE_EMACS"
        echo -n " "

        if set -q CMD_DURATION
            if test $CMD_DURATION -gt 10
                set_color yellow
                echo -n "$CMD_DURATION ms "
            end
        end

        # TIME
        set_color normal
        echo -n (right_prompt_starship)
        echo -n " "
    end

    # --- PROMPT SYMBOL ---
    set_color normal
    echo -n " "

    set_color normal
end
