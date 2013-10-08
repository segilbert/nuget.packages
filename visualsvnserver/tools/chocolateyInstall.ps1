
$packageName = 'visualsvnserver' 
$installerType = 'MSI' 
$url = 'http://www.visualsvn.com/files/VisualSVN-Server-2.7.1.msi' 
$url64 = $url 
$silentArgs = '' 
$validExitCodes = @(0) 

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes