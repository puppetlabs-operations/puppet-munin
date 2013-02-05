#
# Use to install a pacific dir of modules from the module path:
#
# munin::plugins::install{ 'zfs': }
#
# and all the ZFS modules will be installed under the munin plugin
# path.
#
define munin::plugin::install(
  $source        = undef,
  $plugin_subdir = 'munin',
) {

  if ! defined('::munin') {
    fail('You must declare the munin class before using this defined resource type')
  }

  # have to do this, incase $name isn't available at define time.
  if $source == undef {
    $pluginsource = "puppet:///modules/${caller_module_name}/${plugin_subdir}/${name}"
  } else {
    $pluginsource = $source
  }

  # install the files, then use them.
  file { "${munin::plugins_source}/${name}":
    ensure  => directory,
    recurse => true,
    owner   => 'root',
    group   => '0',
    mode    => '0755',
    source  => $pluginsource,
    require => Package[$munin::base_packages],
  }

}
