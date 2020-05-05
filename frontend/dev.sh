docker run \
  --rm \
  --name frontend \
  --env REDIS_URL="redis" \
  --env LOGO_COLOUR="blue" \
  --network demoapp \
  --publish 80:80 \
  --volume $PWD/myweb:/app \
  whale-demoapp:latest