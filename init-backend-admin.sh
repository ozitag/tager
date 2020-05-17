mv projects/backend-admin/* .
mv projects/backend-admin/.env.example .env.example
cp .env.example .env

./scripts/admin.sh
./scripts/backend.sh
./scripts/cleanup.sh

docker-compose -f docker-compose.local.yml --project-name tager up --build --force-recreate -d