mkdir .tager
mv scripts .tager/scripts
mv projects .tager/projects
mv assets .tager/assets
mv config.json .tager/config.json
rm -rf ./init*.sh
rm -rf .git
rm -rf README.md
git init
git add -A .
git commit -m 'init commit'