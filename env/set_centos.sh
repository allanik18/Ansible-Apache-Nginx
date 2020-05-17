#!/bin/bash

#echo "Start Ansible"
sudo yum -y update 
sudo yum -y install epel-release
sudo yum -y install ansible
sudo yum -y install python3
sudo yum -y install python3-pip


# fix the hosts
mkdir -p /root/.ssh
yes | cp -f /vagrant/env/hosts /etc/hosts
yes | cp -f /vagrant/env/ssh_keys/id_rsa* /root/.ssh/
cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys
chmod 600 /root/.ssh/id_rsa*
yes | cp -f /vagrant/env/sshd_config /etc/ssh/
systemctl restart sshd