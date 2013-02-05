# Class: munin::server
#
# This class installs and configures the Munin server
#
# Parameters:
#
# Actions:
#
# Requires:
#   - The munin::params class
#
# Sample Usage:
#
class munin::server(
  $server_packages = $munin::params::server_packages,
  $confdir         = $munin::params::confdir,
) inherits munin::params {

  motd::register{ "Munin server": }

  package { $server_packages:
    ensure => present,
  }

  file { "${confdir}/munin.conf":
    owner   => root,
    group   => 0,
    mode    => 644,
    content => template("munin/munin.conf.erb");
  }

  File <<| tag == 'munin_host' |>>
}
