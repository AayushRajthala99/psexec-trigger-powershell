$testName = $args[0]

# Note: Create the credentials.txt & VMInfo.txt files in the 'credentials' directory...
# JK: You can just rename the example files, but do input your own credentials in those files...

# File Paths...
$credentialsPath = '.\credentials\credentials.txt'
$vmInfoPath = '.\credentials\VMInfo.txt'

# Gets File Information as Array...
$credentials = Get-Content -Path $credentialsPath
$vmInfo = Get-Content -Path $vmInfoPath

ForEach ($info in $vmInfo) {

    # Parsing VM Information...
    $info = $info.split(" ")
    $ipAddress = $info[0]
    $vmName = $info[1]
    $testName = "$vmName-$testName"

    # Trigger psexec code...
    (psexec \\$ipAddress -u $credentials[0] -p $credentials[1] -s -i 2 -w "C:\Users\secureiqlab\Documents\malware-downloader-powershell\" pwsh "C:\Users\secureiqlab\Documents\malware-downloader-powershell\headlesscode.ps1" "$testName") &
}