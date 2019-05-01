# @summary Install postscripts from templates using hiera data 
#
# @param defsnapshot - String
#                      default snapshot identifier for general repos (CentOS, EPEL, Puppet, etc.)
#
# @param reposerverip - String
#                       mgmt IP of site server with current repos
#
# @example
#   include xcat::master::postscripts
class xcat::master::postscripts (
   String $defsnapshot, # default snapshot ID for general repos (CentOS, EPEL, Puppet, etc.)
   String $reposerverip, # mgmt IP of site server with current repos (CentOS, EPEL, Puppet, etc.)
) {

    # local variables
    $base_path = '/install/postscripts'

    $file_defaults = {
        owner => 'root',
        group => 'root',
        mode  => '0755',
    }

    # scripts from templates
    file {
        "${base_path}/yum_repos":
            content => epp( "xcat/master/postscripts/yum_repos.epp" ),
            ensure  => 'file',
            require => File[$base_path],
        ;
        default: * => $file_defaults ;
    }
}
