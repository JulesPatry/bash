#!/bin/bash
exclude="node_modules"
filesContainingText="type: 'universe',"
oldText="status: 1,"
newText="status: 2,"

output=$(grep -HRl --exclude-dir="node_modules" --exclude-dir="./build" --exclude=\*.sh "$filesContainingText" . | cut -d: -f1) 
targets=(${output// / })
targetsLength=${#targets[@]}

if [ -n "$output" ] 
then 
  echo ""
  confirm=""
  read -p $"You are about to change text on ${#targets[@]} file(s)... `echo $'\n '` ${oldText}`echo $'\n '` ${newText} `echo $'\n> '` Are you sure? (y) " confirm
  if [ $confirm == "y" ] 
  then 
    for OUTPUT in ${targets[@]}
    do
      echo $OUTPUT
      sed -i '' "s/$oldText/$newText/g" $OUTPUT
    done
  else 
    echo "Canceled Find-Replace CMD"
  fi 
else 
  echo "There are no files found with text`echo $'\n '`${filesContainingText}"
fi 



