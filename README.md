My Powershell Profile
=================

## Enable-Optimisations ##

Creates a .ini file for each .dll in the current directory, containing:

    [.NET Framework Debugging Control]
    GenerateTrackingInfo=1
    AllowOptimize=0
    
which disables optimisation for each dll

## Disable-Optimisations ##

Reverses the `Enable-Optimisations` operation by deleting the ini files created in the above step. Note that it only deletes .ini files that have the same name as a dll.

## Subl `file`

    subl <file>

Opens the given file in sublime text. Excluding the filename parameter just opens sublime text, or refocuses it if it was already open.

## Open-MitScheme `file`

A helper for MIT Scheme that opens the edwin editor. Excluding the file argument opens the editor with a new file.