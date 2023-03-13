# to avoid /var/run/docker.sock: connect: permission denied
# the rights need to be changed on the host that startes the Jenkins Agent for Docker builds

sudo apt-get install acl 
sudo setfacl --modify user:1000:rw /var/run/docker.sock
