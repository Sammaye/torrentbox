#!/bin/bash
nordvpn_token = `cat /run/secrets/nordvpn_token`;
/etc/init.d/nordvpn start && sleep 5 && nordvpn login --token "$nordvpn_token"; service transmission-daemon start
