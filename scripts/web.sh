git clone git@github.com:ozitag/tager-web.git web
rm -rf web/.git
mkdir docker/web
cp web/Dockerfile docker/web/Dockerfile
cp web/.env.example web/.env

cp assets/favicon/* web/public/favicon
cp assets/favicon/favicon.ico web/public/favicon.ico
cp assets/logo.svg web/public/logo.svg
cp assets/logo.png web/public/logo.png