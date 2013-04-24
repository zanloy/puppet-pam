
class pam::params {

  case $::operatingsystem {
    
    debian: {
      $packages    = [ 'libpam-ldap' ]
      $prefix_pamd = '/etc/pam.d'
      $owner       = 'root'
      $group       = 'root'

      $pam_ldap_account      = "[default=bad success=ok user_unknown=ignore] pam_ldap.so"
      $pam_ldap_auth         = "sufficient    pam_ldap.so use_first_pass" 
      $pam_ldap_password     = "sufficient    pam_ldap.so use_authtok"
      $pam_ldap_session      = "optional      pam_ldap.so"

      $pam_ldapd_account     = false
      $pam_ldapd_auth        = false
      $pam_ldapd_password    = false
      $pam_ldapd_session     = false

      $pam_tally_account     = "required      pam_tally.so"
      $pam_tally_auth        = "required      pam_tally.so deny=3 onerr=fail"

      $pam_tally2_account    = "required      pam_tally2.so"
      $pam_tally2_auth       = "required      pam_tally2.so"

      $pam_cracklib_password = "requisite     pam_cracklib.so try_first_pass retry=3 minlen=9 dcredit=-1"

      $pam_mkhomedir_session = "requisite     pam_mkhomedir.so skel=/etc/skel/ umask=0022"

    }

    redhat: {
      $packages    = [ 'pam' ]
      $prefix_pamd = '/etc/pam.d'
      $owner       = 'root'
      $group       = 'root'

      $pam_ldap_account      = "[default=bad success=ok user_unknown=ignore] pam_ldap.so"
      $pam_ldap_auth         = "sufficient    pam_ldap.so use_first_pass" 
      $pam_ldap_password     = "sufficient    pam_ldap.so use_authtok"
      $pam_ldap_session      = "optional      pam_ldap.so"

      $pam_ldapd_account     = false
      $pam_ldapd_auth        = false
      $pam_ldapd_password    = false
      $pam_ldapd_session     = false

      $pam_tally_account     = "required      pam_tally.so"
      $pam_tally_auth        = "required      pam_tally.so deny=3 onerr=fail"

      $pam_tally2_account    = "required      pam_tally2.so"
      $pam_tally2_auth       = "required      pam_tally2.so"

      $pam_cracklib_password = "requisite     pam_cracklib.so try_first_pass retry=3 minlen=9 dcredit=-1"

      $pam_mkhomedir_session = "requisite     pam_mkhomedir.so skel=/etc/skel/ umask=0022"


    }
    
    default: {
      fail("Operating system ${::operatingsystem} not supported")
    }
    
  }

}
