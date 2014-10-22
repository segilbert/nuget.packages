try {

    # Boxstarter options
    $Boxstarter.RebootOk=$true # Allow reboots?
    $Boxstarter.NoPassword=$false # Is this a machine with no login password?
    $Boxstarter.AutoLogin=$true # Save my password securely and auto-login after a reboot

    # Basic setup
    Update-ExecutionPolicy Unrestricted
    Set-ExplorerOptions -showHidenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions
    Enable-RemoteDesktop
    Disable-InternetExplorerESC
    Disable-UAC
    Set-TaskbarSmall

    if (Test-PendingReboot) { Invoke-Reboot }

    # Update Windows and reboot if necessary
    Install-WindowsUpdate -AcceptEula
    if (Test-PendingReboot) { Invoke-Reboot }

    try {
        cinst DotNet4.5
        cinst DotNet4.5.1
        cinst DotNet4.5.2

        cinst Microsoft-Hyper-V-All -source windowsFeatures

        cinst IIS-WebServerRole -source windowsfeatures
        cinst IIS-WebServer -source windowsfeatures
        cinst IIS-WebServerManagementTools -source windowsfeatures

        cinst IIS-HttpCompressionDynamic -source windowsfeatures
        cinst IIS-ManagementScriptingTools -source windowsfeatures
        cinst IIS-WindowsAuthentication -source windowsfeatures

        cinst IIS-RequestFiltering -source windowsfeatures
        cinst IIS-HttpRedirect -source windowsfeatures
        
        cinst IIS-ISAPIFilter -source WindowsFeatures
        cinst IIS-ISAPIExtensions -source WindowsFeatures
        cinst IIS-NetFxExtensibility -source WindowsFeatures
        cinst IIS-ASPNET -source windowsfeatures
        
        cinst IIS-NetFxExtensibility45 -source WindowsFeatures
        cinst NetFx4Extended-ASPNET45 -source WindowsFeatures
        cinst IIS-ASPNET45 -source windowsfeatures

        #Enable ASP.NET on win 7/2008R2
        ."$env:windir\microsoft.net\framework\v4.0.30319\aspnet_regiis.exe" -i
    } catch {
      Write-ChocolateyFailure 'ASP.NET Services' $($_.Exception.ToString())
      throw
    }

    # Install Visual Studio 2013 Express 
    #cinstm VisualStudio2013ExpressWeb 

    # Install Visual Studio 2013 Professional 
    #cinstm VisualStudio2013Professional -InstallArguments WebTools
    if (Test-PendingReboot) { Invoke-Reboot }

    # Install Visual Studio 2013 Premium
    
    # Install Visual Studio 2013 Ultimate
    cinstm VisualStudio2013Ultimate -InstallArguments "/Features:'WebTools Win8SDK SQL Blend SilverLight_Developer_Kit WindowsPhone80'"
    if (Test-PendingReboot) { Invoke-Reboot }

    #Silverlight SDKs
    cinstm Silverlight3SDK
    cinstm Silverlight4SDK
    cinstm Silverlight5SDK
    cinstm Silverlight5DeveloperRuntime

    # Visual Studio SDK required for PoshTools extension
    cinstm VS2013SDK
    if (Test-PendingReboot) { Invoke-Reboot }

    # Visual Studio Updates
    cinstm VS2013.1
    cinstm VS2013.2
    cinstm VS2013.3

    # Windows SDK 7 or 8
    cinstm windows-8-1-sdk

    cinstm DotNet3.5 # Not automatically installed with VS 2013. Includes .NET 2.0. Uses Windows Features to install.
    if (Test-PendingReboot) { Invoke-Reboot }

    # Install Frozenbytes extensions for VS 2013
    #cinstm frozenbytes.vs2012.extensions

    # VS extensions
    Install-ChocolateyVsixPackage PowerShellTools http://visualstudiogallery.msdn.microsoft.com/c9eb3ba8-0c59-4944-9a62-6eee37294597/file/112013/6/PowerShellTools.vsix
    Install-ChocolateyVsixPackage WebEssentials2013 http://visualstudiogallery.msdn.microsoft.com/56633663-6799-41d7-9df7-0f2a504ca361/file/105627/31/WebEssentials2013.vsix
    Install-ChocolateyVsixPackage T4Toolbox http://visualstudiogallery.msdn.microsoft.com/791817a4-eb9a-4000-9c85-972cc60fd5aa/file/116854/1/T4Toolbox.12.vsix
    Install-ChocolateyVsixPackage StopOnFirstBuildError http://visualstudiogallery.msdn.microsoft.com/91aaa139-5d3c-43a7-b39f-369196a84fa5/file/44205/3/StopOnFirstBuildError.vsix

    # AWS Toolkit is now an MSI available here http://sdk-for-net.amazonwebservices.com/latest/AWSToolsAndSDKForNet.msi (no chocolatey package as of FEB 2014)
    # Install-ChocolateyVsixPackage AwsToolkit http://visualstudiogallery.msdn.microsoft.com/175787af-a563-4306-957b-686b4ee9b497

    # Install Frozenbytes essentials chocolatey packages
    cinstm frozenbytes.essentials
    cinstm frozenbytes.extras
    cinstm frozenbytes.repos

    #Other dev tools
    cinstm NugetPackageExplorer
    cinstm windbg

    #Browsers
    cinstm googlechrome
    cinstm firefox

    #Other essential tools
    cinstm adobereader
    cinstm javaruntime

    Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Google\Chrome\Application\chrome.exe"
    Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe"

    Write-ChocolateySuccess 'frozenbytes.baseline.dev'
} catch {
  Write-ChocolateyFailure 'frozenbytes.baseline.dev' $($_.Exception.Message)
  throw
}