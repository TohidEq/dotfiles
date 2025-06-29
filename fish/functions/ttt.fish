function ttt
    set themes (tt -list themes | sort)
    
    if test "$argv[1]" = "0"
        for i in (seq (count $themes))
            echo "$i. $themes[$i]"
        end
        return
    end
    
    set index $argv[1]
    set theme $themes[$index]
    
    if test -z "$theme"
        echo "❌ شماره تم نامعتبر است!"
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
