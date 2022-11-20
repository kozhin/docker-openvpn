#!/bin/bash
#
# Hint:
# Creates OpenVPN user configuration and exports it to a file
#
OPEN_VPN_IMAGE="kozhin/docker-openvpn"
OPEN_VPN_LOGS_DRIVER="none"

OPEN_VPN_DATA="CHANGE_ME!" # openvpn_data

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
  ${OPEN_VPN_IMAGE} easyrsa build-client-full ${OPEN_VPN_USER} nopass

#
# Exports newly created account into a file
#
docker run \
  -v ${OPEN_VPN_DATA}:/etc/openvpn \
  --log-driver=${OPEN_VPN_LOGS_DRIVER} \
  --rm \
  ${OPEN_VPN_IMAGE} ovpn_getclient ${OPEN_VPN_USER} > ${OPEN_VPN_USER}.ovpn

echo "COMPLETED: add_account.sh"
exit 0