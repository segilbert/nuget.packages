$package = 'ncrunch.vs2012'
#$file = (Get-ItemProperty "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{421F9DC0-5A07-4F05-91BD-4801714EE08C}").UninstallString;
$file = '{421F9DC0-5A07-4F05-91BD-4801714EE08C}'
Uninstall-ChocolateyPackage $package 'MSI' -file $file


