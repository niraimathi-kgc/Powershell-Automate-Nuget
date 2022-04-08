#-------------------------------------------------------------------------------------
# *** INSTALLATION OF ENTITY FRAMEWORK AND NEWTONSOFT PACKAGES FROM THE NUGET.ORG ***
#-------------------------------------------------------------------------------------


# Declaring variable for assigning path
$DBServicesPath="D:\repo old\AutomatePractice\Services.DB\DB.Services"
$DBAccessPath="D:\repo old\AutomatePractice\DataAccess\DataAccess.DB"
$AccessPathNuget="D:\repo old\AutomatePractice\DataAccess\DataAccess.DB\DataAccess.DB.1.0.0.nupkg"
$ServicePathNuget="D:\repo old\AutomatePractice\Services.DB\DB.Services\DB.Services.1.0.0.nupkg"
$FinallWebPath="D:\repo old\AutomatePractice\CoreWebApp\TestWebApp"

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

#----------------------------------------------------------------------------------
#                          *** END-OF-INSTALLATION ***
#----------------------------------------------------------------------------------


#----------------------------------------------------------------------------------
#       ***PACKING AND ADDING THE PACKAGE TO NUGET LOCAL PACKAGE DIRECTORY ***
#----------------------------------------------------------------------------------


# Configure and pack in Data.Access Project then add the pack to nuget packages
Set-Location $DBAccessPath
dotnet clean
dotnet build 
nuget pack 
nuget add "D:\repo old\AutomatePractice\DataAccess\DataAccess.DB\DataAccess.DB.1.0.0.nupkg" -Source "C:\Program Files (x86)\Microsoft SDKs\NuGetPackages"

# Configure and pack in Data.Service Project then add the pack to nuget packages
Set-Location "D:\repo old\AutomatePractice\Services.DB\DB.Services\"
dotnet add package dataaccess.db

cd $DBServicesPath
dotnet clean
dotnet build 
nuget pack 
nuget add "D:\repo old\AutomatePractice\Services.DB\DB.Services\DB.Services.1.0.0.nupkg" -Source "C:\Program Files (x86)\Microsoft SDKs\NuGetPackages"


#--------------------------------------------------------------------------------------
#              *** END-OF-PACKING-AND-ADDING-TO-LOCAL-NUGET-DIRECTORY ***
#--------------------------------------------------------------------------------------



#--------------------------------------------------------------------------------------
#              *** INSTALLATION OF LOCAL PACKAGE IN THE FINAL PROJECT ***
#--------------------------------------------------------------------------------------


Set-Location "D:\repo old\AutomatePractice\CoreWebApp\TestWebApp"
dotnet add package db.services
dotnet publish