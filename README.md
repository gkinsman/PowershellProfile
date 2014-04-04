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