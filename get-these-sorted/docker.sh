# Docker Prep
docker-machine create default --driver virtualbox;
docker-machine start default
docker-machine env default;
eval $(docker-machine env default);
# Docker Hub Image => https://hub.docker.com/r/adron/systemic-dockzoo/
# Github Repo => https://github.com/Adron/systemic-dockzoo
docker pull adron/systemic-dockzoo;
docker run -p 8181:8181 -p 2181:2181 -p 2888:2888 -p 3888:3888 adron/systemic-dockzoo;