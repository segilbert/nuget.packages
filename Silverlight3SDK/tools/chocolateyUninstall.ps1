
$packageName = 'Silverlight3SDK' 
$file = (Get-ItemProperty "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{2012098D-EEE9-4769-8DD3-B038050854D4}").UninstallString;

Uninstall-ChocolateyPackage $package 'EXE' -file $file


