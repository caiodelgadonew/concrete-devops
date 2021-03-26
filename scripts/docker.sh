#!/bin/bash
sudo curl -fsSL https://get.docker.com | bash
sudo usermod -aG docker vagrant
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.6/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
