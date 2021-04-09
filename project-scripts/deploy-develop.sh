#!/bin/bash
set -e

#!/bin/bash
set -e

# Set project folder as base
cd /srv/PROJECT_NAME

# Set basic permissions for all project
sudo chown -R gitlab:gitlab .

# Git
git fetch --all
git reset --hard origin/develop
git clean -f -d

# Environment
cp .env.development .env
cp web/env/.env.development web/.env
cp admin/env/.env.development admin/.env
cp backend/.env.development backend/.env

# Backend project permissions
cd backend
sudo chown -R ozerich:ozerich .
sudo find . -type f -exec chmod 664 {} \;
sudo find . -type d -exec chmod 775 {} \;
sudo chmod -R ug+rwx storage bootstrap/cache
cd ..

sudo chown -R ozerich:ozerich uploads
sudo chmod -R ug+rwx uploads

# apply nginx configuration
sudo cp scripts/nginx-develop.conf /etc/nginx/sites-available/PROJECT_NAME

# Docker rebuild
COMPOSE_HTTP_TIMEOUT=200 sudo docker-compose -f docker-compose.dev.yml --project-name PROJECT_NAME build --pull
touch .maintenance
COMPOSE_HTTP_TIMEOUT=200 sudo docker-compose -f docker-compose.dev.yml --project-name PROJECT_NAME up -d --force-recreate
rm .maintenance
