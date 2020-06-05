#!/bin/bash

set -euxo pipefail

PKG=dnf
OS=8

if [ "$(stat ~/.ssh/id_rsa* | grep 0400 | wc -l)" != "2" ]; then
    echo Install ssh keys with correct permissions first!
    exit 1
fi

sudo $PKG -y update && \
sudo $PKG -y install epel-release && \
sudo $PKG -y install ansible tar && \
curl -Ls https://api.github.com/repos/rkm/personal-centos${OS}/tarball > repo.tgz && \
tar xzf repo.tgz && \
pushd rkm-personal-centos${OS}-* && \
ansible-galaxy install -r requirements.yml && \
ansible-playbook -K local.yml && \
popd && \
rm -r rkm-personal-centos${OS}* repo.tgz && \
echo "Initial install complete - A reboot is recommended"
