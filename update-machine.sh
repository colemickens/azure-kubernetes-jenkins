#!/usr/bin/env bash

sudo apt-get update; sudo apt-get dist-upgrade -y
sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-get install -y linux-image-extra-$(uname -r)
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo mkdir -p /etc/apt/sources.list.d
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
sudo apt-get update
sudo apt-get install -y docker-engine
sudo apt-get install -y golang
sudo apt-get install -y make jq
sudo usermod -a -G docker jenkins
