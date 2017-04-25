#!/bin/bash
## Generates a new ssh key for github.
if [[ $# -ne 2 ]]; then
	echo "USAGE: ./sshGITHUB.sh <email> <Github Username> [<repo>]"
	exit 1
fi
ssh-keygen -t rsa -b 4096 -C "$1"
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub
ssh -T git@github.com
git remote set-url origin git@github.com:"$2"/BatchScripts.git
