My Powershell Profile
=================

## Enable-Optimisations ##

	Enable-Optimisations

Creates a .ini file for each .dll in the current directory, containing:

    [.NET Framework Debugging Control]
    GenerateTrackingInfo=1
    AllowOptimize=0
    
which disables optimisation for each dll

## Disable-Optimisations ##

	Disable-Optimisations

Reverses the `Enable-Optimisations` operation by deleting the ini files created in the above step. Note that it only deletes .ini files that have the same name as a dll.

## Subl `file`

    subl <file>

Opens the given file in sublime text. Excluding the filename parameter just opens sublime text, or refocuses it if it was already open.

## Fix-LineEndings

    Fix-LineEndings

Converts files in the current and nested directories to CRLF line endings by doing get-content and set-content. 
File types handled: *.cshtml, *.cs, *.js, *.html, *.csproj, *.sln, *.css
