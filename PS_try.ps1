# Declaring variable for assigning path
$DAPath = "D:\repo old\AutomatePractice\DataAccess\DataAccess.DB" # used in cd command for Data.Access
$DSPath = "D:\repo old\AutomatePractice\Services.DB\DB.Services\" # used in cd command for Data.Services
$DAPackagePath = "C:\Users\niraimathi.kgc\.nuget\packages\DataAccess.nuget" # used in nuget pack command in Data.Access
$DSBuildPath = "D:\repo old\AutomatePractice\Services.DB\DB.Services\bin\release\net5.0" # used in build command in Data.Service
$DABuildPath = "D:\repo old\AutomatePractice\DataAccess\DataAccess.DB\bin\release\net5.0" # used in build command in Data.Access
#$BinPath = "D:\repo old\AutomatePractice\DataAccess\DataAccess.DB\nupkgs"
$DSPackagePath = "C:\Users\niraimathi.kgc\.nuget\packages\DataService.nuget" # used in nuget pack command in Data.Service


# Configure and pack in Data.Access Project
Set-Location $DAPath
#nuget spec DataAccess.DB.csproj
dotnet clean
dotnet build #-o $DABuildPath # -c Configuration=release
nuget pack #-Properties Configuration=release -OutputDirectory $DAPackagePath

# Configure and pack in Data.Service Project
Set-Location $DSPath
#nuget spec DB.Services.csproj
dotnet clean
dotnet build #-o $DSBuildPath
nuget pack #"DB.Services.csproj" #-Properties Configuration=release -OutputDirectory $DSPackagePath