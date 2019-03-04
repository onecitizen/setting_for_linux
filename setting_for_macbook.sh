#!/bin/sh

#アップデート

sudo apt update 
sudo apt upgrade -y

#インストール

sudo apt install macfanctld -y
sudo apt intsall pm-utils -y
sudo apt install firefox -y
sudo apt install spotify -y
sudo apt install git -y
sudo apt install vim -y
sudo apt install powertop -y
sudo apt install gufw -y
sudo apt install openssh-server -y
sudo apt install chromium-browser -y 

wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
sudo apt-get update
# Install Atom
sudo apt-get install atom

#各種設定
LANG=C xdg-user-dirs-gtk-update
sudo cp /etc/systemd/logind.conf /etc/systemd/logind.conf.back

#各種設定方法
#https://www.evernote.com/shard/s446/sh/082cb009-be9d-4b85-9d03-bf3d1b289f47/1d79118b7760f80c928ff311b4b0d91b
#https://www.evernote.com/shard/s446/sh/34300c91-ab7b-47d1-b8cf-febfd7ff6810/ea476cc5ef8ca81fc1def98e312ad000
#https://www.evernote.com/shard/s446/sh/98c36f29-e7c8-40f9-8d58-3d9fda1301b4/7b258dc2a2fc153b5d572aec0378ce92
#https://linuxnewbieguide.org/how-to-mount-macos-apfs-disk-volumes-in-linux/

#enable firewall
sudo ufw enable

#fixing suspend bug and powertop setting
sudo vim /etc/systemd/logind.conf
sudo vim /etc/rc.local
sudo chmod 755 /etc/rc.local
sudo vim /etc/systemd/system/rc-local.service
sudo systemctl enable rc-local.service

#setting for apfs-mount
sudo apt install fuse libfuse-dev libicu-dev bzip2 libbz2-dev cmake clang git libattr1-dev
git clone https://github.com/sgan81/apfs-fuse.git
cd apfs-fuse
git submodule init
git submodule update
mkdir build
cd build
cmake ..
make

sudo cp apfs=* /usr/local/bin


