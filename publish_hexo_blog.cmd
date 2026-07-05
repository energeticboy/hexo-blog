@echo off
setlocal EnableExtensions

set "BLOG_DIR=H:\Jlauer\my_blog\first_blog"

cd /d "%BLOG_DIR%"
if errorlevel 1 (
  echo Failed to enter blog directory: %BLOG_DIR%
  pause
  exit /b 1
)

where git >nul 2>nul
if errorlevel 1 (
  echo Git is not installed or not in PATH.
  pause
  exit /b 1
)

git rev-parse --is-inside-work-tree >nul 2>nul
if errorlevel 1 (
  echo This folder is not a Git repository: %BLOG_DIR%
  pause
  exit /b 1
)

for /f "delims=" %%I in ('powershell -NoProfile -Command "Get-Date -Format 'yyyy-MM-dd HH:mm:ss'"') do set "NOW=%%I"
if not defined NOW set "NOW=%date% %time%"

set "COMMIT_MSG=auto add essay in %NOW%"

echo Blog directory: %BLOG_DIR%
echo Commit message: %COMMIT_MSG%
echo.

git add .
if errorlevel 1 (
  echo git add failed.
  pause
  exit /b 1
)

git diff --cached --quiet
set "DIFF_EXIT=%ERRORLEVEL%"

if "%DIFF_EXIT%"=="0" (
  echo No changes to commit.
  pause
  exit /b 0
)

if not "%DIFF_EXIT%"=="1" (
  echo Failed to check staged changes.
  pause
  exit /b %DIFF_EXIT%
)

git commit -m "%COMMIT_MSG%"
if errorlevel 1 (
  echo git commit failed.
  pause
  exit /b 1
)

git push
if errorlevel 1 (
  echo git push failed.
  echo If GitHub has newer commits, run: git pull --rebase
  pause
  exit /b 1
)

echo.
echo Upload completed. GitHub Actions will deploy the blog automatically.
echo Actions: https://github.com/energeticboy/hexo-blog/actions
echo Blog: https://energeticboy.github.io/hexo-blog/
pause

exit /b 0
