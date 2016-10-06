find ./dist -type f |
while read file;
do
  git update-index --no-assume-unchanged $file
done;

git rm --cached -q -r dist
git add -f dist

cat package.json | grep version | awk '{print $2}' | tr -d '\"\,' |
while read version;
do
  git commit -m "bumping dist version $version"
done;

git push origin master

find ./dist -type f |
while read file;
do
  git update-index --assume-unchanged $file
done;
