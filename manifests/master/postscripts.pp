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
    String $defsnapshot,
    String $reposerverip,
) {

    # local variables
    $ps_dir = '/install/postscripts'

    $file_defaults = {
        owner => 'root',
        group => 'root',
        mode  => '0755',
    }

    # scripts from templates
    file {
        "${ps_dir}/yum_repos":
            ensure  => 'file',
            content => epp( 'xcat/master/postscripts/yum_repos.epp' ),
        ;
        default: * => $file_defaults ;
    }
}
