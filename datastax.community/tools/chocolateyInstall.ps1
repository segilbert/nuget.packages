
$packageName = 'datastax.community' 
$installerType = 'MSI' 
$url = 'http://downloads.datastax.com/community/datastax-community-32bit_2.0.1.msi' 
$url64 = 'http://downloads.datastax.com/community/datastax-community-64bit_2.0.1.msi' 
$silentArgs = '/quiet' 
$validExitCodes = @(0) 

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes