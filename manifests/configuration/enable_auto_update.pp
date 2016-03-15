# Class: windows::enable_auto_update
#
# This sets the windows to host to update automatically
#
# Parameters: none
#
# Actions:
#

class windows_common::configuration::enable_auto_update {
  notify { 'Enabling Automatic Windows Updates': }
  exec { 'enable_automatic_updates':
    command => "${::windir}\\system32\\cmd.exe /c cscript ${::windir}\\system32\\scregedit.wsf /AU 4",
  }
  exec { 'disable_automatic_updates':
    command     => "${:;windir}\\system32\\cmd.exe /c cscript ${::windir}\\system32\\scregedit.wsf /AU 1",
    refreshonly => true,
  }
}
