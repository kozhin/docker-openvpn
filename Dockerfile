# Original credits:
# - https://github.com/jpetazzo/dockvpn
# - https://github.com/kylemanna/docker-openvpn

FROM alpine:edge

LABEL Description="OpenVPN Docker image" \
      Maintainer="Konstantin Kozhin <1387510+kozhin@users.noreply.github.com>" \
      Vendor="" \
      Version="0.3.0"

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories && \
    echo "http://dl-4.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories && \
    apk add --update --no-cache openvpn iptables bash easy-rsa openvpn-auth-pam google-authenticator pamtester && \
    ln -s /usr/share/easy-rsa/easyrsa /usr/local/bin && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

# Needed by scripts
ENV OPENVPN /etc/openvpn
ENV EASYRSA /usr/share/easy-rsa
ENV EASYRSA_PKI $OPENVPN/pki

# Prevents refused client connection because of an expired CRL
ENV EASYRSA_CRL_DAYS 3650

VOLUME [ "/etc/openvpn" ]

EXPOSE 1194

CMD [ "ovpn_run" ]

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

# Add support for OTP authentication using a PAM module
ADD ./otp/openvpn /etc/pam.d/
