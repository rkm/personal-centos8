# Personal CentOS 8 Build

Ansible configuration for my personal CentOS 8 VMs.

This is based on a fresh VirtualBox VM based on the `CentOS-8.1.1911-x86_64-boot.iso` image.

It currently requires two network adapters to be present

- `enp0s3` - NAT adapter
- `enp0s8` - Host-only adapter

The 3/8 naming seems to happen by default when you add the adapters in VirtualBox.

## Usage

### Automatic

Drop an SSH key pair onto a new VM, and run:

```bash
> curl -Ls https://raw.githubusercontent.com/rkm/personal-centos8/master/install.sh | bash
```

### Manual

Copy & run the `install.sh` script.

## Configuration

See `vars/main.yml` for configurable settings. You should at least change the `username`.

## TODO

- Add a "no root" / shared system mode
- Add packages for building rpms
- add maven
- use alternatives instead of setting symlinks manually
- `rustup update` -> "installing" in stdout
- `rustup component add rustfmt --toolchain stable-x86_64-unknown-linux-gnu`
- Add a private list of repos to fetch
- Add a task to run fetch_all on boot
