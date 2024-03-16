FROM ghcr.io/linuxserver/baseimage-alpine:3.19

# Install dnsmasq to play DHCP server
RUN apk --no-cache add --update dnsmasq

# Copy config files for dnsmasq, and running as a service
COPY etc /etc/

# Set the start of the IP range to reply to PXE DHCP requests on
ENV DHCP_RANGE_START=192.168.0.1

EXPOSE 67/udp
# dnsmasq will be started as a system service by the s6 supervisor
