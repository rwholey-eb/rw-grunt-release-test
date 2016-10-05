cp .gitignore .original
cat .gitignore | awk '!/remove_for_release/' > .ignoretemp
cat .ignoretemp > .gitignore
rm .ignoertemp
echo .original >> .gitignore
git rm --cached -q -r .
git add dist
