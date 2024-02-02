# How to install docker
Here are instructions to install docker on Windows, Linux or macOS.

### Windows:

**1. Download:**
   - Visit the [Docker Desktop for Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows) page.
   - Download the stable version.

**2. Installation:**
   - Run the installer and follow the on-screen instructions.
   - During installation, choose the default settings.

**3. Post Install:**
   - Docker Desktop should start automatically after installation.
   - Open PowerShell or Command Prompt and run:
     ```powershell
     docker --version
     docker run hello-world
     ```

### Linux:

**1. Download:**
   - Follow the official [Docker installation guide for Linux](https://docs.docker.com/engine/install/).

**2. Installation:**
   - Choose your Linux distribution from the guide and follow the instructions.

**3. Post Install:**
   - Add your user to the `docker` group to run Docker without sudo:
     ```bash
     sudo usermod -aG docker $USER
     ```
   - Log out and log back in or restart your system.
   - Open a terminal and run:
     ```bash
     docker --version
     docker run hello-world
     ```

### macOS:

**1. Download:**
   - Visit the [Docker Desktop for Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac) page.
   - Download the stable version.

**2. Installation:**
   - Run the installer and follow the on-screen instructions.
   - During installation, choose the default settings.

**3. Post Install:**
   - Docker Desktop should start automatically after installation.
   - Open a terminal and run:
     ```bash
     docker --version
     docker run hello-world
     ```

These steps cover the basic installation and verification of Docker on Windows, Linux, and macOS. Keep in mind that the post-installation commands are meant to check if Docker is installed correctly and can run containers.
