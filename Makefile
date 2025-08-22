# Load .env variables if the file exists
ifneq (,$(wildcard ./.env))
	include .env
	export
endif

IMAGE_NAME = node-app
CONTAINER_NAME = node-app-container
PORT = 3001

# ------------------------
# Build the Docker image
# ------------------------
build:
	docker build -t $(IMAGE_NAME) .

# ------------------------
# Run container in detached mode
# ------------------------
run:
	docker run -d --name $(CONTAINER_NAME) -p $(PORT):3000 $(IMAGE_NAME)

# ------------------------
# Stop and remove container
# ------------------------
stop:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

# ------------------------
# Show container logs
# ------------------------
logs:
	docker logs -f $(CONTAINER_NAME)

# ------------------------
# Inspect container
# ------------------------
inspect:
	docker inspect $(CONTAINER_NAME)

# ------------------------
# Exec into container (sh shell)
# ------------------------
exec:
	docker exec -it $(CONTAINER_NAME) sh

# ------------------------
# Rebuild (stop + build + run)
# ------------------------
rebuild: stop build run

# ------------------------
# Docker login using credentials from .env
# ------------------------
login:
	echo $(DOCKER_PASS) | docker login -u $(DOCKER_USER) --password-stdin

# ------------------------
# Tag the image for Docker Hub
# ------------------------
tag:
	docker tag $(IMAGE_NAME) $(DOCKER_USER)/$(IMAGE_NAME):$(TAG)

# ------------------------
# Push the image to Docker Hub
# ------------------------
push: login tag
	docker push $(DOCKER_USER)/$(IMAGE_NAME):$(TAG)

# ------------------------
# Clean container + image
# ------------------------
clean: stop
	docker rmi $(IMAGE_NAME) || true
	docker rmi $(DOCKER_USER)/$(IMAGE_NAME):$(TAG) || true 

	