define munin::host (
  $ensure        = present,
  $node_address  = $ipaddress,
  $use_node_name = 'yes', # 'yes' or 'no'
  $conf_d        = '/etc/munin/munin-conf.d',
){

  file { "Munin configuration for ${name}":
    ensure  => $ensure,
    path    => "${conf_d}/${name}.conf",
    content => template('munin/munin-host.conf.erb'),
  }
}
