$packageName = 'forzenbytes.vs2012.extensions'

# Special Thanks to Alan Stevens for this powershell code
# 

function Get-Batchfile ($file) {
  $cmd = "`"$file`" & set"
    cmd /c $cmd | Foreach-Object {
      $p, $v = $_.split('=')
        Set-Item -path env:$p -value $v
    }
}

function VsVars32()
{
    $BatchFile = join-path $env:VS110COMNTOOLS "vsvars32.bat"
    Get-Batchfile `"$BatchFile`"
}

function curlex($url, $filename) {
  $path = join-path $env:temp $filename

    if( test-path $path ) { rm -force $path }

  (new-object net.webclient).DownloadFile($url, $path)

    return new-object io.fileinfo $path
}

function installsilently($url, $name) {
  echo "Installing $name"

  $extension = (curlex $url $name).FullName

  $result = Start-Process -FilePath "VSIXInstaller.exe" -ArgumentList "/q $extension" -Wait -PassThru;
}

try {

  vsvars32

    installsilently http://visualstudiogallery.msdn.microsoft.com/b31916b0-c026-4c27-9d6b-ba831093f6b2/file/62080/3/Gister.vsix Gister.vsix
    
    installsilently http://visualstudiogallery.msdn.microsoft.com/e5f41ad9-4edc-4912-bca3-91147db95b99/file/7088/6/PowerCommands.vsix PowerCommands.vsix

    installsilently http://visualstudiogallery.msdn.microsoft.com/07d54d12-7133-4e15-becb-6f451ea3bea6/file/79465/24/WebEssentials2012.vsix WebEssentials2012.vsix

    installsilently http://visualstudiogallery.msdn.microsoft.com/366ad100-0003-4c9a-81a8-337d4e7ace05/file/82992/3/ColorThemeEditor.vsix ColorThemeEditor.vsix

    installsilently http://visualstudiogallery.msdn.microsoft.com/a83505c6-77b3-44a6-b53b-73d77cba84c8/file/74740/18/SquaredInfinity.VSCommands.VS11.vsix VsCommands.vsix

    installsilently http://visualstudiogallery.msdn.microsoft.com/7c8341f1-ebac-40c8-92c2-476db8d523ce/file/15808/10/SpellChecker.vsix SpellChecker.vsix

    installsilently http://visualstudiogallery.msdn.microsoft.com/23d11b45-c2ed-4398-9cb5-48ea67878470/file/77232/3/Twitter%20Bootstrap%20MVC.vsix TwitterBootstrapMvc.vsix

    installsilently http://visualstudiogallery.msdn.microsoft.com/268d0b05-6ba5-4793-9a10-7d9d2a478881/file/70320/5/MVC4TwitterBootstrapStarterLayoutPage.vsix MVC4TwitterBootstrapStarterLayoutPage.vsix

    installsilently http://visualstudiogallery.msdn.microsoft.com/1460ab21-75be-49d0-900f-dfd538321424/file/54475/11/ConsoleLauncher.vsix ConsoleLauncher

    installsilently http://visualstudiogallery.msdn.microsoft.com/2b96d16a-c986-4501-8f97-8008f9db141a/file/53962/44/Mindscape.WebWorkbench.Integration.10.vsix WebWorkbench.vsix

    installsilently http://visualstudiogallery.msdn.microsoft.com/0855e23e-4c4c-4c82-8b39-24ab5c5a7f79/file/15725/3/MarkdownMode.vsix MarkdownMode.vsix

    installsilently http://visualstudiogallery.msdn.microsoft.com/6e54271c-2c4e-4911-a1b4-a65a588ae138/file/85910/4/TfsGoOffline.vsix Tfs-GoOffline

    installsilently http://visualstudiogallery.msdn.microsoft.com/bb424812-f742-41ef-974a-cdac607df921/file/35141/30/Clarius.DBS.vsix Clarius.DBS.vsix

    installsilently http://visualstudiogallery.msdn.microsoft.com/2beb9705-b568-45d1-8550-751e181e3aef/file/93630/5/MultiEdit.vsix MultiEdit.vsix

    Write-ChocolateySuccess $packageName
} catch {
  Write-ChocolateyFailure $packageName "$($_.Exception.Message)"
    throw
}
