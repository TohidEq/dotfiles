function my_tor_ip
    notif_send 2 "Tor's IP" "Finding Tor's IP..."

    set ipx (torsocks curl -s https://api.ipify.org/)
    echo "$ipx"
    notif_send 3 "Tor's IP" "$ipx" "check"


end
