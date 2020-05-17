mv projects/web-backend-admin/* .
mv projects/web-backend-admin/.env.example .env.example
cp .env.example .env

./scripts/web.sh
./scripts/admin.sh
./scripts/backend.sh
./scripts/cleanup.sh

docker-compose -f docker-compose.local.yml --project-name tager up --build --force-recreate -d

open http://localhost:8000
