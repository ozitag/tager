mkdir .tager
mv scripts .tager/scripts
mv projects .tager/projects
mv assets .tager/assets
rm -rf ./init*.sh
rm -rf .git
rm -rf README.md
git init
git add -A .
git commit -m 'init commit'