/*Author: Xianrun Sheeran QU
Description: Use Nuget with windows prompt, to secure store files pass to AppVeyor
Usage: signing*/
Microsoft Windows [Version 6.1.7601]
Copyright (c) 2009 Microsoft Corporation.  All rights reserved.

C:\Users\srsheeran>cd Downloads

C:\Users\srsheeran\Downloads>nuget
NuGet Version: 4.4.1.4656
usage: NuGet <command> [args] [options]
Type 'NuGet help <command>' for help on a specific command.

Available commands:

 add         Adds the given package to a hierarchical source. http sources are
             not supported. For more info, goto https://docs.nuget.org/consume/
             command-line-reference#add-command.

 config      Gets or sets NuGet config values.

 delete      Deletes a package from the server.

 help (?)    Displays general help information and help information about other
             commands.

 init        Adds all the packages from the <srcPackageSourcePath> to the hiera
             rchical <destPackageSourcePath>. http feeds are not supported. For
             more info, goto https://docs.nuget.org/consume/command-line-refere
             nce#init-command.

 install     Installs a package using the specified sources. If no sources are
             specified, all sources defined in the NuGet configuration file are
             used. If the configuration file specifies no sources, uses the def
             ault NuGet feed.

 list        Displays a list of packages from a given source. If no sources are
             specified, all sources defined in %AppData%\NuGet\NuGet.config are
             used. If NuGet.config specifies no sources, uses the default NuGet
             feed.

 locals      Clears or lists local NuGet resources such as http requests cache,
             temp cache or machine-wide global packages folder.

 pack        Creates a NuGet package based on the specified nuspec or project f
             ile.

 push        Pushes a package to the server and publishes it.
             NuGet's default configuration is obtained by loading %AppData%\NuG
             et\NuGet.config, then loading any nuget.config or .nuget\nuget.con
             fig starting from root of drive and ending in current directory.

 restore     Restores NuGet packages.

 setApiKey   Saves an API key for a given server URL. When no URL is provided A
             PI key is saved for the NuGet gallery.

 sources     Provides the ability to manage list of sources located in %AppData
             %\NuGet\NuGet.config

 spec        Generates a nuspec for a new package. If this command is run in th
             e same folder as a project file (.csproj, .vbproj, .fsproj), it wi
             ll create a tokenized nuspec file.

 update      Update packages to latest available versions. This command also up
             dates NuGet.exe itself.

For more information, visit http://docs.nuget.org/docs/reference/command-line-re
ference

C:\Users\srsheeran\Downloads>nuget install secure-file -ExcludeVersion
Feeds used:
  https://api.nuget.org/v3/index.json
  C:\Program Files (x86)\Microsoft SDKs\NuGetPackages\

Installing package 'secure-file' to 'C:\Users\srsheeran\Downloads'.
  GET https://api.nuget.org/v3/registration3-gz-semver2/secure-file/index.json
  OK https://api.nuget.org/v3/registration3-gz-semver2/secure-file/index.json 14
4ms


Attempting to gather dependency information for package 'secure-file.1.0.31' wit
h respect to project 'C:\Users\srsheeran\Downloads', targeting 'Any,Version=v0.0
'
Gathering dependency information took 44.81 ms
Attempting to resolve dependencies for package 'secure-file.1.0.31' with Depende
ncyBehavior 'Lowest'
Resolving dependency information took 0 ms
Resolving actions to install package 'secure-file.1.0.31'
Resolved actions to install package 'secure-file.1.0.31'
Retrieving package 'secure-file 1.0.31' from 'nuget.org'.
  GET https://api.nuget.org/v3-flatcontainer/secure-file/1.0.31/secure-file.1.0.
31.nupkg
  OK https://api.nuget.org/v3-flatcontainer/secure-file/1.0.31/secure-file.1.0.3
1.nupkg 58ms
Installing secure-file 1.0.31.
Adding package 'secure-file.1.0.31' to folder 'C:\Users\srsheeran\Downloads'
Added package 'secure-file.1.0.31' to folder 'C:\Users\srsheeran\Downloads'
Successfully installed 'secure-file 1.0.31' to C:\Users\srsheeran\Downloads
Executing nuget actions took 254.32 ms

C:\Users\srsheeran\Downloads>ls
desktop.ini               secure-file               user
nuget.exe                 smith_MM_certificate.pfx

C:\Users\srsheeran\Downloads>secure-file\tools\secure-file -encrypt smith_MM_cer
tificate.pfx -secret TakeAGuess

C:\Users\srsheeran\Downloads>ls
desktop.ini                   smith_MM_certificate.pfx
nuget.exe                     smith_MM_certificate.pfx.enc
secure-file                   user

C:\Users\srsheeran\Downloads>secure-file\tools\secure-file -decrypt smith_MM_cer
tificate.pfx.enc -secret TakeAGuess

C:\Users\srsheeran\Downloads>ls
desktop.ini                   smith_MM_certificate.pfx
nuget.exe                     smith_MM_certificate.pfx.enc
secure-file                   user

C:\Users\srsheeran\Downloads>Works! :)





#Powershell
PS C:\Users\srsheeran\Downloads> $cert.import('C:\Users\srsheeran\Downloads\smith_MM_certificate.pfx','#!Nu6WAQU7pe','De
faultKeySet')
PS C:\Users\srsheeran\Downloads> $cert

Thumbprint                                Subject
----------                                -------
E72804E687A374E83CE1941C13F9B611B79C2C1C  CN=University of Wisconsin-Madison, OU=OCIS, O=University of Wisconsin-Mad...


PS C:\Users\srsheeran\Downloads> Set-AuthenticodeSignature -FilePath "MetaMorpheusInstaller(1).msi" -Certificate $cert


    Directory: C:\Users\srsheeran\Downloads


SignerCertificate                         Status                                 Path
-----------------                         ------                                 ----
E72804E687A374E83CE1941C13F9B611B79C2C1C  Valid                                  MetaMorpheusInstaller(1).msi
