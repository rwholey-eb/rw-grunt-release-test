# cat package.json | grep version | awk '{print $2}' | tr -d '\"\,' |
#while read version;
#do
# echo i am $version
#done; 
 
#for version in `cat package.json | grep version | awk '{print $2}' | tr -d '\"\,'`; do
#  echo i am $vserion
#done;

while read version; do
  echo i am $version
done <<(cat package.json | grep version | awk '{print $2}' | tr -d '\"\,')

