#!/bin/bash
exclude="node_modules"
filesContainingText="testGroupType: 'sentry',"
oldText="status: 1,"
newText="status: 2,"

output=$(grep -HRl --exclude-dir="$exclude" --exclude=\*.sh "$filesContainingText" . | cut -d: -f1) 


for OUTPUT in ${output// / }
do
    echo $OUTPUT
done
