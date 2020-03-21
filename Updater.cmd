cd stk-assets
svn update

cd ..\stk-code
git checkout master
git pull origin master


cd ..\dependencies
git checkout master
git pull origin master
cd..

xcopy /s /y /i "dependencies\windows_64bit\dependencies" "stk-code\dependencies-64bit"
cd stk-code\build
cmake.exe ..

msbuild.exe SuperTuxKart.sln /t:Rebuild /p:Configuration=Release
pause
