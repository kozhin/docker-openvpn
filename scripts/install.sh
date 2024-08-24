#!/bin/bash
#
# Hint:
# Creates initial configuration for OpenVPN server
#
REPO_PATH="registry.example.com:5000/"
IMAGE_NAME="kozhin/docker-openvpn:latest"

OPEN_VPN_LOGS_DRIVER="none"
OPEN_VPN_DATA="CHANGE_ME!" # e.g. openvpn_data
OPEN_VPN_HOST="CHANGE_ME!" # e.g. vpn.example.com
#
# Creates OpenVPN configuration
#
docker run \
  -v ${OPEN_VPN_DATA}:/etc/openvpn \
  --log-driver=${OPEN_VPN_LOGS_DRIVER} \
  --rm \
  ${REPO_PATH}${IMAGE_NAME} ovpn_genconfig -u udp://${OPEN_VPN_HOST}

docker run \
  -v ${OPEN_VPN_DATA}:/etc/openvpn \
  --log-driver=${OPEN_VPN_LOGS_DRIVER} \
  --rm \
  -it \
  ${REPO_PATH}${IMAGE_NAME} ovpn_initpki

echo "COMPLETED: install.sh"
exit 0