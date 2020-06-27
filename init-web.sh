mv projects/web/* .
mv projects/web/.env.example .env.example
cp .env.example .env

./scripts/web.sh
./scripts/cleanup.sh

rm rebuild-backend.sh
rm rebuild-admin.sh

docker-compose -f docker-compose.dev.yml --project-name tager up --build --force-recreate -d

open http://localhost:8000
