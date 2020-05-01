
# Personal CentOS 8 Build

Ansible configuration for my personal CentOS 8 VMs.

## Usage

### Automatic

Drop an SSH key pair onto a new VM, and run:

```bash
> curl -s https://raw.githubusercontent.com/rkm/personal-centos8/master/install.sh | bash
```

### Manual

Copy & run the `install.sh` script.

## Configuration

See `vars/main.yml` for configurable settings. You should at least change the `username`.

## TODO

- Add travis build
- Test all-repos
- Add usbutils to packages
- Add Python 3.7, 3.8, 3.9-a5
