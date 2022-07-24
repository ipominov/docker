#!/bin/bash

mkdir -p /dev/net

if [ ! -c /dev/net/tun ]; then
  echo "Creating tun/tap device."
  mknod /dev/net/tun c 10 200
fi

openvpn --config /etc/openvpn/openvpn.conf