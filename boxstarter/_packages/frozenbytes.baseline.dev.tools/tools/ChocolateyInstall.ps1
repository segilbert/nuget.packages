try {

    # Boxstarter options
    $Boxstarter.RebootOk=$true # Allow reboots?
    $Boxstarter.NoPassword=$false # Is this a machine with no login password?
    $Boxstarter.AutoLogin=$true # Save my password securely and auto-login after a reboot

    # Basic setup
    Update-ExecutionPolicy Unrestricted
    
    # Install Frozenbytes extensions for VS 2013
    #cinstm frozenbytes.vs2012.extensions

    # VS extensions
    Install-ChocolateyVsixPackage PowerShellTools http://visualstudiogallery.msdn.microsoft.com/c9eb3ba8-0c59-4944-9a62-6eee37294597/file/112013/6/PowerShellTools.vsix
    Install-ChocolateyVsixPackage WebEssentials2013 http://visualstudiogallery.msdn.microsoft.com/56633663-6799-41d7-9df7-0f2a504ca361/file/105627/31/WebEssentials2013.vsix
    Install-ChocolateyVsixPackage T4Toolbox http://visualstudiogallery.msdn.microsoft.com/791817a4-eb9a-4000-9c85-972cc60fd5aa/file/116854/1/T4Toolbox.12.vsix
    Install-ChocolateyVsixPackage StopOnFirstBuildError http://visualstudiogallery.msdn.microsoft.com/91aaa139-5d3c-43a7-b39f-369196a84fa5/file/44205/3/StopOnFirstBuildError.vsix

    # Install Frozenbytes essentials chocolatey packages
    cinst frozenbytes.essentials
    cinst frozenbytes.extras
    cinst frozenbytes.repos

    #Other dev tools
    cinst NugetPackageExplorer
    cinst windbg

    #Browsers
    cinst googlechrome
    cinst firefox

    #Other essential tools
    cinst adobereader
    cinst javaruntime

    Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Google\Chrome\Application\chrome.exe"
    Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe"

    Write-ChocolateySuccess 'frozenbytes.baseline.dev.tools'
} catch {
  Write-ChocolateyFailure 'frozenbytes.baseline.dev.tools' $($_.Exception.Message)
  throw
}