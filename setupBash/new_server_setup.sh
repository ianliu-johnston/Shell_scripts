adduser --disabled-password --gecos "" concati
cp -r ~/.ssh /home/concati/
chown -R concati:concati /home/concati/.ssh
usermod -aG sudo concati
su concati -c "
pushd /home/concati;
git clone https://github.com/ianliu-johnston/Shell_scripts.git;
pushd Shell_scripts/setupBash;
cp bash_aliases /home/concati/.bash_aliases;
cp bashrc /home/concati/.bashrc
cp vimrc /home/concati/.vimrc;
cp -r vim /home/concati/.vim;
cat config >> /home/concati/.ssh/config;
popd
pushd /home/concati/Shell_scripts/goto
mkdir -p /home/concati/bin
chmod +x goto.py
cp goto.py /home/concati/bin
popd
"
