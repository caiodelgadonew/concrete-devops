#!/bin/bash
HOSTS=$(head -n7 /etc/hosts)
echo -e "$HOSTS" > /etc/hosts
echo '10.111.111.10     k8s.concrete.example' >> /etc/hosts
echo '10.111.111.20     ci.concrete.example' >> /etc/hosts