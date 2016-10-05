cp .gitignore .original
cat .gitignore | awk '!/dist/' > .ignoretemp
cat .ignoretemp > .gitignore
rm .ignoretemp
echo .original >> .gitignore
git rm --cached -q -r .

#git add .
#git commit -m "pushing dist"
#git push origin master



