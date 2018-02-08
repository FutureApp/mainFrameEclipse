sudo docker kill $(docker ps -q )

docker rm $(docker ps -a | grep -v "8e2da9d3a6bc" | awk '{print $1}')

sudo docker  rmi -f $(docker images -q | grep -v "8e2da9d3a6bc" | awk '{print $1}')
