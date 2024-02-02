# Use an official Ubuntu runtime as a base image
# Other images can be found here: https://hub.docker.com/
FROM ubuntu:20.04

# Set environment variables
ENV MY_VAR="Hello Docker!" \
    ANOTHER_VAR="This is another variable"

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    curl \
    wget \
    unzip

# Copy files from the build context to the image
COPY ./app /app

# Set the working directory
WORKDIR /app

# Expose ports for container communication
# Does not expose ports, only provides information to the user
EXPOSE 80 443

# Define a volume
# Does mount volume, only provides information to the user
VOLUME /data

# Run commands during image build
RUN echo "Building Docker image..."

# Define a health check
HEALTHCHECK --interval=30s --timeout=10s CMD curl -f http://localhost/ || exit 1

# Specify the user to run the following commands
USER nobody

# Run a command when the container starts
CMD ["echo", "Hello from the Docker container!"]
