rm -rf ./admin
rm -rf ./docker/admin

git clone git@github.com:ozitag/tager-admin.git admin
rm -rf admin/.git

mv admin/docker docker/admin
cp -R .tager/assets docker/admin-auth/assets

node ./.tager/scripts/admin-config.js ../config.json ../..

cp -R .tager/assets/favicon admin/public/favicon
cp .tager/assets/favicon/favicon.ico admin/public/favicon.ico
cp .tager/assets/logo.svg admin/public/logo.svg
cp .tager/assets/logo.png admin/public/logo.png

sed -i -e 's/COPY \.\/p/COPY \.\/admin\/p/g' docker/admin/Dockerfile
sed -i -e 's/COPY \.\/y/COPY \.\/admin\/y/g' docker/admin/Dockerfile
sed -i -e 's/COPY \.\/ /COPY \.\/admin\/ /g' docker/admin/Dockerfile
sed -i -e 's/COPY \.\/docker/COPY \.\/docker\/admin/g' docker/admin/Dockerfile
rm docker/admin/Dockerfile-e

sed -i -e 's/\/favicon/\/admin\/favicon/g' admin/public/favicon/browserconfig.xml
sed -i -e 's/\/favicon/\/admin\/favicon/g' admin/public/favicon/site.webmanifest