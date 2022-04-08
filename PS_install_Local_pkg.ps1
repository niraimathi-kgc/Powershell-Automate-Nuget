$SolnPath = "D:\repo old\AutomatePractice\Services.DB\DB.Services"
$DAPackPath = "C:\Users\niraimathi.kgc\.nuget\packages\DataAccess.nuget"
$DSPackPath = "C:\Users\niraimathi.kgc\.nuget\packages\DataService.nuget"
$CheckDS = Test-Path $DSPackPath
$CheckDA = Test-Path $DAPackPath

function Add-LocalPackage
{
   # if ($CheckDA)
   # {
   #     dotnet add package DataAccess.DB.1.0.0.nupkg
   # }
   # else
   # {
   #     Write-Host "`n The Local DataAccess.DB Package Does not Exist... Pack Properly"
   # }
   Set-Location $SolnPath
    if ($CheckDS)
    {
        dotnet add package C://Users//niraimathi.kgc//.nuget//packages//DataAccess.nuget//DataAccess.DB.1.0.0.nupkg --version 1.0.0
    }
    else
    {
        Write-Host "`n The Local DB.Services Package Does not Exist... Pack Properly"
    }
}

Add-LocalPackage