# @summary Configure an xcat master node
#
# @example
#   include xcat::master
class xcat::master {
    include ::xcat::master::bmc_smtp
    include ::xcat::master::firewall
    include ::xcat::master::nfs
    include ::xcat::master::root
    include ::xcat::master::tcpwrappers
}
