
$packageName = 'visualsvn' 
$installerType = 'MSI' 
$url = 'http://www.visualsvn.com/files/VisualSVN-3.5.1.msi' 
$url64 = $url 
$silentArgs = '/quiet' 
$validExitCodes = @(0) 

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes