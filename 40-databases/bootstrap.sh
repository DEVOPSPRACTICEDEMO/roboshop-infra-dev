#!/bin/bash

dnf install ansible -y
ansible-pull -U  # Need to give the repo URL of ansible so first create ansible repo