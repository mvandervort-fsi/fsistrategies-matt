$key1 = [Microsoft.Win32.RegistryKey]::OpenBaseKey([Microsoft.Win32.RegistryHive]::LocalMachine, [Microsoft.Win32.RegistryView]::Registry64)
$subKey1 = $key1.OpenSubKey("SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI")
$SID = $subKey1.GetValue("LastLoggedOnUserSID")
$key2 = [Microsoft.Win32.RegistryKey]::OpenBaseKey([Microsoft.Win32.RegistryHive]::LocalMachine, [Microsoft.Win32.RegistryView]::Registry64)
$subKey2 = $key2.OpenSubKey("SOFTWARE\Microsoft\IdentityStore\Cache\$SID\IdentityCache\$SID")
$UPN = $subKey2.GetValue("UserName")
Remove-LocalGroupMember –Group "Administrators" –Member "AzureAD\$UPN"
Write-Host ("Script ran without error")