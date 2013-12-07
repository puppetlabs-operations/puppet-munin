# $confname is the name of the configuration to put in the file
# $confs is the hash of env.plugin entries to put
define munin::pluginconf(
  $confs,
  $confname,
) {

  if ! defined('::munin') {
    fail('Class[munin] needs to be included before plugins can be managed')
  }

  file { "${munin::confdir}/plugin-conf.d/${name}":
    content => template('munin/plugin.conf.erb'),
    notify  => Service[$munin::node_service],
    require => Package[$munin::base_packages],
  }
}
