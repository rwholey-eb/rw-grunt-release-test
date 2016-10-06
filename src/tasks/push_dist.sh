echo beginning dist push

# find ./dist -type f | while read file;
#     do
#       git update-index --no-assume-unchanged $file
#     done;

while read file; do
    git update-index --no-assume-unchanged $file
done <<<`find ./dist -type f`

git rm --cached -q -r dist
git add -f dist

# cat package.json | grep version | awk '{print $2}' | tr -d '\"\,' |
# while read version;
#     do
#       git commit -m "Bumping Dist to version $version"
#     done;

while read version; do
    git commit -m "Bumping Dist to version $version"
done <<< `cat package.json | grep version | awk '{print $2}' | tr -d "\"\,"`


git push origin master

while read file; do
    git update-index --assume-unchanged $file
done <<< `find ./dist -type f`

# find ./dist -type f | while read file;
#     do
#       git update-index --assume-unchanged $file
#     done;

# while read line; do echo $line; done <<<`cat package.json | grep version | awk '{print $2}' | tr -d "\"\,"`