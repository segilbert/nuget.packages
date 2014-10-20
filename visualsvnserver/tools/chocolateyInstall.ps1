
$packageName = 'visualsvnserver'
$installerType = 'MSI'
$url = 'http://www.visualsvn.com/files/VisualSVN-Server-3.0.0-win32.msi'
$url64 = 'http://www.visualsvn.com/files/VisualSVN-Server-3.0.0-x64.msi'
$silentArgs = ''
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes