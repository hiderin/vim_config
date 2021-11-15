@echo off

if "%2" == "-name" (
dir %1 /s /b | find "%3"
exit
)
if "%2" == "-file" (
dir %1 /s /b %3
exit
)
if "-file" == "-file" (
echo unknown option '%2'
)
