# PowerShell script to create and navigate to a service now directory
# 
# This script takes a directory name from the command line.
# Then checks to see if the directory exists in the "ServiceNow" directory.
# If the directory does not exists, it is created.
# Then the script makes the directory the current working directory.
# If no directory name is provided as an argument, it displays usage instructions.
#
# Created by ChatGPT

# Define the base directory where the subdirectory exists
# Change this to your desired directory.
$BaseDirectory = "C:\Users\awhite\OneDrive - Morsco\Documents\ServiceNow"

# Check if an argument (subdirectory name) was provided.
if ($args.Count -eq 0) {
	Write-Host "Usage: .\sn.ps1 <SubDirectoryName>"
	exit 1
}

# Get the subdirectory name from the first argument.
$SubDirectory = $args[0].ToUpper()

# Combine the base directory and subdirectory name to form the full path.
$NewDirectory = Join-Path -Path $BaseDirectory -ChildPath $SubDirectory

# Check if the directory already exists
if (-not (Test-Path $NewDirectory -PathType Container)) {
	# Create the directory if it does not exists
	New-Item -ItemType Directory -Path $NewDirectory | Out-Null
}

# Change the current working directory to the subdirectory specified
Set-Location -Path $NewDirectory

# Open the directory in File explorer.
Start-Process explorer.exe -ArgumentList $NewDirectory


