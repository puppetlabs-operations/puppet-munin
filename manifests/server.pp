# Class: munin::server
#
# This class installs and configures the Munin server
#
# Parameters:
#
# Actions:
#
# Requires:
#   - motd
#
# Sample Usage:
#
class munin::server(
  $server_packages = $munin::params::server_packages,
  $confdir         = $munin::params::confdir,
  $max_graph_jobs  = $processorcount,
) inherits munin::params {

  include motd
  motd::register{ "Munin server": }

  package { $server_packages:
    ensure => present,
  }

  # manage the munin.conf server configuration
  file { "${confdir}/munin.conf":
    owner   => root,
    group   => 0,
    mode    => 644,
    content => template("munin/munin.conf.erb"),
  }

  # realize all munin host declarations
  File <<| tag == 'munin_host' |>>
}
