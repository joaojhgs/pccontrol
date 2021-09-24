ECHO OFF
SET Timer=1
SET Action=
SET Executed=

:loopVerify

REM GET THE DATABASE INFO
for /f "tokens=*" %%a in ('curl -s https://teste-1135e.firebaseio.com/data/action.json') do SET Action=%%a >> nul
for /f "tokens=*" %%a in ('curl -s https://teste-1135e.firebaseio.com/data/executed.json') do SET Executed=%%a >> nul

rem echo %Action%
rem ECHO.
rem echo %Executed%

REM VERIFY IF THE ACTION HAVE ALREADY BEEN EXECUTED, AND IF IT DOESN'T, VERIFIES AND EXECUTE THE ACTION
REM YOU CAN ADD YOUR CUSTOM ACTIONS HERE, JUST COPY ONE "IF" STRUCTURE, REPLACE THE ACTION WITH THE ONE YOU HAVE SET ON YOUR HTTP REQUEST, AND CONFIGURE WHICH COMMANDS THE CLI SHOULD EXECUTE
if %Executed%=="false" (
if %Action% == "restart" (
curl -X PUT -d "{\"action\": \"%Action%\", \"executed\": \"true\"}" https://teste-1135e.firebaseio.com/data.json
shutdown -s -t 10)

if %Action% == "shutdown" (
curl -X PUT -d "{\"action\": \"%Action%\", \"executed\": \"true\"}" https://teste-1135e.firebaseio.com/data.json
shutdown)

if %Action% == "volUp" (
curl -X PUT -d "{\"action\": \"%Action%\", \"executed\": \"true\"}" https://teste-1135e.firebaseio.com/data.json
nircmd changesysvolume 5000)

if %Action% == "volDown" (
curl -X PUT -d "{\"action\": \"%Action%\", \"executed\": \"true\"}" https://teste-1135e.firebaseio.com/data.json
nircmd changesysvolume -5000)

)

REM YOU CAN ADD A TIMER FOR YOUR VERIFICATION LOOP, IT'LL MAKE THE TRAY PROCESS USE LESS MEMORY AND CPU, BUT DO REMEMBER THAT THE CURL PROCESS ALREADY TAKE FROM 2 TO 5 SECONDS, AND THE HIGHER YOUR LATENCY, THE HIGHER THE DELAY TO YOUR COMMAND BEING EXECUTED
REM TIMEOUT /t %Timer% /nobreak >> nul
GOTO loopVerify



REM curl -X PUT -d "{\"executed\": \"true\"}" https://teste-1135e.firebaseio.com/status.json
REM curl -X PUT -d "{\"action\": \"shutdown\"}" https://teste-1135e.firebaseio.com/actions.json

REM curl -X PUT -d "{\"action\": \"shutdown\", \"executed\": \"true\"}" https://teste-1135e.firebaseio.com/data.json