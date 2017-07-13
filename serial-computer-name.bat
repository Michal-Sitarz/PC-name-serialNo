@ECHO OFF

REM // change computername

ECHO %COMPUTERNAME%

SET newName=TokName123

wmic computersystem where name="%COMPUTERNAME%" call rename name="%newName%"

ECHO %COMPUTERNAME%