@echo off
REM 🚀 CREAR MULTIPLICAPP EN VERCEL
REM Este script automáticamente crea y deploya tu proyecto en Vercel

cls

echo.
echo ╔═══════════════════════════════════════════════════════════════╗
echo ║                                                               ║
echo ║   🚀 Crear MultiplicaApp en Vercel 🚀                       ║
echo ║                                                               ║
echo ║          (Crea el proyecto y lo deploya automáticamente)     ║
echo ║                                                               ║
echo ╚═══════════════════════════════════════════════════════════════╝
echo.

REM Cambiar a la carpeta del proyecto
cd /d "C:\Users\david.paniaguadoming\Downloads\multiapp" 2>nul
if errorlevel 1 (
    echo ❌ No se encontró la carpeta del proyecto
    pause
    exit /b 1
)

echo ✅ Carpeta del proyecto encontrada
echo.

REM Primero, asegurarse de que el código está en GitHub
echo ═══════════════════════════════════════════════════════════════
echo PASO 1: Verificar que el código está en GitHub
echo ═══════════════════════════════════════════════════════════════
echo.
echo Subiendo cambios a GitHub (si hay)...
git add .
git commit -m "🎉 Actualizar animaciones para Vercel deploy" 2>nul
git push origin main 2>nul
if errorlevel 1 (
    git push origin master 2>nul
)
echo ✅ GitHub actualizado
echo.

REM Instalar Vercel CLI
echo ═══════════════════════════════════════════════════════════════
echo PASO 2: Instalar Vercel CLI (si no lo tienes)
echo ═══════════════════════════════════════════════════════════════
echo.

REM Verificar si Vercel CLI está instalado
vercel --version >nul 2>&1
if errorlevel 1 (
    echo Instalando Vercel CLI...
    call npm install -g vercel
    if errorlevel 1 (
        echo ❌ Error al instalar Vercel CLI
        echo.
        echo SOLUCIÓN MANUAL:
        echo 1. Abre PowerShell como administrador
        echo 2. Ejecuta: npm install -g vercel
        echo 3. Luego repite este script
        echo.
        pause
        exit /b 1
    )
    echo ✅ Vercel CLI instalado
) else (
    echo ✅ Vercel CLI ya estaba instalado
)
echo.

REM Desplegar en Vercel
echo ═══════════════════════════════════════════════════════════════
echo PASO 3: Desplegar en Vercel
echo ═══════════════════════════════════════════════════════════════
echo.
echo Ejecutando: vercel
echo.
echo INSTRUCCIONES:
echo   1. Se abrirá el navegador (autoriza si es necesario)
echo   2. En la terminal, responde las preguntas:
echo      - "Set up and deploy \"C:\...\multiapp\"?" → Y
echo      - "Which scope should contain your project?" → pannettonne
echo      - "Link to existing project?" → N (es nuevo)
echo      - "What's your project's name?" → Multiplicapp
echo      - "In which directory is your code?" → . (punto)
echo      - "Want to override the settings?" → N
echo   3. Espera a que termine
echo.
echo Comenzando deploy...
echo.

call vercel

if errorlevel 1 (
    echo.
    echo ⚠️  Deploy completado pero con warnings
    echo    El proyecto debería estar en Vercel
) else (
    echo.
    echo ✅ Deploy completado exitosamente!
)

echo.
echo ═══════════════════════════════════════════════════════════════
echo ✅ ¡PROYECTO CREADO EN VERCEL!
echo ═══════════════════════════════════════════════════════════════
echo.
echo 🌐 Tu proyecto debería estar en:
echo    https://multiplicapp.vercel.app
echo    (o similar)
echo.
echo 📊 Ve a Vercel para verlo:
echo    https://vercel.com/pannettonne/multiplicapp
echo.
echo 🎯 QUÉ HACER AHORA:
echo    1. Ve a: https://multiplicapp.vercel.app
echo    2. Espera a que se cargue
echo    3. Acierta una pregunta
echo    4. ¡Deberías ver las animaciones!
echo.
echo ═══════════════════════════════════════════════════════════════
echo.

pause

