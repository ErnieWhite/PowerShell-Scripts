# Define the base directory where the subdirectory exists
# Change this to your desired directory.
$BaseDirectory = "C:\Users\awhite\OneDrive - Morsco\Documents\ServiceNow"

# Check if an argument (subdirectory name) was provided.
if ($args.Count -eq 0) {
	Write-Host "Usage: .\goto.ps1 <SubDirectoryName>"
	exit 1
}

# Get the subdirectory name from the first argument.
$SubDirectory = $args[0]

# Combine the base directory and subdirectory name to form the full path.
$NewDirectory = Join-Path -Path $BaseDirectory -ChildPath $SubDirectory

# Make sure the directory exists.
if (-not (Test-Path $NewDirectory)) {
	Write-Host "$NewDirectory not found!"
	exit 1
}

# Change the current working directory to the subdirectory specified
Set-Location -Path $NewDirectory

# Open the directory in File explorer.
Start-Process explorer.exe -ArgumentList $NewDirectory

	
