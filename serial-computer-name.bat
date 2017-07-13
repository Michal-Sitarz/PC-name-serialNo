@ECHO OFF

REM // change computername

ECHO %COMPUTERNAME%

SET bang=TokName123

wmic computersystem where name="%COMPUTERNAME%" call rename name="%bang%"

ECHO %COMPUTERNAME%