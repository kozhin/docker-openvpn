
# Read Me

## Why

Inspired by [https://github.com/kylemanna/docker-openvpn](https://github.com/kylemanna/docker-openvpn).

I just needed ARM64 support for my Raspberry PI model 4b :)

## What's inside

### Software

Alpine Linux + OpenVPN + a bunch of shell scripts (see folder `scripts`).

### Supported architectures:

- amd64
- arm64

### Versioning

Docker images available at [https://hub.docker.com](https://hub.docker.com) have tags which correspond to installed versions of OpenVPN. This means that image `kozhin/docker-openvpn:2.5.7` has OpenVPN `2.5.7` inside. Versions other packages are expected to be latest to the moment of image creation (see image creation date).

### Host machine requirements

- Latest Docker installed
- Docker Compose available

## How To Use

To use this Docker image some manual configuration is required.

### First Run

1. Copy `docker-compose.example.yaml` to any folder on your host machine, e.g. `/apps`
2. Adjust file for your needs and rename it to `docker-compose.yaml`
3. Run `docker compose up -d`
4. Run `docker compose stop`
5. Get Docker volume name using `docker volume ls` and update files in `scripts` folder
6. Run script `install.sh` from `scripts` folder on your host machine and follow instructions on the scteen
7. Run `docker componse up -d`
8. (Optional) run script `add_user.sh` from `scripts` folder to create new users

### Shutting down

Simply run the following commands from your folder with `docker-compose.yaml` file:

1. `docker compose stop`
2. `docker compose rm`

NOTE: container volumes will be preserved with all data inside. To delete them use `docker volume rm %VOLUME NAMES%`. Also you may want to remove networks with `docker network rm %NETWORK NAMES%`

### Updating everything

1. Use steps mentioned in `Shutting down` section
2. Then run `docker compose pull`
3. And finally `docker compose up -d`

NOTE: use `docker image prune` to remove unused images. BE CAREFUL! This command may remove other unused images.

## License

MIT
