function ttt
    set themes (tt -list themes | sort)

    if test (count $argv) -eq 0 -o "$argv[1]" = "--help"
        echo "=============== Help ==============="
        echo "Usage: ttt [OPTIONS]"
        echo ""
        echo "Options:"
        echo "  0                      List all available themes with numbers"
        echo "  <number>               Run tt with theme at that position (e.g., ttt 5)"
        echo "  <number> 1             Run with English quotes (e.g., ttt 5 1)"
        echo ""
        echo "Examples:"
        echo "  ttt 0                  Show all themes"
        echo "  ttt 3                  Use the 3rd theme"
        echo "  ttt 7 1                Use the 7th theme with English quotes"
        return 0
    end

    if test "$argv[1]" = "0" -o "$argv[1]" = "themes"
        for i in (seq (count $themes))
            if test $i -eq 1
                echo "=============== All Themes ==============="
                echo "Use (PgDn) or (Arrow Down) to scroll down"
                echo "Use (Q) to exit"
                echo "=========================================="
                echo
            end
            echo "$i. $themes[$i]"
        end | less -R --quit-if-one-screen
        return
    end


    set index $argv[1]
    set theme $themes[$index]

    if test -z "$theme"
        echo "❌ Wrong theme number!"
        return 1
    end

    set opts "-blockcursor" "-showwpm" "-theme" "$theme"

    if test (count $argv) -ge 2
        if test "$argv[2]" = "1"
            set opts $opts "-quotes" "en"
        end
    end

    tt $opts
end
