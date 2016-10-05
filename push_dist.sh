
cp .gitignore gitignore
cat .gitignore | awk '!/remove_for_build/' > .gitignore
echo gitignore >> .gitignore
npm cache clean

git add ./dist
git commit -m "adding dist for release"
git push -f origin master

cat gitignore > .gitignore
rm gitignore
npm cache clean
