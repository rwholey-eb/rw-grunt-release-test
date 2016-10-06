find ./dist -type f | 
while read file;
do
  git update-index --assume-unchanged $file
done;
