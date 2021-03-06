
# xcat

DEPRECATED - New users should use [puppet-profile_xcat](https://github.com/ncsa/puppet-profile_xcat)

---

Configure an xcat master node.

Configure an xcat client node for access from xcat_master

#### Table of Contents

1. [Description](#description)
1. [Dependencies](#dependencies)
1. [Reference](#reference)
2. [Setup - The basics of getting started with xcat](#setup)
    * [What xcat affects](#what-xcat-affects)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)

## Description

Configures the OS settings around an xcat master node. Does not install xcat.

See also: https://github.com/ncsa/xcat-tools

## Reference

### class xcat::master::root (
-    String $sshkey_pub,
-    String $sshkey_priv,
-    String $sshkey_type,
### class xcat::master::postscripts (
-    String $defsnapshot,
-    String $reposerverip,
-    String $install_dir,
### class xcat::client::ssh (
-    String $master_node_ip,
### class xcat (
-    String $network_mgmt,
-    String $network_ipmi,

See also: [REFERENCE.md](REFERENCE.md)

## Dependencies

* https://github.com/ncsa/puppet-sshd
* https://forge.puppet.com/inkblot/ipcalc
* https://forge.puppet.com/sharumpe/tcpwrappers

## Setup

### What xcat affects **OPTIONAL**

* Custom postscripts that use Hiera data in them.


## Usage

...


## Limitations

Supports CentOS/Redhat

