mv projects/web-backend/* .
mv projects/web-backend/.env.example .env.example
mv projects/web-backend/.gitlab-ci.yml .gitlab-ci.yml
mv projects/.husky .husky

cp .env.example .env

./scripts/web.sh
./scripts/backend.sh
./scripts/cleanup.sh

rm rebuild-admin.sh

docker-compose -f docker-compose.dev.yml --project-name tager up --build --force-recreate -d

open http://localhost:8000
