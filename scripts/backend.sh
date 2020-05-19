git clone git@github.com:ozitag/tager-backend.git backend
mv backend/src _backend
cp -r backend/docker docker/backend
rm -rf backend
mv _backend backend
cp backend/.env.example backend/.env

cp assets/favicon/favicon.ico backend/public/favicon.ico

sed -i -e 's/ \/src/ \/backend/g' docker/backend/Dockerfile
sed -i -e 's/ \/docker/ \/docker\/backend/g' docker/backend/Dockerfile
rm docker/backend/Dockerfile-e