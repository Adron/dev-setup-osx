echo "Pull Docker image for Zookeeper & Exhibitor.";
echo "  Docker Hub Image => https://hub.docker.com/r/adron/systemic-dockzoo/";
echo "  Github Repo => https://github.com/Adron/systemic-dockzoo";
docker pull adron/systemic-dockzoo;
echo "Starting Docker image as container with ports 8181 for Exhibitor. Navigate to http://192.168.x.y:8181" \
  " to view Exhibitor. Once image is running you can also open Kitematic to view.";
docker run -p 8181:8181 -p 2181:2181 -p 2888:2888 -p 3888:3888 -d adron/systemic-dockzoo;
