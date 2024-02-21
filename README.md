# Learning Docker

Here is a list of tasks, from basic to advanced, you can perform in docker in order to learn how to use docker and how it works. If you have not installed docker, please follow the [Install Docker Guide](./install-docker.md) or the [Official Docs](https://docs.docker.com/engine/install/).

You may also look at the [List of Usefull Docker commands](./docker-commands.md), [Dockerfile](./Dockerfile) or [docker-compose.yml](./docker-compose.yml) files to see what settings you can use when building a docker image or starting a multiple docker containers using docker-compose.

## Demo tasks

1. **Hello World Container:**
   - Task: Run a simple "Hello World" container.
   - Commands:
     ```bash
     docker run hello-world
     ```

2. **Web Server Container:**
   - Task: Run a basic web server using the official Nginx Docker image.
   - Commands:
     ```bash
     docker run -d -p 80:80 --name my-web-server nginx
     ```
   - Access the web server in your browser at http://localhost.
   - Flags:
     - `-d` detach, let the container run in the backgroud
     - `-p <host port>:<container port>` port, links the `host port` to the `container port`
     - `--name` name, sets container name

3. **Persistent Data with Volumes:**
   - Task: Mount a volume to a container to persist data.
   - Commands:
     ```bash
     # Create a volume
     docker volume create mydata

     # Run a container with the volume mounted
     docker run -d -v mydata:/app/data --name data-container nginx
     ```
   - Flags:
     - `-v <volume_name>:<container path>` volume, mounts the volume to the specified `container path` 
   - If the volume was mounted, the data within should persist after the docker container has been deleted. To check this, you can run the following commands:
     ```bash
     # Create a file in data-container
     docker exec -it data-container touch /app/data/data.txt
     # Stop and delete data-container
     docker stop data-container
     docker rm data-container
     # Start a new container
     docker run -d -v mydata:/app/data --name data-container2 nginx
     # Check if file exist
     docker exec -it data-container2 cat /app/data/data.txt # Should return no error
     ```

4. **Custom Docker Image:**
   - Task: Create a Dockerfile for a custom image that prints a personalized message.
   - `Dockerfile` content
     ```Dockerfile
     FROM ubuntu:latest
     CMD echo "Hello Docker World!"
     ```
   - Commands:
     ```bash
     # Build and run
     docker build -t custom-hello .
     docker run custom-hello
     ```

5. **Docker Compose for Multi-Container Application:**
   - Task: Use Docker Compose to define and run a multi-container application.
   - Compose file (`docker-compose.yml`):
     ```yaml
     version: "3"
     services:
       web:
         image: nginx
         ports:
           - "80:80"
       db:
         image: postgres
         environment:
           POSTGRES_PASSWORD: password
     ```
   - Commands:
     ```bash
     docker compose up -d
     ```
   - Access the web server via your browser at http://localhost and enter the posgres interactive terminal with
     ```bash
     docker compose exec -it db psql -U postgres 
     ```
   - Stop all containers with
     ```bash
     docker compose down
     ```

## Individual tasks

1. **Network Isolation:**
   - Task: Start two containers with the command below, show that the containers can reach each other.
   - Commands:
     ```bash
     # Create a custom bridge network
     docker network create my-network

     # Run containers within the custom network
     docker run -d --network my-network --name container1 nginx
     docker run -d --network my-network --name container2 nginx
     ```
   - Hint: 1. `docker exec` 2. If two containers are on the same network, their container names works as domain names. 
     
2. **Multiple Containers with Docker Compose:**
   - Task: Do task 1 again, but start the containers using docker-compose.yml. The [docker-compose.yml](./docker-compose.yml) file could help you here.

3. **Docker Swarm for Orchestration:**
    - Task: Set up a Docker Swarm cluster and deploy a multi-container application.
    - Grab a friend and see if you connect their machine to the docker cluster.

4. **Dockerise Node.Js demo application**
    - Task: Create a custom docker image which runns the [Demo Application](./demo) when started.
