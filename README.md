# docker-jenkis-agent-docker
A Docker image for a Jenkins Agent that can build Docker images - using "Docker out of Docker" (DooD) method

I use Jenkins based on Docker images and wanted to build Docker images with it as well.
This leads to a point where you need to run Docker commands within a Docker container.

In my case, I used an approach which is called Docker-out-of-Docker.
The Docker installation in the agent image uses actually the Docker installation of the host where it itself is running on.

To use it, you need to build the image at least one time manually (using the build.sh script) to get an agent image that can build other Docker images.
After this, the Jenkins agent can build it's own docker images.
