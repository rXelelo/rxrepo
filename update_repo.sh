#!/bin/bash

rm rxrepo*

echo "repo-add"
repo-add --sign --key D05B13D6B60B928A6F7EF338E2EA827C91708A0C -n -R ./rxrepo/os/x86_64/rxrepo.db.tar.gz ./rxrepo/os/x86_64/*.pkg.tar.zst

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
