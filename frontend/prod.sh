docker run \
  --rm \
  --detach \
  --name mobyfrontend \
  --env REDIS_URL="redis" \
  --network demoapp \
  --publish 80:80 \
  ollypom/whale-demoapp:2