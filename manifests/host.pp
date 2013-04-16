define munin::host (
  $export_conf_dir = "/etc/munin/munin-conf.d",
  $address         = $ipaddress,
  $use_node_name   = 'yes',
){

  file { "${export_conf_dir}/${name}":
    content => template('munin/munin-host.conf.erb'),
    ensure  => present,
  }
}
