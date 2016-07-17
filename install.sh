sudo apt-get install make gcc libssl-dev liblocal-lib-perl cpanminus
sudo cpanm Test::More Crypt::LE
sudo mkdir -p /root/software/keys
cd /root/software
wget https://github.com/davidoster/letsencrypt-fast/blob/master/le.sh
sudo chmod 744 ./le.sh
