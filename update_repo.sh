#!/bin/bash

rm rxrepo*

echo "repo-add"
repo-add --sign --key 102286012EAFCB1E -n -R ./rxrepo/os/x86_64/rxrepo.db.tar.gz ./rxrepo/os/x86_64/*.pkg.tar.zst

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
