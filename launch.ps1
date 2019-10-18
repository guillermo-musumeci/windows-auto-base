# Download repository files
$SetupFolder = "C:\Setup"
New-Item -ItemType "directory" -Path $SetupFolder -force
$SourceURL = "https://github.com/guillermo-musumeci/windows-auto-base/archive/master.zip"
$Installer = $SetupFolder + "\automaster.zip"
Invoke-WebRequest $SourceURL -OutFile $Installer
Expand-Archive $Installer -DestinationPath $SetupFolder -Force
$ZIPFolder = $SetupFolder + "\windows-auto-repository-master"
Copy-Item ($ZIPFolder + "\*") -Destination $SetupFolder -Recurse -Force
Remove-Item -path $ZIPFolder -Recurse -Force -Confirm:$false
Remove-Item $Installer -Force

# set temp folders
Invoke-Expression ($SetupFolder + "\set-temp.ps1")

# configure BGinfo
Invoke-Expression ($SetupFolder + "\bginfo.ps1")

# Install Google Chrome
Invoke-Expression ($SetupFolder + "\install-google-chrome.ps1")

# Install Visual Studio Code
Invoke-Expression ($SetupFolder + "\install-vscode.ps1")
