export DOCKER_BUILDKIT=0
export COMPOSE_DOCKER_CLI_BUILD=0

echo "building docker Images"
docker compose build
echo "starting docker"
docker compose up -d

echo "remove default.conf file"
docker exec -d nginx rm /etc/nginx/conf.d/default.conf
docker exec -d nginx service nginx reload
docker exec -d php service ssh start

echo "start cron"
docker exec -d tyler service cron start

