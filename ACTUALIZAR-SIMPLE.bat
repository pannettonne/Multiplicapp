@echo off
REM 🎉 ACTUALIZAR ANIMACIONES - VERSIÓN SIMPLE
REM Basado en lo que funcionó: DEPLOY-TODO-YA.bat
REM Este script sube los cambios nuevos a GitHub

setlocal enabledelayedexpansion

cls

echo.
echo ╔═══════════════════════════════════════════════════════════════╗
echo ║                                                               ║
echo ║   🎉 Actualizar MultiplicaApp - Versión Simple 🎉           ║
echo ║                                                               ║
echo ║              (Como DEPLOY-TODO-YA.bat pero simple)          ║
echo ║                                                               ║
echo ╚═══════════════════════════════════════════════════════════════╝
echo.

REM Cambiar a la carpeta del proyecto
cd /d "C:\Users\david.paniaguadoming\Downloads\multiapp" 2>nul
if errorlevel 1 (
    echo ❌ No se encontró la carpeta del proyecto
    echo    Ruta: C:\Users\david.paniaguadoming\Downloads\multiapp
    pause
    exit /b 1
)

echo ✅ Carpeta del proyecto encontrada
echo.

REM Mostrar estado
echo ═══════════════════════════════════════════════════════════════
echo 📊 ESTADO ACTUAL
echo ═══════════════════════════════════════════════════════════════
git status
echo.

REM Preguntar confirmación
echo ¿Deseas continuar con la actualización? (S/N)
set /p CONTINUAR="Respuesta: "
if /i not "%CONTINUAR%"=="S" (
    echo Cancelado
    pause
    exit /b 0
)

echo.
echo ═══════════════════════════════════════════════════════════════
echo 🔄 SUBIENDO CAMBIOS
echo ═══════════════════════════════════════════════════════════════
echo.

REM Paso 1: Agregar cambios
echo PASO 1: Preparando archivos...
git add .
echo ✅ Archivos preparados
echo.

REM Paso 2: Hacer commit
echo PASO 2: Creando commit...
git commit -m "🎉 Actualizar animaciones, confeti y badges de victoria"
if errorlevel 1 (
    echo ⚠️  (Sin cambios nuevos que commitear)
    echo    Saltando a push directo...
)
echo.

REM Paso 3: Push a main
echo PASO 3: Subiendo a GitHub (rama main)...
git push origin main
if errorlevel 1 (
    echo.
    echo ⚠️  Error con 'main', intentando con 'master'...
    git push origin master
    if errorlevel 1 (
        echo.
        echo ❌ Error al hacer push
        echo    Los cambios pueden estar listos pero no se subieron
        echo.
        echo    Intenta manualmente:
        echo    Terminal: git push origin main
        echo.
        pause
        exit /b 1
    )
)

echo.
echo ═══════════════════════════════════════════════════════════════
echo ✅ ¡ACTUALIZACIÓN COMPLETADA!
echo ═══════════════════════════════════════════════════════════════
echo.
echo 🌐 Cambios subidos a GitHub
echo.
echo 🎯 LO QUE PASA AHORA:
echo    1. Vercel detecta los cambios automáticamente
echo    2. Comienza a buildear (~30-60 segundos)
echo    3. Deploy en vivo en 2-3 minutos
echo.
echo 📍 Ve a: https://multiplicapp.vercel.app
echo    (Espera 3-5 minutos después de este script)
echo.
echo 🔄 Para ver el progreso:
echo    1. Ve a: https://vercel.com
echo    2. Abre tu proyecto "Multiplicapp"
echo    3. Mira "Deployments" → Nuevo deploy en progreso
echo.
echo ═══════════════════════════════════════════════════════════════
echo.

pause

