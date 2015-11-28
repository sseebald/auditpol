define audit::policy (
    $policy = $name,
    $success,
    $failure,
  ) {

  validate_bool($success)
  validate_bool($failure)

  if $success == "true" and $failure == "false" {
    exec { $policy:
      command  => "auditpol.exe /set /subcategory:\"$policy\" /failure:'No Auditing' /success:Enable",
      onlyif   => "if ($(auditpol.exe /get /subcategory:\"$policy\" /r).split(',')[11] -eq 'Success') { exit 1 }",
      path     => 'C:\Windows\System32',
      provider => powershell,
    }
  }
  elsif $failure == "true" and $success == "false" {
    exec { $policy:
      command => "auditpol.exe /set /subcategory:\"$policy\" /failure:Enable /success:'No Auditing'",
      onlyif  => "if ($(auditpol.exe /get /subcategory:\"$policy\" /r).split(',')[11] -eq 'No Auditing') { exit 1 }",
      path    => 'C:\Windows\System32',
      provider => powershell,
    }
  }
  else {     
    exec { $policy:
      command => "auditpol.exe /set /subcategory:\"$policy\" /failure:Enable /success:Enable",
      onlyif  => "if ($(auditpol.exe /get /subcategory:\"$policy\" /r).split(',')[11] -eq 'Success and Failure') { exit 1 }",
      path    => 'C:\Windows\System32',
      provider => powershell,
    }
  }
}
