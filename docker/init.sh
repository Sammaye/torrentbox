#!/bin/bash
trim() {
    local var="$*"
    # remove leading whitespace characters
    var="${var#"${var%%[![:space:]]*}"}"
    # remove trailing whitespace characters
    var="${var%"${var##*[![:space:]]}"}"
    printf '%s' "$var"
}

# This is an example of reading secrets correctly
#nordvpn_token=$(</run/secrets/nordvpn_token)
#nordvpn_token=$(trim "$nordvpn_token")

# This seems to set some kind of deprecated behaviour
mkdir -p /dev/net
mknod /dev/net/tun c 10 200
chmod 600 /dev/net/tun

openvpn --config /etc/openvpn/ovpn_udp/uk2336.nordvpn.com.udp.ovpn --auth-user-pass /run/secrets/openvpn_credentials --daemon && service transmission-daemon start

