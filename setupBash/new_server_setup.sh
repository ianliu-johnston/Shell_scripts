adduser --disabled-password --gecos "" concati
cp -r ~/.ssh /home/concati/
chown -R concati:concati /home/concati/.ssh
usermod -aG sudo concati
su concati -c "
mkdir -p /home/concati/bin;
pushd /home/concati;
git clone https://github.com/ianliu-johnston/Shell_scripts.git;
rm -rf /home/concati/.bash_aliases /home/concati/.bashrc /home/concati/.vimrc /home/concati/.vim;
ln -s /home/concati/Shell_scripts/setupBash/bash_aliases .bash_aliases;
ln -s /home/concati/Shell_scripts/setupBash/bashrc .bashrc;
ln -s /home/concati/Shell_scripts/setupBash/vimrc .vimrc;
ln -s /home/concati/Shell_scripts/setupBash/vim/ .vim;
chmod +x /home/concati/Shell_scripts/setupBash/jq;
chmod +x /home/concati/Shell_scripts/goto/goto.py;
cat /home/concati/Shell_scripts/setupBash/config >> /home/concati/.ssh/config;
popd
pushd /home/concati/bin/
ln -s /home/concati/Shell_scripts/jq jq;
ln -s /home/concati/Shell_scripts/setupvenv/setup_venv.sh setup_venv
ln -s /home/concati/Shell_scripts/goto/goto.py goto.py
popd
"
apt-get update
apt-get install silversearcher-ag
