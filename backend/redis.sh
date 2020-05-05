docker network create \
  --driver bridge \
  demoapp

# For persistence of redis map to '/data' in the container

docker run \
  --detach \
  --network demoapp \
  --name redis \
  --publish 6379:6379 \
  redis \
  redis-server --appendonly yes