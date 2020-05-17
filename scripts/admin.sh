git clone git@github.com:ozitag/tager-admin.git admin
rm -rf admin/.git
cp -r admin/docker docker/admin
cp -r assets docker/admin-auth/assets