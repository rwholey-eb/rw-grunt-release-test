
cp .gitignore gitignore
cat .gitignore | awk '!/remove_from_build/' > .gitignore.tmp
echo gitignore >> .gitignore.tmp
cat .gitignore.tmp > .gitignore && rm .gitignore.tmp
npm cache clean

git add ./dist
git commit -m "adding dist for release"
git push -f origin master

cat gitignore > .gitignore
rm gitignore
npm cache clean
