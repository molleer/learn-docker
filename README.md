# Learning Docker

Here is a list of tasks, from basic to advanced, you can perform in docker in order to learn how to use docker and how it works. If you have not installed docker, please follow the [Install Docker Guide](./install-docker.md) or the [Official Docs](https://docs.docker.com/engine/install/).

You may also look at the [List of Usefull Docker commands](./docker-commands.md), [Dockerfile](./Dockerfile) or [docker-compose.yml](./docker-compose.yml) files to see what settings you can use when building a docker image or starting a multiple docker containers using docker-compose.

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

3. **Custom Docker Image:**
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

4. **Persistent Data with Volumes:**
   - Task: Mount a volume to a container to persist data.
   - Commands:
     ```bash
     # Create a volume
     docker volume create mydata

     # Run a container with the volume mounted
     docker run -d -v mydata:/app/data --name data-container nginx
     ```
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

6. **Network Isolation:**
   - Task: Create a custom bridge network and run containers within that network.
   - Commands:
     ```bash
     # Create a custom bridge network
     docker network create my-network

     # Run containers within the custom network
     docker run -d --network my-network --name container1 nginx
     docker run -d --network my-network --name container2 nginx
     ```
   - The two containers can now communicate privately, using their container names as host names. Test this by running:
     ```bash
     docker exec -it container1 curl http://container2
     ```

7. **Multiple Containers with Docker Compose:**
   - Task: Define a Docker Compose file for a multi-container application with specific network configurations, volumes, and port mappings.
   - Compose file (`docker-compose.yml`):
     ```yaml
     version: '3'
     services:
       web:
         image: nginx
         ports:
           - "8080:80"
         networks:
           - my-network
         volumes:
           - web-data:/app/data
       db:
         image: postgres
         environment:
           POSTGRES_PASSWORD: password
         networks:
           - my-network
     networks:
       my-network:
     volumes:
       web-data:
     ```
   - Commands:
     ```bash
     docker compose up -d
     ```

8. **Docker Swarm for Orchestration:**
    - Task: Set up a Docker Swarm cluster and deploy a multi-container application.
    - Commands:
      ```bash
      # Initialize Swarm on manager node
      docker swarm init

      # Join worker nodes to the Swarm (use output from previous command)
      docker swarm join --token <token> <manager-ip>

      # Deploy a stack (docker-compose.yml should be prepared)
      docker stack deploy -c docker-compose.yml my-app
      ```
    - Ensure the `docker-compose.yml` file is prepared for a Swarm environment.

These assignments cover a range of Docker features and concepts, helping you progress from basic container usage to more advanced scenarios involving multiple containers, networking, volumes, and orchestration.
