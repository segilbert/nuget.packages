$package = 'datastax.community'
$file = (Get-ItemProperty "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{147BC00A-5C98-421E-816E-7C51E924B5E0}").UninstallString;
Uninstall-ChocolateyPackage $package 'MSI' -file $file


