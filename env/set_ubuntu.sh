#!/bin/bash

#echo "Start Ansible"
#sudo apt-add-repository --yes --update ppa:ansible/ansible
#sudo apt -y update
#sudo apt install -y ansible
sudo apt install -y python3
sudo apt install -y python-pip
sudo ln -s /usr/bin/python3 /usr/bin/python

# fix the hosts
mkdir -p /root/.ssh
yes | cp -f /vagrant/env/hosts /etc/hosts
yes | cp -f /vagrant/env/ssh_keys/id_rsa* /root/.ssh/
cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys
chmod 600 /root/.ssh/id_rsa*
yes | cp -f /vagrant/env/sshd_config /etc/ssh/
systemctl restart sshd
