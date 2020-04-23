#!/bin/bash

sudo yum -y update && \
sudo yum -y install epel-release && \
sudo yum -y install ansible && \
curl -L https://api.github.com/repos/rkm/personal-centos8/tarball > repo.tgz && \
tar xzf repo.tgz && \
cd rkm-personal-centos8* && \
ansible-galaxy install -r requirements.yml && \
ansible-playbook [-v] [--tags <tags>] local.yml
