# PowerShell Script to add a prefix to files in the current directory
# If no prefix is provided, the script uses teh current directory name as the prefix.
# The script ensures that files do not receive the prefix if they already have it.
#
# Created by ChatGPT

param (
	[string]$prefix  # Optional parameter fro the prefix; if not provided, the directory name is used.
) 

# If no prefix is provided, use the name of the current directory
if (-not $prefix) {
	$prefix = (Get-Item -Path ".").Name
}

# Get all files in the current directory and iterate through them
Get-ChildItem -File | ForEach-Object {
	# Check if the file name lready starts with the prefix
	if (-not $_.Name.StartsWith($prefix)) {
		# Construct the new file name with the prefix
		$newName = "$preprefix$($_.Name)"

		# Rename the file with the new name
		Rename-Item -Path $_.FullName -NewName $ newName
	}
}

