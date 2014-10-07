$package = 'ncrunch.vs2013'
$file = (Get-ItemProperty "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{F6C17912-1317-485D-A2B6-00A5BE7F00A8}").UninstallString;
Uninstall-ChocolateyPackage $package 'MSI' -file $file


