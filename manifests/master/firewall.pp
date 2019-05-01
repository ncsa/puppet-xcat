# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include xcat::master::firewall
class xcat::master::firewall {
}
class adm::firewall {

  ## IPTABLES - 
  ##  - limit access to external services
  ##    - cerberus SSH access only
  $ncsa_cerberus = ['141.142.148.5', '141.142.236.23', '141.142.148.24', '141.142.236.22']
  if ( $interface_extl ) {
    each($ncsa_cerberus) | $index, $value | {
      firewall { "0022 allow ssh connections from cerberus $value on EXT network via $interface_extl":
        proto => 'tcp',
        dport => '22',
        source => $value,
        iniface => $interface_extl,
        action => 'accept',
        provider => 'iptables',
      }
    }
  }


  ##  - No restriction on mgmt, srvc networks
  if ( $interface_mgmt ) {
    firewall { "0022 drop ssh connections from MGMT network via $interface_mgmt":
      proto => 'tcp',
      dport => '22',
      iniface => $interface_mgmt,
      action => 'drop',
      provider => 'iptables',
    }
    firewall { "9990 accept all from MGMT network via $interface_mgmt":
      proto => 'all',
      iniface => $interface_mgmt,
      action => 'accept',
    }
  }
  if ( $interface_srvc ) {
    firewall { "0022 drop ssh connections from SVC network via $interface_srvc":
      proto => 'tcp',
      dport => '22',
      iniface => $interface_srvc,
      action => 'drop',
      provider => 'iptables',
    }
    firewall { "9990 accept all from SVC network via $interface_srvc":
      proto => 'all',
      iniface => $interface_srvc,
      action => 'accept',
    }
  }

}
