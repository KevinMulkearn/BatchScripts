@echo off

echo Starting...
echo.

Rem Get current directory
set myDir=%cd%

Rem Delete directory if it exists
if exist %myDir%\All\ (
	echo Deleting Folder "All"
	echo.
	RMDIR /s /q %myDir%\All\
)

Rem Create new folder
if not exist %myDir%\All\ (
	echo Creating Folder "All"
	echo.
	MKDIR %myDir%\All\
)

rem Copy all files found to All directory, excluding file/folder(s) specified
for /r %myDir% %%x in (*) do @xcopy "%%x" /y %myDir%\All /EXCLUDE:%myDir%\list_of_file_exclusions.txt

echo Finished Successfully
echo.

pause