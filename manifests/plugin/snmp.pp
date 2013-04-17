# $device == the name or address of the device
# $name   == the name of the plugin ( snmp__uptime )

define munin::plugin::snmp (
  $device = undef,
  $plugin,
){

  if $device == undef {
    $devicename = $name
  } else {
    $devicename = $device
  }

  $devicename  = $name
  $destination = regsubst($plugin, '__', "_${devicename}_")

  munin::plugin { $destination:
    fromname => $plugin
  }

}
