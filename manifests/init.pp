# == Class: pam
#
# Puppet module to manage pam configuration
#
#
# === Parameters
#
#  []
#    **Required**
# 
#  [enable_motd]
#    Use motd to report the usage of this module.
#    *Requires*: https://github.com/torian/puppet-motd.git
#    *Optional* (defaults to false)
#    
#  [ensure]
#    *Optional* (defaults to 'present')
#
#
# == Tested/Works on:
#   - Debian: 5.0   / 6.0   /
#
#
# === Examples
#
# class { 'pam':
#	
#	
# }
#
# class { 'pam::pamd':
#	
#	
#	
#	
# }
#
#
# === Authors
#
# Emiliano Castagnari ecastag@gmail.com (a.k.a. Torian)
#
#
# === Copyleft
#
# Copyleft (C) 2012 Emiliano Castagnari ecastag@gmail.com (a.k.a. Torian)
#
#
class pam(
  $enable_motd = false,
  $ensure      = present) {
  
  include pam::params
  
  package { $pam::params::packages:
    ensure => $ensure
  }

  file { $pam::params::prefix_pamd:
    ensure => present,
    owner  => $pam::params::owner,
    group  => $pam::params::group,
    mode   => 0755,
  }

}
