#!/bin/sh
while [ "true" ]
do
    vpnck=$(nmcli -t -f GENERAL con status id VPN | grep activated)
    if [ $vpnck = "GENERAL.STATE:activated" ]
    then
      echo ""
    else
      (echo "" && sleep 1s && nmcli con up id VPN)
    fi
    sleep 20
done
