@echo off
@setlocal

set OUTPUT_DIR=build
set MAIN=main_paper.tex

set LATEX_MAKE=latexmk

set WITH_NAME=ibe-tdk-nevvel
set WITHOUT_NAME=ibe-tdk-nev-nelkul

set PDFLATEX_OPTIONS_WITH_NAME=pdflatex %%O \def\printName{1}\input{%%S}
set PDFLATEX_OPTIONS_WITHOUT_NAME=pdflatex %%O \def\printName{0}\input{%%S}

rmdir /q /s %OUTPUT_DIR%

mkdir %OUTPUT_DIR%

:: Build with name
%LATEX_MAKE% -f -pdf -pdflatex="%PDFLATEX_OPTIONS_WITH_NAME%" -jobname=%OUTPUT_DIR%/%WITH_NAME%  %MAIN%

%LATEX_MAKE% -c -f -jobname=%OUTPUT_DIR%/%WITH_NAME%  %MAIN%

:: Build without name
:: Only if a parameter was passed. Don't care what its value actually is.
if  "%~1" NEQ "" (
  %LATEX_MAKE% -f -pdf -pdflatex="%PDFLATEX_OPTIONS_WITHOUT_NAME%" -jobname=%OUTPUT_DIR%/%WITHOUT_NAME%  %MAIN%

  %LATEX_MAKE% -c -f -jobname=%OUTPUT_DIR%/%WITHOUT_NAME%  %MAIN%
)

