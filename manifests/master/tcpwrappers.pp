# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include xcat::master::tcpwrappers
class xcat::master::tcpwrappers {

    $mgmt_network = lookup( 'xcat::network_mgmt', String[11] )
    $ipmi_network = lookup( 'xcat::network_ipmi', String[11] )

    tcpwrappers::allow { 'allow all from xcat mgmt network':
        service => 'ALL',
        address => $mgmt_network,
    }

    tcpwrappers::allow { 'allow all from xcat ipmi network':
        service => 'ALL',
        address => $ipmi_network,
    }

}
