@echo off
REM
REM   Copyright 2018 Chrisdigity
REM
REM   Licensed under the Apache License, Version 2.0 (the "License");
REM   you may not use this file except in compliance with the License.
REM   You may obtain a copy of the License at
REM
REM     http://www.apache.org/licenses/LICENSE-2.0
REM
REM   Unless required by applicable law or agreed to in writing, software
REM   distributed under the License is distributed on an "AS IS" BASIS,
REM   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
REM   See the License for the specific language governing permissions and
REM   limitations under the License.
REM
REM #####################################################################
REM
REM   Mochimo CLI Wallet Compiler Script for Windows - v1.0.0 by Chrisdigity
REM
REM Prerequisites: Embarcadero 10.1 Berlin Compiler ( bcc32c )
REM
REM To use this compile script
REM  - Download the compiler listed in the "Prerequisites"
REM  - Place this script and the BCC101 folder into the "src" directory
REM    of the mochimo package
REM  - Double-click makewal.bat
REM
REM ##############
REM Sanity Checks
   if NOT exist BCC101\bin\bcc32c.exe goto nocompiler
   if NOT exist wallet.c goto nowallet

REM #################
REM Preconfiguration
REM Edit the CC variable to suit your system: 
   set CC=BCC101\bin\bcc32c.exe -DWIN32 -w-
   set errors=0
   set warnings=0
   title Mochimo CLI Wallet Compile Script for Windows
   echo.

REM ########
REM Command
   if exist ccerror.log del ccerror.log
   echo Building wallet...
   >ccerror.log 2>&1 (
      REM Make SHA256
      %CC% -c crypto/sha256.c
      REM Make WOTS+
      %CC% -c crypto/wots/wots.c
      REM Make Wallet
      %CC% wallet.c wots.obj sha256.obj
   )
   for /f "tokens=2delims=:" %%a in ('find /c "error:" ccerror.log') do @set /a errors+=%%a
   for /f "tokens=2delims=:" %%a in ('find /c "warning:" ccerror.log') do @set /a warnings+=%%a
   if %errors% gtr 0 goto checkerrors
   if %warnings% gtr 0 goto checkerrors
   echo Done. No errors.
:cleanup
   REM Cleanup compilation files
   if exist sha256.obj del sha256.obj
   if exist wots.obj del wots.obj
   if exist wallet.tds del wallet.tds
   goto end

REM #######
REM Errors
:checkerrors
   echo ccerror.log contains:
   echo %errors% Errors
   echo %warnings% Warnings
   echo   check the log for details - mochimo/src/ccerror.log
   goto cleanup
:nocompiler
   echo Error: cannot find bcc32c.exe
   echo Check that you have downloaded the Embarcadero 10.1 Berlin Compiler
   echo and place the BCC101 folder in the mochimo package source directory
   goto end
:nowallet
   echo Error: cannot find wallet.c
   echo Check you are in the mochimo package source directory
   goto end

REM ####
REM END
:end
   echo.
   pause
   exit
