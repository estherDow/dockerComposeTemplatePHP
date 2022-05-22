export DOCKER_BUILDKIT=0
export COMPOSE_DOCKER_CLI_BUILD=0

echo "building php Image"
docker compose build
echo "starting docker"
docker compose up -d

echo "remove default.conf file"
docker exec -d nginx rm /etc/nginx/conf.d/default.conf
docker exec -d nginx service nginx reload

echo "Add Cron Job"
docker exec -d php crontab
