#!/bin/bash

component=$1
sudo dnf install ansible -y
ansible-pull -U https://github.com/DEVOPSPRACTICEDEMO/ansible-roboshop-roles-tf.git -e component=$1 main.yaml