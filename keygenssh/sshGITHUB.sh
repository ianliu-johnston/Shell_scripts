#!/bin/bash
ssh-keygen -t rsa -b 4096 -C "ian.liu-johnson@holbertonschool.com"
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub
ssh -T git@github.com
git remote set-url origin git@github.com:ianliu-johnston/BatchScripts.git
