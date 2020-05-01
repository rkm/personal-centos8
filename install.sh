#!/bin/bash

if [ "$(stat ~/.ssh/id_rsa* | grep 0400 | wc -l)" != "2" ]; then
    echo Install ssh keys with correct permissions first!
    exit 1
fi

sudo dnf -y update && \
sudo dnf -y install epel-release && \
sudo dnf -y install ansible tar && \
curl -L https://api.github.com/repos/rkm/personal-centos8/tarball > repo.tgz && \
tar xzf repo.tgz && \
pushd rkm-personal-centos8-* && \
ansible-galaxy install -r requirements.yml && \
ansible-playbook local.yml && \
popd && \
rm -r rkm-personal-centos8* repo.tgz
