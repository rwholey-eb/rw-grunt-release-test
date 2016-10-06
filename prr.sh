git add -f dist
git commit -m "bumping dist version $1"
git push origin master
git update-index --assume-unchanged dist
