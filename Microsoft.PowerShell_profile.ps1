#Locations
# Change these paths to match your system
$prog86 = "C:\Program Files (x86)"
$sublPath = Join-Path $prog86 "Sublime Text 3\sublime_text.exe"

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

function Fix-LineEndings() {
    foreach ($ext in @("*.cshtml", "*.cs", "*.js", "*.html", "*.csproj", "*.sln", "*.css", "*.sql")  {
        (dir -Recurse -Filter $ext) | foreach { 
            $file = gc $_.FullName
            $file | sc $_.FullName
        }
    }
}

Set-Alias subl $sublPath
