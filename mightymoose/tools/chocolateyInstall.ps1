$packageName = 'mightmoose' 
$installerType = 'EXE' 
$url = 'http://continuoustests.com/ContinuousTests-v1.0.46.exe'  
$url64 = $url 
$silentArgs = '/SILENT' 
$validExitCodes = @(0) 

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes
