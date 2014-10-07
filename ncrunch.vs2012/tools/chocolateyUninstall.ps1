$package = 'ncrunch.vs2012'
$file = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{5A1897E2-83E0-4C6C-80F0-85CE6E6D9305}").UninstallString;
Uninstall-ChocolateyPackage $package 'MSI' -file $file


