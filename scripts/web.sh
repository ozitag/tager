git clone git@github.com:ozitag/tager-web.git web
rm -rf web/.git
mkdir docker/web
cp web/Dockerfile docker/web/Dockerfile
