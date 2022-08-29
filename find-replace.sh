#!/bin/bash
exclude="node_modules"
filesContainingText="type: 'universe',"
oldText="status: 1,"
newText="status: 2,"

output=$(grep -HRl --exclude-dir="$exclude" --exclude=\*.sh "$filesContainingText" . | cut -d: -f1) 


for OUTPUT in ${output// / }
do
    echo $OUTPUT
    sed -i '' "s/$oldText/$newText/g" $OUTPUT
done
