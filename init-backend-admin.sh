mv projects/backend-admin/* .
mv projects/backend-admin/.env.example .env.example
mv projects/backend-admin/.gitlab-ci.yml .gitlab-ci.yml

cp .env.example .env

./scripts/admin.sh
./scripts/backend.sh
./scripts/cleanup.sh

rm rebuild-web.sh

docker-compose -f docker-compose.dev.yml --project-name tager up --build --force-recreate -d

open http://localhost:8000
