git clone git@github.com:ozitag/tager-admin.git admin
rm -rf admin/.git
mv admin/docker docker/admin
cp -r assets docker/admin-auth/assets

cp assets/favicon/* admin/public/favicon
cp assets/favicon/favicon.ico admin/public/favicon.ico
cp assets/logo.svg admin/public/logo.svg
cp assets/logo.png admin/public/logo.png

sed -i -e 's/COPY \.\//COPY \.\/admin\//g' docker/backend/Dockerfile
sed -i -e 's/COPY \.\/docker/COPY \.\/admin\/COPY \.\/docker\/admin/g' docker/backend/Dockerfile
rm docker/backend/Dockerfile-e