#!/bin/bash
#
# Hint:
# Creates OpenVPN user configuration and exports it to a file
#
REPO_PATH="registry.example.com:5000/"
IMAGE_NAME="kozhin/docker-openvpn:latest"

OPEN_VPN_LOGS_DRIVER="none"
OPEN_VPN_DATA="CHANGE_ME!" # e.g. openvpn_data
#
# NOTICE:
# Remove 'nopass' if users need password protection
#
OPEN_VPN_USER="${1}" # jdoe

#
# Creates a new account
#
docker run \
  -v ${OPEN_VPN_DATA}:/etc/openvpn \
  --log-driver=${OPEN_VPN_LOGS_DRIVER} \
  --rm \
  -it \
  ${REPO_PATH}${IMAGE_NAME} easyrsa build-client-full ${OPEN_VPN_USER} nopass

#
# Exports newly created account into a file
#
docker run \
  -v ${OPEN_VPN_DATA}:/etc/openvpn \
  --log-driver=${OPEN_VPN_LOGS_DRIVER} \
  --rm \
  ${REPO_PATH}${IMAGE_NAME} ovpn_getclient ${OPEN_VPN_USER} > ${OPEN_VPN_USER}.ovpn

echo "COMPLETED: add_account.sh"
exit 0