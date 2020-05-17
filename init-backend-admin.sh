git clone git@github.com:ozitag/tager-admin.git admin
git clone git@github.com:ozitag/tager-backend.git backend

rm -rf admin/.git
rm -rf backend/.git
rm -rf backend/docker

mv projects/backend-admin/* .

chmod +x ./scripts/cleanup.sh
./scripts/cleanup.sh