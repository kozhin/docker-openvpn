#!/bin/bash
#
# Hint:
# Creates initial configuration for OpenVPN server
#
OPEN_VPN_IMAGE="kozhin/docker-openvpn"
OPEN_VPN_LOGS_DRIVER="none"

OPEN_VPN_DATA="CHANGE_ME!" # openvpn_data
OPEN_VPN_HOST="CHANGE_ME!" # vpn.example.com

#
# Creates OpenVPN configuration
#
docker run \
  -v ${OPEN_VPN_DATA}:/etc/openvpn \
  --log-driver=${OPEN_VPN_LOGS_DRIVER} \
  --rm \
  ${OPEN_VPN_IMAGE} ovpn_genconfig -u udp://${OPEN_VPN_HOST}

docker run \
  -v ${OPEN_VPN_DATA}:/etc/openvpn \
  --log-driver=${OPEN_VPN_LOGS_DRIVER} \
  --rm \
  -it \
  ${OPEN_VPN_IMAGE} ovpn_initpki

echo "COMPLETED: install.sh"
exit 0