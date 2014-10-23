try {

    # Boxstarter options
    $Boxstarter.RebootOk=$true # Allow reboots?
    $Boxstarter.NoPassword=$false # Is this a machine with no login password?
    $Boxstarter.AutoLogin=$true # Save my password securely and auto-login after a reboot

    # Basic setup
    Update-ExecutionPolicy Unrestricted
    
    #Silverlight SDKs
    cinst Silverlight3SDK
    if (Test-PendingReboot) { Invoke-Reboot }
    cinst Silverlight4SDK
    if (Test-PendingReboot) { Invoke-Reboot }
    cinst Silverlight5SDK
    if (Test-PendingReboot) { Invoke-Reboot }
    cinst Silverlight5DeveloperRuntime
    if (Test-PendingReboot) { Invoke-Reboot }

    # Visual Studio SDK required for PoshTools extension
    cinst VS2013SDK
    if (Test-PendingReboot) { Invoke-Reboot }

    # Windows SDK 7 or 8
    cinst windows-8-1-sdk
    if (Test-PendingReboot) { Invoke-Reboot }


    Write-ChocolateySuccess 'frozenbytes.baseline.dev.sdks'
} catch {
  Write-ChocolateyFailure 'frozenbytes.baseline.dev.sdks' $($_.Exception.Message)
  throw
}