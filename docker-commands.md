# List of usefull docker commands

1. `docker run:`
   - Run a command in a new container.
   - Flags:
     - `-d, --detach`: Run container in background and print container ID.
     - `-p, --publish`: Publish a container's port(s) to the host.
     - `-v, --volume`: Bind mount a volume.
     - `--name`: Assign a name to the container.
   - Example: `docker run -d -p 8080:80 nginx`

2. `docker ps:`
   - List running containers.
   - Flags:
     - `-a, --all`: Show all containers (including stopped ones).
     - `-q, --quiet`: Only display container IDs.
   - Example: `docker ps`

3. `docker stop:`
   - Stop one or more running containers.
   - Example: `docker stop container_name`

4. `docker rm:`
   - Remove one or more containers.
   - Flags:
     - `-f, --force`: Force removal of running containers.
   - Example: `docker rm container_id`

5. `docker images:`
   - List Docker images.
   - Flags:
     - `-a, --all`: Show all images (including intermediate images).
     - `--filter`: Filter output based on conditions.
   - Example: `docker images`

6. `docker rmi:`
   - Remove one or more images.
   - Flags:
     - `-f, --force`: Force removal of the image.
   - Example: `docker rmi image_id`

7. `docker build:`
   - Build an image from a Dockerfile.
   - Flags:
     - `-t, --tag`: Name and optionally tag the resulting image.
   - Example: `docker build -t my_image .`

8. `docker exec:`
   - Run a command in a running container.
   - Flags:
     - `-i, --interactive`: Keep STDIN open even if not attached.
     - `-t, --tty`: Allocate a pseudo-TTY.
   - Example: `docker exec -it container_name /bin/bash`

9. `docker logs:`
   - Fetch the logs of a container.
   - Flags:
     - `-f, --follow`: Follow log output.
     - `--tail`: Number of lines to show from the end of the logs.
   - Example: `docker logs -f container_name`

10. `docker-compose up:`
    - Create and start containers defined in the `docker-compose.yml` file.
    - Flags:
      - `-d, --detach`: Detached mode: Run containers in the background.
    - Example: `docker-compose up -d`

These commands cover a wide range of Docker operations, from managing containers and images to building custom images and interacting with containers. They are essential for everyday Docker usage and are commonly used in development, testing, and production environments.
