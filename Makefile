#
# Automation tasks with Makefile
#
# BUILD actions
# Local building
#
.PHONY: build
build:
	docker buildx build \
	--push \
	--platform=linux/amd64,linux/arm64 \
	--build-arg OPENVPN_VERSION=2.6.4-r0 \
	-t kozhin/docker-openvpn:2.6.4 \
	-t kozhin/docker-openvpn:latest \
	-f Dockerfile \
	.

#
# TEST actions
# Local testing
#
# .PHONY: test
# test:
# 	make test-images
