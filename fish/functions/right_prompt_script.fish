function right_prompt_script
    set hour (date +%H)

    set clck (string split " " (date +"%H %M"))

    if test "$TERM" = linux
        echo " $clck[1]:$clck[2] "
    else
        #set chars "󱑖" "󱑋" "󱑌" "󱑍" "󱑎" "󱑏" "󱑐" "󱑑" "󱑒" "󱑓" "󱑔" "󱑕" "󱑖" "󱑋" "󱑌" "󱑍" "󱑎" "󱑏" "󱑐" "󱑑" "󱑒" "󱑓" "󱑔" "󱑕"
        set chars "󱑊" "󱐿" "󱑀" "󱑁" "󱑂" "󱑃" "󱑄" "󱑅" "󱑆" "󱑇" "󱑈" "󱑉" "󱑊" "󱐿" "󱑀" "󱑁" "󱑂" "󱑃" "󱑄" "󱑅" "󱑆" "󱑇" "󱑈" "󱑉"
        set FILE $HOME/.config/myscripts/moon-face/moon-face-char

        echo " $(cat $FILE) $clck[1]:$clck[2] $chars[$(math "$clck[1] + 1")] "
    end

end
