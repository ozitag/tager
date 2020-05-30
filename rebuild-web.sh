rm -rf ./web
rm -rf ./docker/web

git clone git@github.com:ozitag/tager-web.git web
rm -rf web/.git

mkdir docker/web
cp web/Dockerfile docker/web/Dockerfile
cp web/.env.example web/.env

cp -R .tager/assets/favicon web/public
cp .tager/assets/favicon/favicon.ico web/public/favicon.ico
cp .tager/assets/logo.svg web/public/logo.svg
cp .tager/assets/logo.png web/public/logo.png