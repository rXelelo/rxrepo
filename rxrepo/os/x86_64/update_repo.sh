#!/bin/bash

rm rxrepo*

echo "repo-add"
repo-add --sign -n -R rxrepo.db.tar.gz *.pkg.tar.zst

sleep 1

rm rxrepo.db

rm rxrepo.files

mv rxrepo.db.tar.gz rxrepo.db

mv rxrepo.files.tar.gz rxrepo.files

echo "####################################"
echo "Repo Updated!!"
echo "####################################"
