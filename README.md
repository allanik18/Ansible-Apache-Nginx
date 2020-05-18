# HW_Ansible - practice with Ansible

Ansible is an agentless automation tool that by default manages machines over the SSH protocol.

## Description of HW

1. Run two VM by Vagrant  on Ubuntu and CentOS.
2. Create and run playbook by Ansible that will install Apache for the VM on Ubuntu, install Nginx on CentOS.
3. For the same servers, set up of the simplest files to display in a high-quality web page.
4. Restart the web server.

## Prerequisites

1. Vagrant
2. Ansible
   
## Deployment

1. Copy ssh keys
```bash
$ cp ~/.ssh/id_rsa* env/ssh_keys
```
   
2. Run vagrant up
```bash
$ vagrant up
```
3. Optionally update content of *ansible/index.html*
   
4. Run ansible-playbook
```bash
$ ansible-playbook ansible/hw_playbook.yaml -u root
```
 
## Validation test
1. Check the inventory file
```bash
$ ansible-inventory --list -y

all:
  children:
    apache:
      hosts:
        10.10.0.4: {}
    nginx:
      hosts:
        10.10.0.2: {}
    ungrouped: {}
```
2. Ensure your hosts are accessible
```bash
$ ansible all -m ping -u root

10.10.0.2 | SUCCESS => {
    "changed": false, 
    "ping": "pong"
}
10.10.0.4 | SUCCESS => {
    "changed": false, 
    "ping": "pong"
}
```
3. Check webservers
```bash
$ curl http://10.10.0.4
it works!!!

$ curl http://10.10.0.2
it works!!!
```









