
$packageName = 'Silverlight4SDK' 
$file = (Get-ItemProperty "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{189AEA94-DAFB-487A-8CEE-F9D3DDE0A748}").UninstallString;

Uninstall-ChocolateyPackage $package 'EXE' -file $file



