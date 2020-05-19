mv projects/web-backend/* .
mv projects/web-backend/.env.example .env.example
cp .env.example .env

./scripts/web.sh
./scripts/backend.sh
./scripts/cleanup.sh

docker-compose -f docker-compose.dev.yml --project-name tager up --build --force-recreate -d

open http://localhost:8000
