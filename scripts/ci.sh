#!/bin/bash
mkdir -p /opt/jenkins_home
chown vagrant. /opt/jenkins_home
docker-compose -f /vagrant/docker-compose.yml up -d 