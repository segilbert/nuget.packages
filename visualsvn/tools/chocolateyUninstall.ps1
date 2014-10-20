$package = 'visualsvn'
$file = (Get-ItemProperty "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{CE3EAFB7-3A12-4214-944E-A6256633AB5B}").UninstallString;
Uninstall-ChocolateyPackage $package 'MSI' -file $file




