# Assigning the path to the Variables for easy access...

#$PackagePath = "C:\Users\niraimathi.kgc\.nuget\packages"

# $DBServicesPath - Should give the package directory in users\niraimathi.kgc\.nuget\packages
$DBServicesPath = "D:\repo old\AutomatePractice\Services.DB\DB.Services"

# $DBAccessPath - Should give the package directory in users\niraimathi.kgc\.nuget\packages
$DBAccessPath = "D:\repo old\AutomatePractice\DataAccess\DataAccess.DB"
$EntityPackPath = "C:\Users\niraimathi.kgc\.nuget\packages\entityframework"
$NewtonPackPath = "C:\Users\niraimathi.kgc\.nuget\packages\newtonsoft.json"
$CheckNewtonPath = Test-Path -path $NewtonPackPath
$CheckEntityPath = Test-Path -Path $EntityPackPath

# Checking and deleting the old packages in the prefered path

function Clear-BatFile 
{
Set-Location $DBAccessPath
if ($CheckEntityPath)
    {
# To remove the existing package
        Remove-Item $EntityPackPath
    } 
else 
    {
# Installing the new version or the compatible version of the package
        Write-Host "`n-------------------------------------"
        Write-Host "`nInstallation Of Entity FrameWork Begins...`n"
        Write-Host "-------------------------------------`n"
        dotnet add package EntityFramework --version 6.4.4 #--package-directory $PackagePath #$DBAccessPath
# Additional Content (not necessary)
        Write-Host "`n-------------------------------------"
        Write-Host "`nthe Entity framework Package has been successfully Installed`n"
        Write-Host "-------------------------------------`n`n`n"
    }
    Set-Location $DBServicesPath
if ($CheckNewtonPath)
    {
# To remove the existing package
        Remove-Item $NewtonPackPath
    } 
else 
    {
    Write-Host "`n-------------------------------------"
    Write-Host "`nInstallation Of NewTonSoft Begins...`n"
    Write-Host "-------------------------------------`n"
        dotnet add package Newtonsoft.Json --version 13.0.1
# Additional Content (not necessary)
        Write-Host "`n-------------------------------------"
        Write-Host "`nthe NewtonSoft Package has been successfully Installed`n"
        Write-Host "-------------------------------------`n`n`n"
    }
}


# Calling the function to check the path for deletion and to install the specified version of the package
Clear-BatFile

# To re-check the existance of the package after deletion
#Write-Host "existance of newtonsoft nuget package: "
if ($CheckEntityPath)
{
    Write-Host "`n`n`nThe Entity FrameWork Exisits in the packages`n`n"
}
else
{
    Write-Host "`n`n`nThe Entity FrameWork Does Not Exisits in the packages`n`n"
}
#Write-Host "existance of Entity Framework nuget package: "
if ($CheckNewtonPath)
{
    Write-Host "`n`n`nThe NewtonSoft Framework Exists in the packages`n`n"
}
else
{
    Write-Host "`n`n`nThe NewtonSoft Framework Does Not Exists in the packages`n`n"
}