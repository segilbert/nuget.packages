
$packageName = 'Silverlight3SDK'
$installerType = 'EXE' 
$url = 'http://download.microsoft.com/download/F/5/1/F516C774-3BD1-40E0-BB51-2CDC9FD8D63A/silverlight_sdk.exe' 
$silentArgs = '/quiet' 

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  
