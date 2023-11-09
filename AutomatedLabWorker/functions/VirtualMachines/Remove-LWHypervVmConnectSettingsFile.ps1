function Remove-LWHypervVmConnectSettingsFile
{
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseCompatibleCmdlets", "", Justification="Not relevant on Linux")]
    [Cmdletbinding()]
    param (
        [Parameter(Mandatory)]
        [string]$ComputerName
    )
    
    Write-LogFunctionEntry
    
    $vm = Get-VM -Name $VmName
    
    if (Test-Path -Path $configFilePath)
    {
        $configFilePath = '{0}\Microsoft\Windows\Hyper-V\Client\1.0\vmconnect.rdp.{1}.config' -f $env:APPDATA, $vm.Id
        Remove-Item -Path $configFilePath -ErrorAction SilentlyContinue
    }
    
    Write-LogFunctionExit
}
