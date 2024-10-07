@echo on
cd %1

rem Check if git is installed
git --version > NUL 2>&1
if %errorlevel% == 1 (
  echo Git is not installed! Please install Git and try again.
  exit /b 1
)

rem Set the Git executable path (modify if needed)
set GIT_EXEC="C:\Program Files\Git\bin\git.exe"

rem Set the remote repository URL
set REMOTE_URL=https://github.com/Starstruck-Scholars/FadingFuture.git

rem Get the current script's filename
set SCRIPT_NAME=%~f0

rem Check if the current directory is a Git repository by attempting a Git command
%GIT_EXEC% status > NUL 2>&1
if %errorlevel% == 1 (
  echo Current directory is not a Git repository. Initializing...
  %GIT_EXEC% init
)

rem Delete the error.log file (if it exists)
if exist error.log del error.log

rem Add all changed files except the script itself
%GIT_EXEC% add . 
git reset -- update.bat
git reset -- .gitignore
git reset -- run.bat

rem Commit all changes with message "Update"
%GIT_EXEC% commit -a --allow-empty-message 

rem Push changes to remote repository
git push -u origin main -f

echo Commit and push successful!