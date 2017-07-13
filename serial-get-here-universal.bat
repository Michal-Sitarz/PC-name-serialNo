@ECHO OFF
REM /* Author: Michal Sitarz � June 2017 � Tokheim IT Department
REM  *
REM  * Description:
REM  * Small script to obtain a serial number 
REM  * from Windows based OS computers.
REM  */

REM /// get SERIAL NUMBER functionality
REM ===================================

REM // obtain a value of a serial number 
REM // and set it to the variable: %serial%
FOR /f "tokens=2 delims==" %%f IN ('wmic bios get serialnumber /value ^| find "="') DO SET "serial=%%f"


REM -----------------------------------------------------------
REM --- add prefix depending on the computer manufacturer:  ---
REM --- H for HP, D for Dell								---
REM -----------------------------------------------------------

REM // check the manufacturer
FOR /f "tokens=2 delims==" %%m IN ('wmic bios get manufacturer /value ^| find "="') DO SET "manufacturer=%%m"


SET prefix=%manufacturer%

REM // merge prefix with generated serial number
SET serial=%prefix%%serial%


REM /// CLIPBOARD functionality
REM ===========================
REM // output the variable %serial% to the clipboard
@ECHO %serial% | clip


REM /// FILE SAVE functionality
REM ===========================
REM // set the path to the current directory
SET currPath=%~dp0

REM // set file name
SET path="%currPath%serial.txt"

REM // check if the file exist: delete it, if does
IF EXIST %path% DEL %path%

REM // output the variable %serial% into a file
@ECHO %serial% >> %path%
