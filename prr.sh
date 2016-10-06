find ./dist -type f |
while read file;
do
  git update-index --no-assume-unchanged $file
done;

version=cat ./package.json | grep version | awk '{print $2}' | tr -d '\"\,'

git add -f dist
git commit -m "bumping dist version $version"
git push origin master
git update-index --assume-unchanged dist

find ./dist -type f |
while read file;
do
  git update-index --assume-unchanged $file
done;
