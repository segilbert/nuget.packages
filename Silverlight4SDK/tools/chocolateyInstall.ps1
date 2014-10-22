
$packageName = 'Silverlight4SDK'
$installerType = 'EXE' 
$url = 'http://download.microsoft.com/download/F/2/C/F2CFFB78-03CF-4749-A6AE-EF60FB6FB14E/sdk/silverlight_sdk.exe' 
$silentArgs = '/quiet' 

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  
