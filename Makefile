# Set shell
SHELL := /bin/bash

# Set Image Name
CONTAINER_NAME=react-portfolio
IMAGE=react--portfolio-image

REACT_PORT=3000

# Check if desired HTTP port is set
ifeq ($(HTTP_PORT),)
HTTP_PORT=1951
endif

# Run non-docker mode
up-local:
	npm install
	npm start

# Run docker mode
up-docker:
	docker build --tag ${IMAGE} .
	docker run -i -p ${HTTP_PORT}:${REACT_PORT} --name ${CONTAINER_NAME} -d ${IMAGE}
	@echo "Run 'docker logs -f $(CONTAINER_NAME)' to tail logs"