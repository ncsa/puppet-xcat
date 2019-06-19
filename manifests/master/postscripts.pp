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
    String $install_dir,
) {

    $file_defaults = {
        owner => 'root',
        group => 'root',
        mode  => '0755',
    }


    # What will be installed
    $file_data = {
        $install_dir => {
            ensure => 'directory',
        },
        "${install_dir}/os_updates" => {
            ensure  => 'file',
            content => epp( 'xcat/master/postscripts/os_updates.epp' ),
            require => File[ $install_dir ],
        },
    }

    # Realize 
    ensure_resources( 'file', $file_data, $file_defaults )
}
