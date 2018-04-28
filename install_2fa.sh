#bin/bash

echo "The original script was created by frk!"
echo "The repository can be found here: https://github.com/frk1/steamhourboostv2"
echo "This installation script was created by dash199t!"

sleep 6

if [[ "$USER" != 'root' ]]; then
  echo "Sorry, you need to run this as as root"
  exit
fi

MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
  apt-get update
apt-get upgrade -y
apt-get install -y git wget tar build-essential libssl-dev git

cd ~
mkdir ~/tmp
cd ~/tmp

# Install latest node-js and dependables
wget http://nodejs.org/dist/v6.5.0/node-v6.5.0-linux-x64.tar.gz ~/tmp
sudo tar --strip-components 1 -xzvf ~/tmp/node* -C /usr/local
npm -g install npm@latest
npm -g install coffee-script pm2

# Clone repository
git clone https://github.com/supersonik1337/steamhourboostv2 ~/steamhourboostv2
cd ~/steamhourboostv2
npm install .

echo "Now you can start adding Accounts or something else."
else
  echo "You need to have a 64-Bit Operating System"
  exit
fi
