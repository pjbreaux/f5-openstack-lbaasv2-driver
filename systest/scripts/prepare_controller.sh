#!/usr/bin/env bash

set -ex

OS_CONTROLLER_IP=10.190.24.130
sudo -E chown -Rf jenkins:jenkins /home/jenkins/container_mailbox
bash -c "echo [hosts] > /home/jenkins/container_mailbox/ansible_conf.ini"
bash -c "echo \"${OS_CONTROLLER_IP} ansible_ssh_common_args='-o StrictHostKeyChecking=no' host_key_checking=False ansible_connection=ssh ansible_ssh_user=ubuntu ansible_ssh_private_key_file=/root/id_rsa\" >> /home/jenkins/container_mailbox/ansible_conf.ini"
