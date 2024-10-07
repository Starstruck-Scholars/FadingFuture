@echo off

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

rem Check if the current directory is a Git repository by attempting a Git command
%GIT_EXEC% status > NUL 2>&1
if %errorlevel% == 1 (
  echo Current directory is not a Git repository. Initializing...
  %GIT_EXEC% init
)

rem Add all changed files
%GIT_EXEC% add .

rem Check if there are changes to commit
%GIT_EXEC% status -s > NUL 2>&1
if %errorlevel% == 1 (
  echo No changes to commit. Exiting...
  exit /b
)

rem Commit all changes with message "Update"
%GIT_EXEC% commit -m "Update"

rem Push changes to remote repository
%GIT_EXEC% push %REMOTE_URL%

echo Commit and push successful!