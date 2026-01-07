@echo off
echo Lancement des tests unitaires (shim)...
if exist lancer_tests_unitaire.bat (
    call lancer_tests_unitaire.bat
    if errorlevel 1 exit /b 1
) else (
    echo ERREUR: lancer_tests_unitaire.bat introuvable.
    exit /b 1
)