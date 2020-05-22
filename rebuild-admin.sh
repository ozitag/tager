rm -rf ./admin
rm -rf ./docker/admin

git clone git@github.com:ozitag/tager-admin.git admin
rm -rf admin/.git

mv admin/docker docker/admin
cp -R .tager/assets docker/admin-auth/assets

node ./.tager/scripts/admin-config.js ../.tager/config.json ../..

cp -R .tager/assets/favicon admin/public/favicon
cp .tager/assets/favicon/favicon.ico admin/public/favicon.ico
cp .tager/assets/logo.svg admin/public/logo.svg
cp .tager/assets/logo.png admin/public/logo.png