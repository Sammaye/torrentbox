FROM ubuntu:24.04

RUN apt-get update && apt-get install -y --no-install-recommends openvpn wget curl ca-certificates net-tools ufw  \
    && apt-get install -y --no-install-recommends transmission-cli transmission-common transmission-daemon

# Start infinte loop
CMD bash /run/init.sh ; sh -c "while sleep 3600; do :; done"
