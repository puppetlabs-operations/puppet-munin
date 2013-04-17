# $device == the name or address of the device
# $name   == the name of the plugin ( snmp__uptime )

define munin::plugin::snmp (
  $plugin,
){
  $device      = $name
  $destination = regexp($plugin, '__', "_${device}_")

  munin::plugin { $destination:
    fromname => $plugin
  }

}
