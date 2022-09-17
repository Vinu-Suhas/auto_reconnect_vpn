#!/bin/bash
while [ "true" ]
do
    VPNCON=$(nmcli con show uuid 4cdb713e-f19f-4b79-9fd2-a21b28561048 | grep VPN.VPN-STATE | awk '{print $2}')
    if [[ $VPNCON != "5" ]]; then
        echo "Disconnected, trying to reconnect..."
        (sleep 1s && nmcli con up uuid 4cdb713e-f19f-4b79-9fd2-a21b28561048 )
    else
        echo "Already connected !"
    fi
    sleep 2
done
