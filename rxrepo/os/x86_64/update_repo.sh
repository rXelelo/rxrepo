#!/bin/bash

rm rxrepo*

echo "repo-add"
repo-add --sign -n -R rxrepo.db.tar.gz *.pkg.tar.zst

sleep 1

rm rxrepo.db

rm rxrepo.files

mv rxrepo.db.tar.gz rxrepo.db

mv rxrepo.files.tar.gz rxrepo.files

mv rxrepo.db.tar.gz.sig mv rxrepo.db.sig

mv rxrepo.files.tar.gz.sig rxrepo.files.sig

echo "####################################"
echo "Repo Updated!!"
echo "####################################"
