#!/bin/bash
echo ""
echo "###### Remove docker ce if exist ######"
sudo apt-get --yes purge docker-ce 
sudo rm -rf /var/lib/docker

echo ""
echo "###### Install docker CE #######"
curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh
 
echo ""
echo "###### Remove docker-compose if exist ######"
sudo rm -f /usr/local/bin/docker-compose

echo ""
echo "###### Install docker-compose ######"
COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)
sudo curl -L "https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose 
sudo chmod +x /usr/local/bin/docker-compose
