function my_norm_ip
    notif_send 2 "Your IP" "Finding Your IP..."

    set ipx (curl -s https://api.ipify.org/)
    echo "$ipx"
    notif_send 3 "Your IP" "$ipx" "check"


end
