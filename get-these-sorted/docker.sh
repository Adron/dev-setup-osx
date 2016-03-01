# Docker Prep
docker-machine create default --driver virtualbox;
docker-machine env default;
eval $(docker-machine env default);