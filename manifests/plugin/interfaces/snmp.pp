define munin::plugin::interfaces::snmp (
  $plugin,
  $interfaces,
){
  $device          = $name
  $destination     = regsubst($plugin, '__', "_${device}_")
  $modified_plugin = regsubst($plugin, '^snmp__', '')

  munin::plugin::interfaces { $destination:
    array_of_interfaces => $interfaces,
    plugin_name         => $modified_plugin,
  }
}
