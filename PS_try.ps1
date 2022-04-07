$CurPath = "D:\repo old\Services.DB\DB.Services"
$PackPath = "C:\Users\niraimathi.kgc\.nuget\packages\newtonsoft.json"
$CheckPath = Test-Path -path $PackPath
#cd $CurPath
#dotnet nuget add packages\entityframework
#dotnet add package EntityFramework --version 6.4.4 --package-directory $CurPath
#function Delete-BatFile {
if ($CheckPath){
Remove-Item $PackPath
}
#Delete-BatFile
Test-Path -path $PackPath