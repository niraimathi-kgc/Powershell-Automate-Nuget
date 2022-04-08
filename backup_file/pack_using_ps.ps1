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
