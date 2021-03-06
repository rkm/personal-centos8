#!/usr/bin/env bash

set -euxo pipefail

PKG=dnf
OS=8

if ! compgen -G  ~/.ssh/id_* > /dev/null && ! ssh-add -l &> /dev/null ; then
    echo Error: Need an ssh key to continue
    exit 1
fi

sudo $PKG -y update
sudo $PKG -y install \
    epel-release \
    python3-dnf \
    python36 \
    tar \
    wget \
&& :

cd

wget https://bootstrap.pypa.io/virtualenv.pyz
python3 virtualenv.pyz -ppython3.6 --system-site-packages venv_bootstrap
./venv_bootstrap/bin/pip install --upgrade ansible

# NOTE(rkm 2021-05-04) Temp hack until Rocky is recognised as a RedHat distro
if [ -f /etc/rocky-release ]; then
    sed -i "s/AlmaLinux']/AlmaLinux', \'Rocky\']/" venv_bootstrap/lib/python3.6/site-packages/ansible/module_utils/facts/system/distribution.py
fi

curl -Ls https://api.github.com/repos/rkm/personal-centos${OS}/tarball > repo.tgz
tar xzf repo.tgz

pushd rkm-personal-centos${OS}-*

../venv_bootstrap/bin/ansible-galaxy install -r requirements.yml
../venv_bootstrap/bin/ansible-playbook -v -K local.yml --tags boot,login

popd

rm -r ./rkm-personal-centos${OS}* repo.tgz ./venv_bootstrap virtualenv.pyz

set +x; echo "Initial install complete - A reboot is recommended"
