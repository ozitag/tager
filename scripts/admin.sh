git clone git@github.com:ozitag/tager-admin.git admin
rm -rf admin/.git
mv admin/docker docker/admin
cp -R assets docker/admin-auth/assets

node ./scripts/admin-config.js ../config.json ..

rm -R admin/public/favicon
rm admin/public/logo.svg
rm admin/public/logo-small.svg
rm admin/public/logo-white.svg

cp -R assets/* admin/public
cp assets/favicon/favicon.ico admin/public/favicon.ico

sed -i -e 's/COPY \.\/p/COPY \.\/admin\/p/g' docker/admin/Dockerfile
sed -i -e 's/COPY \.\/y/COPY \.\/admin\/y/g' docker/admin/Dockerfile
sed -i -e 's/COPY \.\/ /COPY \.\/admin\/ /g' docker/admin/Dockerfile
sed -i -e 's/COPY \.\/docker/COPY \.\/docker\/admin/g' docker/admin/Dockerfile
sed -i -e 's/# COPY \.\/app\.json/COPY .\/app.json/g' docker/admin/Dockerfile
rm docker/admin/Dockerfile-e

sed -i -e 's/\/favicon/\/admin\/favicon/g' admin/public/favicon/browserconfig.xml
rm admin/public/favicon/browserconfig.xml-e
sed -i -e 's/\/favicon/\/admin\/favicon/g' admin/public/favicon/site.webmanifest
rm admin/public/favicon/site.webmanifest-e

cd admin
yarn tager:update
cd ..