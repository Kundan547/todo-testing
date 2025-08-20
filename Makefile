IMAGE_NAME = node-app
CONTAINER_NAME = node-app-container
PORT = 3000

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME) .

# Run the container in detached mode
run:
	docker run -d --name $(CONTAINER_NAME) -p $(PORT):3000 $(IMAGE_NAME)

# Stop and remove container
stop:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

# Show logs
logs:
	docker logs -f $(CONTAINER_NAME)

# Inspect container details
inspect:
	docker inspect $(CONTAINER_NAME)

# Exec into container (default: bash shell)
exec:
	docker exec -it $(CONTAINER_NAME) sh

# Rebuild (clean + build + run)
rebuild: stop build run

# Clean everything (container + image)
clean: stop
	docker rmi $(IMAGE_NAME) || true
