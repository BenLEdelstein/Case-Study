@echo off
echo Welcome to the Guided Setup!
echo Please prepare your database connection prior to start and have the following ready:
echo Listener-Port, SID, USERNAME, PASSWORD
echo NOTE: This script is intended for a local instance of Oracle 12c
echo.
echo.

::Gather values for configuration
set /p uinput=Press Enter to continue...
set /p port=Port:
set /p sid=SID:
set /p dbusername=Username:
set /p dbpassword=Password:
echo.
echo.

::Setup for primary database administrator and user
echo The database will setup a primary database administrator, and a default user account.
echo More administrators can be inserted manually at any time with the following Insert statement:
echo INSERT INTO LOGINS VALUES (USERNAME, PASSWORD, 'ADMIN');
echo Please enter the desired username and password for the ADMINISTRATOR.
echo.
echo.
set/p adminusername=Admin Username:
set/p adminpassword=Admin Password:
echo.
echo Please enter the desired username and password for the DEFAULT USER
echo.
echo.
set/p defaultusername=Default Username:
set/p defaultpassword=Default Password:
echo.
echo Executing Database Initialization Script...
echo exit | sqlplus %dbusername%/%dbpassword% @"%cd%\database_initialize_script.sql" '%adminusername%' '%adminpassword%' '%defaultusername%' '%defaultpassword%'
echo Done

::Edit Configuration Files
echo Editing Project Properties...

::Edit dp.properties File
mkdir HomeInsurance_For_Students\src\com\cts\insurance\homequote\resources\
@echo driver=oracle.jdbc.driver.OracleDriver>HomeInsurance_For_Students\src\com\cts\insurance\homequote\resources\db.properties
@echo url=jdbc:oracle:thin:@localhost:%port%:%sid%>>HomeInsurance_For_Students\src\com\cts\insurance\homequote\resources\db.properties
@echo user=%dbusername%>>HomeInsurance_For_Students\src\com\cts\insurance\homequote\resources\db.properties
@echo password=%dbpassword%>>HomeInsurance_For_Students\src\com\cts\insurance\homequote\resources\db.properties

:: Choose directory for Logs using windows powershell command
setlocal
set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0, 'Please choose a folder for Logs.',0,0).self.path""
for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "folder=%%I"
setlocal enabledelayedexpansion

set path=%folder:\=/%

::Edit log4j.properties File
mkdir HomeInsurance_For_Students\WebContent\WEB-INF\
@echo log4j.rootLogger=INFO,File>HomeInsurance_For_Students\WebContent\WEB-INF\log4j.properties
@echo log4j.appender.File=org.apache.log4j.RollingFileAppender>>HomeInsurance_For_Students\WebContent\WEB-INF\log4j.properties
@echo log4j.appender.File.File=%path%/log/homequote.log>>HomeInsurance_For_Students\WebContent\WEB-INF\log4j.properties
@echo log4j.appender.File.MaxFileSize=2MB>>HomeInsurance_For_Students\WebContent\WEB-INF\log4j.properties
@echo log4j.appender.File.MaxBackupIndex=2>>HomeInsurance_For_Students\WebContent\WEB-INF\log4j.properties
@echo log4j.appender.File.layout=org.apache.log4j.PatternLayout>>HomeInsurance_For_Students\WebContent\WEB-INF\log4j.properties
@echo log4j.appender.File.layout.ConversionPattern=%%p %%t %%c - %%m%%n>>HomeInsurance_For_Students\WebContent\WEB-INF\log4j.properties
endlocal

zip HomeInsurance_For_Students.zip HomeInsurance_For_Students\WebContent\WEB-INF\log4j.properties
zip HomeInsurance_For_Students.zip HomeInsurance_For_Students\src\com\cts\insurance\homequote\resources\db.properties

rd /S /Q HomeInsurance_For_Students

echo Done
set /p uinput=Press Enter to exit