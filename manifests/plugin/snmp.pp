# $device == the name or address of the device
# $name   == the name of the plugin ( snmp__uptime )

define munin::plugin::snmp (
  $plugin,
){
  $devicename  = $name
  $destination = regsubst($plugin, '__', "_${devicename}_")

  munin::plugin { $destination:
    fromname => $plugin
  }
}
