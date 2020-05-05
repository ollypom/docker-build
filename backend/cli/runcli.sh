docker built -t redis-cli .

docker run \
  --rm \
  -it \
  --network demoapp \
  --name redis-cli \
  redis-cli:latest
  sh