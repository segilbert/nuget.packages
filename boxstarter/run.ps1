$vm=Get-AzureVM -ServiceName stg-boxstarter -Name BoxStartTest
Set-AzureVMCheckpoint -VM $vm -CheckpointName BaselineOS