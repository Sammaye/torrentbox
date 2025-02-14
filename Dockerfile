FROM ubuntu:24.04

# Install NordVPN
RUN apt-get update && \
apt-get install -y --no-install-recommends wget apt-transport-https ca-certificates && \
    apt-get install -y --no-install-recommends wget apt-transport-https ca-certificates && \
    wget -qO /etc/apt/trusted.gpg.d/nordvpn_public.asc https://repo.nordvpn.com/gpg/nordvpn_public.asc && \
    echo "deb https://repo.nordvpn.com/deb/nordvpn/debian stable main" > /etc/apt/sources.list.d/nordvpn.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends nordvpn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Transmission
RUN apt-get update  \
    && apt-get install -y --no-install-recommends transmission-cli transmission-common transmission-daemon

# Start infinte loop
CMD /etc/init.d/nordvpn start && service transmission-daemon start && sh -c "while sleep 3600; do :; done"
