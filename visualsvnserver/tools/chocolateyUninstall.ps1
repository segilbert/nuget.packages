$packageName = 'visualsvnserver'
$installerType = 'MSI'
$silentArgs = ''

$file = '{421F9DC0-5A07-4F05-91BD-4801714EE08C}'
Uninstall-ChocolateyPackage $package 'MSI' -file $file


