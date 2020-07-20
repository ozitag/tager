cd /srv/PROJECT_NAME

#sudo chown www-data:www-data -R .

sudo -u www-data git fetch --all
sudo -u www-data git reset --hard origin/develop
sudo -u www-data git clean -f -d

sudo cp .env.development .env
sudo cp web/env/.env.development web/.env
sudo cp admin/env/.env.development admin/.env
sudo cp backend/.env.development backend/.env

sudo cp scripts/nginx-develop.conf /etc/nginx/sites-available/PROJECT_NAME

sudo docker-compose -f docker-compose.dev.yml --project-name PROJECT_NAME up --build --force-recreate -d
