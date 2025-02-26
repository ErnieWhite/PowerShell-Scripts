# PowerShell script to add a prefix to files in the current directory
# Enhanced for fault tolerance and logging

param (
	[string]$prefix # Optional parameter for the prefix; if not provided, the current directory name is used
)

# If no prefix is provided, use the name of the current directory
if (-not $prefix) {
	try {
		$prefix = (Get-Item -Path ".").Name
	} catch {
		Write-Host "Error: Unable to determine the directory name." -ForgroundColor Red
		exit 1
	}
}

# Get all files in the current directory and iterate through them
Get-ChildItem -File | ForEach-Object {
	try {
		# Check if the file name already starts with the prefix
		if (-not $_.Name.StartsWith($prefix)) {
			# Construct the new file name with the prefix
			$newName = "$prefix-$_"
			$oldName = "$_"

			# Rename the file with the new name
			Rename-Item -Path $_.FullName -NewName $newName -ErrorAction Stop
			Write-Host "Renamed: $_.Name -> $newName" -ForegroundColor Green
		} else {
			Write-Host "Skipped (already prefixed): $_" -ForegroundColor Yellow
		}
	} catch {
		Write-Host "Error renaming: $oldName $_" -ForegroundColor Red
	}
}

