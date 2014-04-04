function Disable-Optimisations() {
	$dlls = Get-Dlls

	$dlls | ForEach-Object {
		$newFile = Get-IniFilename $_
		New-Item $newFile -type file -Value "[.NET Framework Debugging Control]`r`nGenerateTrackingInfo=1`r`nAllowOptimize=0"
	}
}

function Enable-Optimisations() {
	$dlls = Get-Dlls
	
	$dlls | ForEach-Object {
		$newFile = Get-IniFilename $_
		Remove-Item $newFile
	}	
}

function Get-Dlls() {
	return Get-ChildItem -Filter "*.dll"
}

function Get-IniFilename($file) {
	return ($_.Name.Substring(0, $_.Name.LastIndexOf('.')) + ".ini")
}
