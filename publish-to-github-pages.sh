#!/bin/sh

remote_repo="https://${GITHUB_ACTOR}:$1}@github.com/${GITHUB_REPOSITORY}.git"

rm -rf build
git clone -b gh-pages "${remote_repo}" build
./build.sh
./node_modules/.bin/gulp build
rm build/codelabs
cp -R codelabs build/codelabs
cd build
git config --local user.email "action@github.com"
git config --local user.name "GitHub Action"
git add .
git commit -m "Update versions" -a
git push "${remote_repo}" HEAD:gh-pages
