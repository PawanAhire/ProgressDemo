#!/bin/bash

YEAR=$(date +"%Y")
MONTH=$(date +"%m")

git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis"

git config --global push.default simple

git remote add origin "https://${GH_TOKEN}@github.com/PawanAhire/ProgressDemo.git"

export GIT_TAG=V2.$YEAR-$MONTH.$TRAVIS_BUILD_NUMBER

git fetch --tags

msg="Tag Generated from TravisCI for build $TRAVIS_BUILD_NUMBER"

if git tag $GIT_TAG -a -m "$msg" 2>/dev/null; then
git tag $GIT_TAG -a -m "Tag Generated from TravisCI for build $TRAVIS_BUILD_NUMBER"
git push origin master && git push origin master --tags
ls -aR
else echo Tag already exists!; 
fi
