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
  $conf_purge      = true,
) inherits munin::params {

  include motd
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

  file { "${confdir}/munin-conf..d":
    ensure  => directory,
    owner   => root,
    group   => 0,
    mode    => 0755,
    recurse => true,
    purge   => $conf_purge,
  }

  # Realize all of the exported Munin::Host resources
  Munin::Host <<||>>

}
