try {

    # Boxstarter options
    $Boxstarter.RebootOk=$true # Allow reboots?
    $Boxstarter.NoPassword=$false # Is this a machine with no login password?
    $Boxstarter.AutoLogin=$true # Save my password securely and auto-login after a reboot

    # Basic setup
    Update-ExecutionPolicy Unrestricted
    
    # Install Visual Studio 2013 Express 
    #cinstm VisualStudio2013ExpressWeb 
    #if (Test-PendingReboot) { Invoke-Reboot }

    # Install Visual Studio 2013 Professional 
    #cinstm VisualStudio2013Professional -InstallArguments WebTools
    #if (Test-PendingReboot) { Invoke-Reboot }

    # Install Visual Studio 2013 Premium
    #cinstm
    #if (Test-PendingReboot) { Invoke-Reboot }

    # Install Visual Studio 2013 Ultimate
    cinst VisualStudio2013Ultimate -InstallArguments "/Features:'WebTools Win8SDK SQL Blend SilverLight_Developer_Kit WindowsPhone80'"
    if (Test-PendingReboot) { Invoke-Reboot }

    Write-ChocolateySuccess 'frozenbytes.baseline.dev.vs'
} catch {
  Write-ChocolateyFailure 'frozenbytes.baseline.dev.vs' $($_.Exception.Message)
  throw
}