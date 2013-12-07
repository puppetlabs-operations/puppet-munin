# Class: munin::plugin
#
# This definitions installs and configures Munin plug-ins, but is at
# least slightly versitile.
#
# Parameters:
#  fromname =>
#     so you can use name as "ifstat_eth0" and fromanme to ifstat_
#  plugindest/path => different paths.
#
# Requires:
#   - The munin class
#
define munin::plugin (
  $fromname   = undef,
  $ensure     = present,
  $pluginpath = $munin::plugins_source,
  $plugindest = $munin::plugins_dest,
) {

  if ! defined('::munin') {
    fail('Class[munin] needs to be included before plugins can be managed')
  }

  if $fromname == undef {
    $sourcename = $name
  } else {
    $sourcename = $fromname
  }

  $realensure = $ensure ? {
    present   => link,
    link      => link,
    'present' => link,
    'link'    => link,
    absent    => absent,
    'absent'  => absent,
  }

  file { "${plugindest}/${name}":
    ensure => $realensure,
    target => "${pluginpath}/${sourcename}",
    notify => Service[$munin::node_service],
  }
}
