$CurrentWin10 = "10.0.19045"
$CurrentWin11 = "10.0.22631"

$GetOS = Get-ComputerInfo -property OsVersion 

$OSversion = $GetOS.OsVersion

if ($OSversion -match "10.0.1") { if ($OSversion -lt $CurrentWin10) { Write-Output "OS version currently on $OSversion" exit 1 } }

if ($OSversion -match "10.0.2") { if ($OSversion -lt $CurrentWin11) { Write-Output "OS version currently on $OSversion" exit 1 } }

$lastupdate = Get-HotFix | Sort-Object -Property InstalledOn | Select-Object -Last 1 -ExpandProperty InstalledOn 

$Date = Get-Date

$diff = New-TimeSpan -Start $lastupdate -end $Date 

$days = $diff.Days

if ($days -ge 40) { Write-Output "Troubleshooting Updates - Last update was $days days ago" exit 1 } else{ Write-Output "Windows Updates ran $days days ago" exit 0 }