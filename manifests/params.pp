# Class: munin::params
#
# This class contains the parameter for the Munin module
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class munin::params {

  case $::osfamily {
    'darwin': {
      $confdir        = '/opt/local/etc/munin'
      $base_packages  = 'munin'
      $extra_packages = undef
      $plugins_source = '/opt/local/usr/share/munin/plugins'
      $plugins_dest   = '/opt/local/etc/munin/plugins'
      $plugins_conf   = '/opt/local/etc/munin/plugin-conf.d/plugins.conf'
      $owner          = 'munin'
      $group          = 'wheel'
      $log_file       = '/opt/local/var/log/munin/munin-node.log'
      $pid_file       = '/opt/local/var/run/munin/munin-node.pid'
      $node_service   = 'org.macports.munin-node'
      $node_config    = '/opt/local/etc/munin/munin-node.conf'
      $postfixlog     = 'mail.log'
    }
    'freebsd': {
      $confdir         = '/usr/local/etc/munin'
      $log_file        = '/var/log/munin/munin-node.log'
      $pid_file        = '/var/run/munin/munin-node.pid'
      $owner          = 'munin'
      $group           = 'wheel'
      $base_packages   = 'sysutils/munin-node'
      $extra_packages  = undef
      $server_packages = 'sysutils/munin-master'
      $plugins_source  = '/usr/local/share/munin/plugins'
      $plugins_dest    = '/usr/local/etc/munin/plugins'
      $plugins_conf    = '/usr/local/etc/munin/plugin-conf.d/plugins.conf'
      $node_service    = 'munin-node'
      $node_config     = '/usr/local/etc/munin/munin-node.conf'
      $postfixlog      = 'maillog'
    }
    'Solaris': {
      $confdir        = '/etc/opt/csw/munin'
      $log_file       = '/var/opt/csw/munin/log/munin-node.log'
      $pid_file       = '/var/opt/csw/munin/run/munin-node.pid'
      $owner          = 'munin'
      $group          = 'root'
      $base_packages  = 'CSWmunin-node'
      $extra_packages = undef
      $plugins_source = '/opt/csw/libexec/munin/plugins/'
      $plugins_dest   = '/etc/opt/csw/munin/plugins'
      $plugins_conf   = '/etc/opt/csw/munin/plugin-conf.d/plugins.conf'
      $node_service   = 'cswmuninnode'
      $node_config    = '/etc/opt/csw/munin/munin-node.conf'
      $postfixlog     = 'mail.log'
    }
    'debian': {
      $confdir         = '/etc/munin'
      $log_file        = '/var/log/munin/munin-node.log'
      $pid_file        = '/var/run/munin/munin-node.pid'
      $owner           = 'munin'
      $group           = 'root'
      $base_packages   = 'munin-node'
      $extra_packages  = 'munin-plugins-extra'
      $server_packages = 'munin'
      $plugins_source  = '/usr/share/munin/plugins'
      $plugins_dest    = '/etc/munin/plugins'
      $plugins_conf    = '/etc/munin/plugin-conf.d/plugins.conf'
      $node_service    = 'munin-node'
      $node_config     = '/etc/munin/munin-node.conf'
      $postfixlog      = 'mail.log'
    }
    'openbsd': {
      $confdir        = '/etc/munin'
      $log_file       = '/var/log/munin/munin-node.log'
      $pid_file       = '/var/run/munin/munin-node.pid'
      $owner          = '_munin'
      $group          = 'wheel'
      $base_packages  = 'munin-node'
      $plugins_source = '/usr/local/libexec/munin/plugins/'
      $plugins_dest   = '/etc/munin/plugins'
      $plugins_conf   = '/etc/munin/plugin-conf.d/plugins.conf'
      $node_service   = 'munin_node'
      $node_config    = '/etc/munin/munin-node.conf'
      $postfixlog     = 'mail.log'
    }
    default: {
      $confdir        = '/etc/munin'
      $log_file       = '/var/log/munin/munin-node.log'
      $pid_file       = '/var/run/munin/munin-node.pid'
      $owner          = 'munin'
      $group          = 'root'
      $base_packages  = 'munin-node'
      $plugins_source = '/usr/share/munin/plugins'
      $plugins_dest   = '/etc/munin/plugins'
      $plugins_conf   = '/etc/munin/plugin-conf.d/plugins.conf'
      $node_service   = 'munin-node'
      $node_config    = '/etc/munin/munin-node.conf'
      $postfixlog     = 'mail.log'
    }
  }
}
