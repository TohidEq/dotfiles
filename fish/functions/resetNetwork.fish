function resetNetwork
    sudo systemctl restart NetworkManager
    sudo systemctl restart dnsmasq
end
