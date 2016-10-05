npm cache clean
cp .gitignore gitignore
cat .gitignore | awk '!/**remove_for_build**/' > .gitignore
echo gitignore >> .gitignore

git add -f ./dist
git commit -f -m "adding dist for release"
git push -f origin master

cat gitignore > .gitignore
rm gitignore
npm cache clean
