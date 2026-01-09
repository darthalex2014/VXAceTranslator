@echo off
setlocal
echo Starting Build Process (2026 Edition)...

:: --- AUTO-DETECT RUBY FOLDER ---
set RUBY_EXE=

:: 1. Check for standard "ruby" folder
if exist "ruby\bin\ruby.exe" (
    set RUBY_EXE=ruby\bin\ruby.exe
    goto :FOUND
)

:: 2. Check for "rubyinstaller-2.7.8-1-x64" (direct extraction)
if exist "rubyinstaller-2.7.8-1-x64\bin\ruby.exe" (
    set RUBY_EXE=rubyinstaller-2.7.8-1-x64\bin\ruby.exe
    goto :FOUND
)

:: 3. Check for double folder "rubyinstaller-2.7.8-1-x64\rubyinstaller-2.7.8-1-x64" (messy extraction)
if exist "rubyinstaller-2.7.8-1-x64\rubyinstaller-2.7.8-1-x64\bin\ruby.exe" (
    set RUBY_EXE=rubyinstaller-2.7.8-1-x64\rubyinstaller-2.7.8-1-x64\bin\ruby.exe
    goto :FOUND
)

:NOT_FOUND
echo [ERROR] Could not find Portable Ruby!
echo Please download 'rubyinstaller-2.7.8-1-x64.7z' and extract it here.
echo Supported folder names: 'ruby', 'rubyinstaller-2.7.8-1-x64'.
pause
exit /b

:FOUND
echo [OK] Found Ruby at: %RUBY_EXE%

:: Calculate DLL path based on found Ruby path (removing "\bin\ruby.exe")
set RUBY_ROOT=%RUBY_EXE:\bin\ruby.exe=%

:: --- START OCRA BUILD ---
:: Note: --dll paths must be relative to the ruby/bin folder of the interpreter used!
"%RUBY_EXE%" "Modules/Ocra/bin/ocra.rb" VXAceTranslator.rb --no-autoload --console --icon "Resources/Icons/Icon.ico" --dll "ruby_builtin_dlls/libgmp-10.dll" --dll "ruby_builtin_dlls/zlib1.dll" --output "VXAceTranslator.exe"

echo.
echo Build finished! Check VXAceTranslator.exe
pause