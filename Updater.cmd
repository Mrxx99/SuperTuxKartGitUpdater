cd stk-assets
svn update

cd ..\stk-code
git pull upstream master
git checkout upstream/master

cd ..\dependencies
git pull origin master
git checkout origin/master
cd ..
xcopy /s /y /i "dependencies\windows_64bit\dependencies" "stk-code\dependencies-64bit"
cd stk-code\build
cmake.exe ..	
cd ..

REM TODO: check if dependencies are uptodate and only copy and cmake if not
cd ..\dependencies
for /f %%i in ('git pull origin master') do set codeOut=%%i
git checkout origin/master
cd..
REM IF NOT "codeOut"=="Already" (
REM	xcopy /s /y /i "dependencies\windows_64bit\dependencies" "stk-code\dependencies-64bit"
REM	cd stk-code\build
REM	cmake.exe ..	
REM	cd ..\..
REM )

msbuild.exe stk-code\build\SuperTuxKart.sln /t:Build /p:Configuration=Release
pause
