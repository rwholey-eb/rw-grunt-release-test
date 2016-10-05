#cp .gitignore gitignore
cat .gitignore | 
  while read line; 
  do echo $line
  done;
