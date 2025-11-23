function benchcmp
    if test (count $argv) -lt 2
        echo "Usage: benchcmp <script1> <script2> [iterations]"
        return 1
    end

    set script1 $argv[1]
    set script2 $argv[2]
    set iters $argv[3]

    function _time_script
        set script $argv[1]
        set iterations $argv[2]
        set total 0

        for i in (seq $iterations)
            set start (date +%s%N)
            $script >/dev/null 2>&1
            set end (date +%s%N)
            set total (math "$total + ($end - $start)")
        end

        echo $total
    end

    set total1 (_time_script $script1 $iters)
    set total2 (_time_script $script2 $iters)

    echo
    echo "---- Benchmark Results ($iters iterations) ----"
    echo
    echo " ===================== "
    echo " = - = - = - = - = - = "
    echo " 1 => $script1"
    echo " - - - - V.S - - - - - "
    echo " 2 => $script2"
    echo " = - = - = - = - = - = "
    echo " ===================== "
    echo " = - = - = - = - = - = "
    echo " 1 => $total1 ns"
    echo " 2 => $total2 ns"
    echo " = - = - = - = - = - = "
    echo
end
