# Assigning the path to the Variables for easy access...

$PackagePath = "C:\Users\niraimathi.kgc\.nuget\packages"

# $DBServicesPath - Should give the package directory in users\niraimathi.kgc\.nuget\packages
$DBServicesPath = "D:\repo old\AutomatePractice\Services.DB\DB.Services"

# $DBAccessPath - Should give the package directory in users\niraimathi.kgc\.nuget\packages
$DBAccessPath = "D:\repo old\AutomatePractice\DataAccess\DataAccess.DB"
$EntityPackPath = "C:\Users\niraimathi.kgc\.nuget\packages\entityframework"
$NewtonPackPath = "C:\Users\niraimathi.kgc\.nuget\packages\newtonsoft.json"

# Checking and deleting the old packages in the prefered path
cd $DBAccessPath
# Installing the new version or the compatible version of the package
        Write-Host "`n-------------------------------------"
        Write-Host "`nInstallation Of Entity FrameWork Begins...`n"
        Write-Host "-------------------------------------`n"
        dotnet add package EntityFramework --version 6.4.4 

# Additional Content (not necessary)
        Write-Host "`n-------------------------------------"
        Write-Host "`nthe Entity framework Package has been successfully Installed`n"
        Write-Host "-------------------------------------`n`n`n"

    cd $DBServicesPath

    Write-Host "`n-------------------------------------"
    Write-Host "`nInstallation Of NewTonSoft Begins...`n"
    Write-Host "-------------------------------------`n"
        dotnet add package Newtonsoft.Json --version 13.0.1

# Additional Content (not necessary)
        Write-Host "`n-------------------------------------"
        Write-Host "`nthe NewtonSoft Package has been successfully Installed`n"
        Write-Host "-------------------------------------`n`n`n"


# ***PACKING AND ADDING THE PACKAGE TO NUGET LOCAL PACKAGE DIRECTORY ***

# Configure and pack in Data.Access Project then add the pack to nuget packages
Set-Location $DAPath
dotnet clean
dotnet build 
nuget pack 
nuget add "D:\repo old\AutomatePractice\DataAccess\DataAccess.DB\DataAccess.DB.1.0.0.nupkg" -Source "C:\Program Files (x86)\Microsoft SDKs\NuGetPackages"

# Configure and pack in Data.Service Project then add the pack to nuget packages
Set-Location "D:\repo old\AutomatePractice\Services.DB\DB.Services\"
dotnet add package dataaccess.db

cd $DSPath
dotnet clean
dotnet build 
nuget pack 
nuget add "D:\repo old\AutomatePractice\Services.DB\DB.Services\DB.Services.1.0.0.nupkg" -Source "C:\Program Files (x86)\Microsoft SDKs\NuGetPackages"







# Declaring variable for assigning path
$DAPath = "D:\repo old\AutomatePractice\DataAccess\DataAccess.DB" # used in cd command for Data.Access
$DSPath = "D:\repo old\AutomatePractice\Services.DB\DB.Services\" # used in cd command for Data.Services
$PathNuget = "D:\repo old\AutomatePractice\DataAccess\DataAccess.DB\DataAccess.DB.1.0.0.nupkg"
$PathForNuget = "D:\repo old\AutomatePractice\Services.DB\DB.Services\DB.Services.1.0.0.nupkg"
$Path1 = "D:\repo old\AutomatePractice\DataAccess\DataAccess.DB"
$Path2 = "D:\repo old\AutomatePractice\Services.DB\DB.Services"

# Configure and pack in Data.Access Project then add the pack to nuget packages
Set-Location $DAPath
dotnet clean
dotnet build 
nuget pack 
nuget add "D:\repo old\AutomatePractice\DataAccess\DataAccess.DB\DataAccess.DB.1.0.0.nupkg" -Source "C:\Program Files (x86)\Microsoft SDKs\NuGetPackages"

# Configure and pack in Data.Service Project then add the pack to nuget packages
Set-Location "D:\repo old\AutomatePractice\Services.DB\DB.Services\"
dotnet add package dataaccess.db

cd $DSPath
dotnet clean
dotnet build 
nuget pack 
nuget add "D:\repo old\AutomatePractice\Services.DB\DB.Services\DB.Services.1.0.0.nupkg" -Source "C:\Program Files (x86)\Microsoft SDKs\NuGetPackages"

