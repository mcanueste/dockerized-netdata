DOCKER_PGID=$(shell grep docker /etc/group | cut -d ":" -f 3)

run:
	DOCKER_PGID=$(DOCKER_PGID) docker-compose up -d
