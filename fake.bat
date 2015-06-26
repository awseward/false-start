@echo off

set FAKE_ARGS=%*

:: Install paket if necessary
IF NOT EXIST ".fake\packages\Paket\tools\paket.exe" (
 "NuGet.exe" "Install" "paket" -"OutputDirectory" ".fake\packages" "-ExcludeVersion"
)

:: Bootstrap Fake via Paket
cd ".fake"
"packages\Paket\tools\paket.exe" "install"
cd ".."

:: Run Fake task
".fake\packages\FAKE\tools\FAKE.exe" "build.fsx" %FAKE_ARGS%
