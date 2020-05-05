docker run \
  --rm \
  --name frontend \
  --env REDIS_URL="redis" \
  --network demoapp \
  --publish 80:80 \
  --volume $PWD/myweb:/app \
  whale-demoapp:1