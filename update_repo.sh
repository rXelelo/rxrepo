#!/bin/bash

rm rxrepo*

echo "repo-add"
repo-add --sign --key F600BA22F0D90359 -n -R ./rxrepo/os/x86_64/rxrepo.db.tar.gz ./rxrepo/os/x86_64/*.pkg.tar.zst

sleep 1

rm ./rxrepo/os/x86_64/rxrepo.db

rm ./rxrepo/os/x86_64/rxrepo.files

mv ./rxrepo/os/x86_64/rxrepo.db.tar.gz ./rxrepo/os/x86_64/rxrepo.db

mv ./rxrepo/os/x86_64/rxrepo.files.tar.gz ./rxrepo/os/x86_64/rxrepo.files

mv ./rxrepo/os/x86_64/rxrepo.db.tar.gz.sig ./rxrepo/os/x86_64/rxrepo.db.sig

mv ./rxrepo/os/x86_64/rxrepo.files.tar.gz.sig ./rxrepo/os/x86_64/rxrepo.files.sig

echo "####################################"
echo "Repo Updated!!"
echo "####################################"
