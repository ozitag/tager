mkdir .tager
mv assets .tager/assets
mv config.json .tager/config.json
mkdir .tager/scripts
cp scripts/admin-config.js .tager/scripts/admin-config.js
rm -rf scripts
rm -rf projects
rm -rf ./init*.sh
rm -rf .git

mv project-scripts scripts

git init
git add -A .
git commit -m 'init commit'