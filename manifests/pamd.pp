# == Class: pam::pamd
#
# Puppet module to manage pam configuration
# This class handles configuration of /etc/pam.d files
# according to selected modules.
#
# === Parameters
#
#  [pam_unix_account]
#  When specified, it allows for customization
#  of pam_unix.so in account type
#  *Requires* pam_unix => true
#  *Optional* defaults to 'required      pam_unix.so broken_shadow'
#
#  [pam_unix_auth]
#  When specified, it allows for customization
#  of pam_unix.so in auth type
#  *Requires* pam_unix => true
#  *Optional* defaults to 'sufficient    pam_unix.so nullok try_first_pass'
#
#  [pam_unix_password]
#  When specified, it allows for customization
#  of pam_unix.so in password type
#  *Requires* pam_unix => true
#  *Optional* defaults to 'sufficient    pam_unix.so md5 shadow nullok try_first_pass use_authtok'
#
#  [pam_unix_session]
#  When specified, it allows for customization
#  of pam_unix.so in session type
#  *Requires* pam_unix => true
#  *Optional* defaults to 'required      pam_unix.so'
#
#  [pam_ldap]
#  If enabled sets up the usage of pam_ldap.so
#  *Conflicts* pam_ldapd
#  *Optional* defaults to false
#
#  [pam_ldap_account]
#  When specified, it allows for customization
#  of pam_ldap.so in account type
#  *Requires* pam_ldap => true
#  *Optional* defaults to '[default=bad success=ok user_unknown=ignore] pam_ldap.so'
#
#  [pam_ldap_auth]
#  When specified it allows for customization
#  of pam_ldap.so in auth type
#  *Requires* pam_ldap => true
#  *Optional* defaults to 'sufficient    pam_ldap.so use_first_pass'
#
#  [pam_ldap_password]
#  When specified it allows for customization
#  of pam_ldap.so in password type
#  *Requires* pam_ldap => true
#  *Optional* defaults to 'sufficient    pam_ldap.so use_authtok'
#
#  [pam_ldap_session]
#  When specified it allows for customization
#  of pam_ldap.so in session type
#  *Requires* pam_ldap => true
#  *Optional* defaults to 'optional      pam_ldap.so'
#
#  [pam_ldapd]
#  If enabled sets up the usage of pam_ldapd.so
#  UNTESTED
#  *Conflicts* pam_ldap
#  *Optional* defaults to false
#
#  [pam_ldapd_account]
#  UNTESTED
#  *Optional* defaults to false
#
#  [pam_ldapd_auth]
#  UNTESTED
#  *Optional* defaults to false
#
#  [pam_ldapd_password]
#  UNTESTED
#  *Optional* defaults to false
#
#  [pam_ldapd_session]
#  UNTESTED
#  *Optional* defaults to false
#
#  [pam_sss]
#  If enabled sets up the usage of pam_sss.so
#  *Optional* defaults to false
#
#  [pam_sss_account]
#  When specified it allows for customization
#  of pam_sss.so in account type
#  *Requires* pam_sss => true
#  *Optional* defaults to '[default=bad success=ok user_unknown=ignore] pam_sss.so'
#
#  [pam_sss_auth]
#  When specified it allows for customization
#  of pam_sss.so in auth type
#  *Requires* pam_sss => true
#  *Optional* defaults to 'sufficient    pam_sss.so use_first_pass'
#
#  [pam_sss_password]
#  When specified it allows for customization
#  of pam_sss.so in password type
#  *Requires* pam_sss => true
#  *Optional* defaults to 'sufficient    pam_sss.so use_authtok'
#
#  [pam_sss_session]
#  When specified it allows for customization
#  of pam_sss.so in session type
#  *Requires* pam_sss => true
#  *Optional* defaults to 'optional      pam_sss.so'
#
#  [pam_tally]
#  UNTESTED
#  *Optional* defaults to false
#
#  [pam_tally_account]
#  UNTESTED
#  *Optional* defaults to false
#
#  [pam_tally_auth]
#  UNTESTED
#  *Optional* defaults to false
#
#  [pam_tally2]
#  UNTESTED
#  *Optional* defaults to false
#
#  [pam_tally2_account]
#  UNTESTED
#  *Optional* defaults to false
#
#  [pam_tally2_auth]
#  UNTESTED
#  *Optional* defaults to false
#
#  [pam_cracklib]
#  UNTESTED
#  *Optional* defaults to false
#
#  [pam_cracklib_password]
#  UNTESTED
#  *Optional* defaults to false
#
#  [pam_mkhomedir]
#  UNTESTED
#  *Optional* defaults to false
#
#  [pam_mkhomedir_session]
#  UNTESTED
#  *Optional* defaults to false
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
#   - Debian:   5.0 (etch) / 6.0 (squeeze) / 7.0 (wheezy)
#   - Redhat:   5.x        / 6.x
#   - CentOS:   5.x        / 6.x
#   - OVS:
#   - OpenSuSE: 12.x
#   - SLES:     11.x
#
# === Examples
#
# class { 'pam::pamd':
#   pam_ldap => true,
# }
#
# class { 'pam::pamd':
#   pam_ldap          => true,
#   pam_ldap_account  => '[success=1 default=ignore] pam_ldap.so',
#   pam_ldap_password => '[success=1 user_unknown=ignore default=die] pam_ldap.so use_authtok try_first_pass'
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
class pam::pamd (
  $pam_unix_account      = false,
  $pam_unix_auth         = false,
  $pam_unix_password     = false,
  $pam_unix_session      = false,

  $pam_ldap              = false,
  $pam_ldap_account      = false,
  $pam_ldap_auth         = false,
  $pam_ldap_password     = false,
  $pam_ldap_session      = false,

  $pam_ldapd             = false,
  $pam_ldapd_account     = false,
  $pam_ldapd_auth        = false,
  $pam_ldapd_password    = false,
  $pam_ldapd_session     = false,

  $pam_sss               = false,
  $pam_sss_account       = false,
  $pam_sss_auth          = false,
  $pam_sss_password      = false,
  $pam_sss_session       = false,
  $sssd_conf             = false,

  $pam_tally             = false,
  $pam_tally_account     = false,
  $pam_tally_auth        = false,

  $pam_tally2            = false,
  $pam_tally2_account    = false,
  $pam_tally2_auth       = false,

  $pam_cracklib          = false,
  $pam_cracklib_password = false,

  $pam_mkhomedir         = false,
  $pam_mkhomedir_session = false,

  $enable_motd           = false) {

  include pam::params

  if($enable_motd) {
    motd::register { 'pam::pamd': }
  }

  case $pam_unix_account {
    false:   { $pam_unix_account_set = $pam::params::pam_unix_account }
    default: { $pam_unix_account_set = $pam_unix_account }
  }

  case $pam_unix_auth {
    false:   { $pam_unix_auth_set = $pam::params::pam_unix_auth }
    default: { $pam_unix_auth_set = $pam_unix_auth }
  }

  case $pam_unix_password {
    false:   { $pam_unix_password_set = $pam::params::pam_unix_password }
    default: { $pam_unix_password_set = $pam_unix_password }
  }

  case $pam_unix_session {
    false:   { $pam_unix_session_set = $pam::params::pam_unix_session }
    default: { $pam_unix_session_set = $pam_unix_session }
  }

  if($pam_ldap) {

    #Class['ldap'] -> Class['pam::pamd']

    if($pam::params::package_pam_ldap) {
      package { $pam::params::package_pam_ldap:
        ensure => present,
      }
    }

    case $pam_ldap_account {
      false:   { $pam_ldap_account_set = $pam::params::pam_ldap_account }
      default: { $pam_ldap_account_set = $pam_ldap_account }
    }

    case $pam_ldap_auth {
      false:   { $pam_ldap_auth_set = $pam::params::pam_ldap_auth }
      default: { $pam_ldap_auth_set = $pam_ldap_auth }
    }

    case $pam_ldap_password {
      false:   { $pam_ldap_password_set = $pam::params::pam_ldap_password }
      default: { $pam_ldap_password_set = $pam_ldap_password }
    }

    case $pam_ldap_session {
      false:   { $pam_ldap_session_set = $pam::params::pam_ldap_session }
      default: { $pam_ldap_session_set = $pam_ldap_session }
    }

  }

  if($pam_ldapd) {

    case $pam_ldapd_account {
      false:   { $pam_ldapd_account_set = $pam::params::pam_ldapd_account }
      default: { $pam_ldapd_account_set = $pam_ldapd_account }
    }

    case $pam_ldapd_auth {
      false:   { $pam_ldapd_auth_set = $pam::params::pam_ldapd_auth }
      default: { $pam_ldapd_auth_set = $pam_ldapd_auth }
    }

    case $pam_ldapd_password {
      false:   { $pam_ldapd_password_set = $pam::params::pam_ldapd_password }
      default: { $pam_ldapd_password_set = $pam_ldapd_password }
    }

    case $pam_ldapd_session {
      false:   { $pam_ldapd_session_set = $pam::params::pam_ldapd_session }
      default: { $pam_ldapd_session_set = $pam_ldapd_session }
    }

  }

  if($pam_sss) {

    package { 'sssd':
      ensure => present,
    }

    file { '/etc/sssd/sssd.conf':
      ensure => file,
      source => $sssd_conf,
      owner => 'root',
      group => 'root',
      mode => 0600,
      require => Package['sssd'],
    }

    service { 'sssd':
      ensure  => running,
      enable  => true,
      require => File['/etc/sssd/sssd.conf'],
    }

    case $pam_sss_account {
      false:   { $pam_sss_account_set = $pam::params::pam_sss_account }
      default: { $pam_sss_account_set = $pam_sss_account }
    }

    case $pam_sss_auth {
      false:   { $pam_sss_auth_set = $pam::params::pam_sss_auth }
      default: { $pam_sss_auth_set = $pam_sss_auth }
    }

    case $pam_sss_password {
      false:   { $pam_sss_password_set = $pam::params::pam_sss_password }
      default: { $pam_sss_password_set = $pam_sss_password }
    }

    case $pam_sss_session {
      false:   { $pam_sss_session_set = $pam::params::pam_sss_session }
      default: { $pam_sss_session_set = $pam_sss_session }
    }

  }

  if($pam_tally) {

    case $pam_tally_account {
      false:   { $pam_tally_account_set = $pam::params::pam_tally_account }
      default: { $pam_tally_account_set = $pam_tally_account }
    }

    case $pam_tally_auth {
      false:   { $pam_tally_auth_set = $pam::params::pam_tally_auth }
      default: { $pam_tally_auth_set = $pam_tally_auth }
    }

  }

  if($pam_tally2) {

    case $pam_tally2_account {
      false:   { $pam_tally2_account_set = $pam::params::pam_tally2_account }
      default: { $pam_tally2_account_set = $pam_tally2_account }
    }

    case $pam_tally2_auth {
      false:   { $pam_tally2_auth_set = $pam::params::pam_tally2_auth }
      default: { $pam_tally2_auth_set = $pam_tally2_auth }
    }

  }

  if($pam_cracklib) {

    case $pam_cracklib_password {
      false:   { $pam_cracklib_password_set = $pam::params::pam_cracklib_password }
      default: { $pam_cracklib_password_set = $pam_cracklib_password }
    }

  }

  if($pam_mkhomedir) {

    if($pam::params::pam_mkhomedir_package) {
      package { $pam::params::pam_mkhomedir_package:
        ensure => present
      }
    }

    case $pam_mkhomedir_session {
      false:   { $pam_mkhomedir_session_set = $pam::params::pam_mkhomedir_session }
      default: { $pam_mkhomedir_session_set = $pam_mkhomedir_session }
    }

  }

  case $::osfamily {

    'Debian' : {
      include pam::pamd::debian
    }

    'RedHat' : {
      include pam::pamd::redhat
    }

    'Suse' : {
      include pam::pamd::sles
    }

    default: {
      fail("Operating system ${::operatingsystem} not supported")
    }

  }

}

