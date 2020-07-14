cd /srv/PROJECT_NAME

chown ozitag:ozitag -R .

git fetch --all
git reset --hard origin/master
git clean -f -d

sudo cp .env.production .env
sudo cp web/env/.env.production web/.env
sudo cp admin/env/.env.production admin/.env
sudo cp backend/.env.production backend/.env

sudo docker-compose -f docker-compose.yml --project-name PROJECT_NAME up --build --force-recreate -d
