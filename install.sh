#!/bin/bash

echo "Ubuntu 24.04 in-development accessibility fixes"

sudo snap refresh snap-store --edge
sudo snap refresh firmware-updater --edge

sudo add-apt-repository ppa:rastersoft-gmail/a11y-packages
sudo sed -i -e 's/noble-backports/noble-backports noble-proposed/g' /etc/apt/sources.list.d/ubuntu.sources

cat << EOF | sudo tee /etc/apt/preferences.d/ppa-pinning
Package: *
Pin: release o=noble-proposed
Pin-Priority: 1001

Package: *
Pin: release o=LP-PPA-rastersoft-gmail-a11y-packages
Pin-Priority: 1002
EOF

sudo apt update
sudo apt full-upgrade -y

echo "All done. Press any key to reboot"
read -n 1 -s
sudo reboot
