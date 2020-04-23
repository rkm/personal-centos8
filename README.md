
# Personal CentOS 8 Build

Ansible configuration for my personal CentOS 8 VMs.

## Usage

### Automatic

```bash
> wget -q -O - https://raw.githubusercontent.com/rkm/personal-centos8/master/install.sh | bash
```

### Manual

```bash
> sudo yum -y install git epel-release ansible && \
git clone https://github.com/rkm/personal-centos8 && \
sudo yum -y remove git && \
cd !$ && \
ansible-galaxy install -r requirements.yml && \
ansible-playbook [-v] [--tags <tags>] local.yml
```

## Configuration

See `vars/main.yml` for configurable settings. You should at least change the `username`.

## TODO

- Add travis build
- Test all-repos
- Add usbutils to packages
- Add Python 3.7, 3.8, 3.9-a5
