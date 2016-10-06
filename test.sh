 cat package.json | grep version | awk '{print $2}' | tr -d '\"\,' |
while read version;
do
 echo i am $version
done; 
 
