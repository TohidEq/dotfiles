function right_prompt_starship
    set hour (date +%H)

    #set chars "󱑖" "󱑋" "󱑌" "󱑍" "󱑎" "󱑏" "󱑐" "󱑑" "󱑒" "󱑓" "󱑔" "󱑕" "󱑖" "󱑋" "󱑌" "󱑍" "󱑎" "󱑏" "󱑐" "󱑑" "󱑒" "󱑓" "󱑔" "󱑕"
    set chars "󱑊" "󱐿" "󱑀" "󱑁" "󱑂" "󱑃" "󱑄" "󱑅" "󱑆" "󱑇" "󱑈" "󱑉" "󱑊" "󱐿" "󱑀" "󱑁" "󱑂" "󱑃" "󱑄" "󱑅" "󱑆" "󱑇" "󱑈" "󱑉"



    # --------- MOON PHASE ---------
    set FILE $HOME/.config/myscripts/moon-face/moon-face-char
    set clck (string split " " (date +"%H %M"))
    echo " $(cat $FILE) $clck[1]:$clck[2] $chars[$(math "$clck[1] + 1")] "

end
