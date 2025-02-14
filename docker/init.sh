#!/bin/bash
trim() {
    local var="$*"
    # remove leading whitespace characters
    var="${var#"${var%%[![:space:]]*}"}"
    # remove trailing whitespace characters
    var="${var%"${var##*[![:space:]]}"}"
    printf '%s' "$var"
}

nordvpn_token=$(</run/secrets/nordvpn_token)
nordvpn_token=$(trim "$nordvpn_token")

/etc/init.d/nordvpn start && sleep 5 && nordvpn login --token $nordvpn_token && service transmission-daemon start

