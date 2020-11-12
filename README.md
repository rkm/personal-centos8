# Personal CentOS 8 Build

Ansible configuration for my personal CentOS 8 VMs.

This is based on a fresh VirtualBox VM based on the `CentOS-8.1.1911-x86_64-boot.iso` image.

It currently requires two network adapters to be present

-   `enp0s3` - NAT adapter
-   `enp0s8` - Host-only adapter

The 3/8 naming seems to happen by default when you add the adapters in VirtualBox.

## Usage

### Automatic

Drop an SSH key pair onto a new VM, or use ssh-agent, and run:

```bash
> curl -Ls https://raw.githubusercontent.com/rkm/personal-centos8/master/install.sh | bash
```

### Manual

Copy & run the `install.sh` script.

## Configuration

See `vars/main.yml` for configurable settings. You should at least change the `username`.

## TODO

-   Add a "no root" / shared system mode
-   use alternatives instead of setting symlinks manually
-   `rustup update` -> "installing" in stdout
-   `rustup component add rustfmt --toolchain stable-x86_64-unknown-linux-gnu`
-   Add a list of private repos to fetch
-   Investigate running some tasks in parallel / with [async](https://devops.stackexchange.com/questions/3860/is-there-a-way-to-run-with-items-loops-in-parallel-in-ansible)
-   git-lfs (from source?)
-   mongodb client only
-   mk_venv
-   terraform
-   Replace azure aliases with tf scripts
-   Need to remove old dotnet sdks/runtimes
-   Replace ansible dnf install with release repo
-   Move dev -> workspace (check dotfiles as well)
-   Allow multiple versions of dotnet
