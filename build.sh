#!/usr/bin/env sh

claat export -o codelabs lesson1.md
claat export -o codelabs giphy-app-1.md
gulp dist
rm -r docs
mv dist docs
rm docs/codelabs
mv codelabs docs/codelabs
cp CNAME docs/