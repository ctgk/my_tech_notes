#!/bin/sh

for file in $(git ls-files -m); do
    echo "Error: ${file} is modified but not staged."
    exit 1
done

for file in $(git ls-files --others --exclude-standard); do
    echo "Error: ${file} is not staged."
    exit 1
done

exit 0
