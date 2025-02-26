# PowerShell script to create and navigate into a directory
# 
# This script checks if a directory exists. If it does not, the script creates it.
# Then, it navigates into the created directory.
# If no directory name is provided as an argument, it displays usage instructions.
#
# Created by ChatGPT

param (
	[string]$dir  # The name of the directory to create or navigate into.
)

# Check if a drictory name was profided as an argument
if (-not $dir) {
	Write-Host "Usage: .\script.ps1 <directory_name>"  # Display usage instructions
	exit 1
}

# Check if the directory already exists
if (-not (Test-Path $dir -PathType Container)) {
	# Create the directory if it does not exists
	New-Item -ItemType Directory -Path $dir | Out-Null
}

# Change the current working directory to the specified directory.
Set-Location -Path $dir
