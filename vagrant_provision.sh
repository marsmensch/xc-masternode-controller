#!/bin/bash
# this script installs all desired packages in the new guest VM

CODENAME=xcurrency
XC_VERSION="3.0.04"
GIT_URL="https://github.com/XCurrency/xc/releases/download/v${XC_VERSION}/xcurrency-${XC_VERSION}-x86_64-linux-gnu.tar.gz"
SCVERSION="master"

# update repositories
apt-get update && apt-get -y upgrade

#
# install dependencies
#
apt-get -qqy -o=Dpkg::Use-Pty=0 install  \
    git apt-utils pkg-config bsdmainutils \
    libqt5gui5 libqt5core5a libqt5dbus5 	

# enter the vagrant homedir
cd /home/vagrant

# prepare the desktop and logo images
cp /vagrant/img/xc.png /usr/share/pixmaps/xcurrency.png

#
# download & unpack the latest stable release
#
wget -qO- ${GIT_URL} | tar xz -C /tmp/ && cd /tmp
cp xcurrency-${XC_VERSION}/bin/xc3-qt /usr/local/bin/

# change permissions as required
chown -R vagrant:vagrant /home/vagrant/

#
# generate the desktop file
#
cat >/home/vagrant/Desktop/xcurrency.desktop <<EOL
[Desktop Entry]
Version=1.0
Name=XCurrency-qt
Comment=Masternode Controller Wallet
GenericName=XCurrency-Qt
Keywords=Cream;Crypto;Masternode;
Exec=/usr/local/bin/xc3-qt
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/xcurrency.png
Categories=Network;
StartupNotify=true
Actions=start;reindex;help;

[Desktop Action start]
Name=start
Exec=/usr/local/bin/xc3-qt

[Desktop Action reindex]
Name=reindex
Exec=/usr/local/bin/xc3-qt -reindex

[Desktop Action help]
Name=masternode setup help
Exec=/usr/bin/firefox https://masternodes.github.io/vps/
EOL

chmod +x /home/vagrant/Desktop/xcurrency.desktop

# add desktop link and readme

# generate the config, link and readme, place it on the desktop
# todo
# Masternodes statistics:
# Masternodes stats: https://masternodes.pro/stats/crm
# Masternodes stats: https://masternodes.online/currencies/CRM/
 
# Whatever 
# todo
