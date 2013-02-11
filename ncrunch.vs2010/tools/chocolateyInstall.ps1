$packageName = 'ncrunch.vs2010' 
$installerType = 'MSI' 
$url = 'http://downloads.ncrunch.net/NCrunch_VS2010_1.44.0.11.msi' download url
$url64 = $url 
$silentArgs = '/quiet' 
$validExitCodes = @(0) 

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes
