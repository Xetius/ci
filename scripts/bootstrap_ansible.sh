#!/bin/bash

set -e
echo "Installing Ansible..."
export DEBIAN_FRONTEND=noninteractive
apt-get install -y software-properties-common
apt-add-repository ppa:ansible/ansible
apt-get update -y
apt-get install -y ansible
cp /vagrant/ansible.cfg /etc/ansible/ansible.cfg

