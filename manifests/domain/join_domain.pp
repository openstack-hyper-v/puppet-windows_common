  #
  # Define: windows_common::join_ad_domain
  # Join an Active Directory Domain
  #
  define join_ad_domain ( $::domain_user, $::domain_passwd,){
    exec { 'join_domain':
      path    => $::path,
      command => "powershell.exe -executionpolicy remotesigned -Command Add-Computer -DomainName ${name} -credential (New-Object System.Management.Automation.PSCredential ${name}\\${::domain_user},(ConvertTo-SecureString \"${::domain_passwd}\" -AsPlainText -Force)) -Restart",
#     unless  => 'powershell.exe -executionpolicy remotesigned -Command (Get-ComputerInfo).IsDomainJoined',
#     notify  => Exec['reboot-windows'],
    }
  }

