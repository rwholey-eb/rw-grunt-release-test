version = cat ./package.json | grep version | awk '{print $2}' | tr -d '\"\,'

git add -f dist
git commit -m "bumping dist version $version"
git push origin master
git update-index --assume-unchanged dist
