#Locations
# Change these paths to match your system
$prog86 = "C:\Program Files (x86)"
$sublPath = Join-Path $prog86 "Sublime Text 3\sublime_text.exe"
$schemeDir = Join-Path $prog86 "MIT-GNU Scheme"

# You shouldn't need to touch below here much
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

function Open-MitScheme($file) {
	if(!(Test-Path $file)) {
		New-Item $file -type file
	}

	$libDir = Join-Path $schemeDir lib
	$allcom = Join-Path $libDir all.com
	mit-scheme --band $allcom --library $libDir --load $file
}

Set-Alias subl $sublPath