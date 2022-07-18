#!/usr/bin/bash

# Script that installs docker and checks if it's working on CentOS.

#install DOCKER
sudo yum remove docker \		#to uninstall old versions
	docker-client \
	docker-client-latest \
	docker-common \
	docker-latest \
	docker-latest-logrotate \
	docker-logrotate \
	docker-engine

#set up the repository
sudo yum install -y yum-utils
sudo yum-config-manager \
	--add-repo \
	https://download.docker.com/linux/centos/docker-ce.repo

#install Docker Engine
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

#start Docker
sudo systemctl start docker

#verify
sudo docker run hello-world