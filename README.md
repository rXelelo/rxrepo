# RXREPO

Welckome to my own repo

## Tutorial how to install repo
1. open using editor  /etc/pacman.conf
2. add this strings
```
#GitLab
[rxrepo]
SigLevel = TrustAll
Server = https://rxelelo.gitlab.io/$repo/$repo/os/$arch
#GitHub
[rxrepo]
SigLevel = TrustAll
Server = https://rxelelo.github.io/$repo/public/$repo/os/$arch
```

## Tutorial how to make same repo
1. make some packages for example paru-bin
```
$ git clone https://aur.archlinux.org/paru-bin
$ makepkg -s
```
2. create gitlab repository (name as you repo name)

_before i will use $repo (repo name)_

3. clone you repository 
4. for example i use default tree 'main'/rxrepo/os/x86_64
but Tutorial for 'main'/x86_64
```
$ mkdir x86_64 
```
5. move here your packages and here 2 variant signed and unsigned repo

## 6. for signed do this
1. create gpg key
```
$ gpg --full-generate-key
```
here use what you want any type but write you Full Name and your mail
my output
```
~
❯ gpg --full-generate-key
gpg (GnuPG) 2.2.27; Copyright (C) 2021 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

gpg: directory '/home/sainnhe/.gnupg' created
gpg: keybox '/home/sainnhe/.gnupg/pubring.kbx' created
Please select what kind of key you want:
   (1) RSA and RSA (default)
   (2) DSA and Elgamal
   (3) DSA (sign only)
   (4) RSA (sign only)
  (14) Existing key from card
Your selection? 1
RSA keys may be between 1024 and 4096 bits long.
What keysize do you want? (3072)
Requested keysize is 3072 bits
Please specify how long the key should be valid.
         0 = key does not expire
      <n>  = key expires in n days
      <n>w = key expires in n weeks
      <n>m = key expires in n months
      <n>y = key expires in n years
Key is valid for? (0) 5y
Key expires at Fri 20 Feb 2026 02:46:59 PM CST
Is this correct? (y/N) y

GnuPG needs to construct a user ID to identify your key.

Real name: Rain Xelelo
Email address: rxelelo@outlook.com
Comment:
You selected this USER-ID:
    "Rain Xelelo <rxelelo@outlook.com>"

Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? O
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
gpg: /home/sainnhe/.gnupg/trustdb.gpg: trustdb created
gpg: key 2C316AF89E7074F3 marked as ultimately trusted
gpg: directory '/home/sainnhe/.gnupg/openpgp-revocs.d' created
gpg: revocation certificate stored as '/home/sainnhe/.gnupg/openpgp-revocs.d/410B4A906DF63761AA2B26DC2C316AF89E7074F3.rev'
public and secret key created and signed.

pub   rsa3072 2021-02-21 [SC] [expires: 2026-02-20]
      4B7B4231920C4FA3EEFDB6D3102286012EAFCB1E(long key)
uid                      Rain Xelelo <rxelelo@outlook.com>
sub   rsa3072 2021-02-21 [E] [expires: 2026-02-20]
```
after add it to server and to pacman
```
$ gpg --recv-keys 'your long key'
$ sudo pacman-key --recv-key 'output for command before'
```
## 7. For unsigned do nothing

8. locate your x86_64 folder create update.sh and paste this changing $repo
```
#!/bin/bash

rm $repo*

echo "repo-add"
repo-add --sign -n -R $repo.db.tar.gz *.pkg.tar.zst

sleep 1

rm $repo.db

rm $repo.files

mv $repo.db.tar.gz $repo.db

mv $repo.files.tar.gz $repo.files

mv $repo.db.tar.gz.sig $repo.db.sig

mv $repo.files.tar.gz.sig $repo.files.sig

echo "####################################"
echo "Repo Updated!!"
echo "####################################"

```
9. save and run for first time upload to your gitlab repository

10. Add your repo
```
[$REPO]
SigLevel = TrustAll
Server = https://gitlab.com/YOUR_NAME/REPO_NAME/-/raw/main/$arch
```