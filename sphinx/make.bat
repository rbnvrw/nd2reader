@ECHO OFF

REM Command file for Sphinx documentation

pushd %~dp0

if "%SPHINXBUILD%" == "" (
	set SPHINXBUILD=sphinx-build
)
set BUILDDIR=../docs
set ALLSPHINXOPTS= .

if "%1" == "" goto help

if "%1" == "help" (
	:help
	echo.Please use `make ^<target^>` where ^<target^> is one of
	echo.  html       to make standalone HTML files
	goto end
)

REM Check if sphinx-build is available and fallback to Python version if any
%SPHINXBUILD% 1>NUL 2>NUL
if errorlevel 9009 goto sphinx_python
goto sphinx_ok

:sphinx_python

set SPHINXBUILD=python -m sphinx.__init__
%SPHINXBUILD% 2> nul
if errorlevel 9009 (
	echo.
	echo.The 'sphinx-build' command was not found. Make sure you have Sphinx
	echo.installed, then set the SPHINXBUILD environment variable to point
	echo.to the full path of the 'sphinx-build' executable. Alternatively you
	echo.may add the Sphinx directory to PATH.
	echo.
	echo.If you don't have Sphinx installed, grab it from
	echo.http://sphinx-doc.org/
	exit /b 1
)

:sphinx_ok


if "%1" == "html" (
	%SPHINXBUILD% -b html %ALLSPHINXOPTS% %BUILDDIR%
	if errorlevel 1 exit /b 1
	echo.
	echo.Build finished. The HTML pages are in %BUILDDIR%.
	goto end
)

:end
popd
