cp .gitignore .original
cat .gitignore | awk '!/dist/' > .ignoretemp
cat .ignoretemp > .gitignore
rm .ignoretemp
echo .original >> .gitignore
git rm --cached -q -r .

#git add dist
#git commit -m "pushing dist"
#git push origin master

git status

cat .original > .gitignore
rm .original
git add .