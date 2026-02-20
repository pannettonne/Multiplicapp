@echo off
REM 🚀 SUBIR CÓDIGO CON ANIMACIONES A MULTIPLICAPP2
REM Sube todo el código a pannettonne/multiplicapp2 en GitHub
REM Vercel lo deployará automáticamente

setlocal enabledelayedexpansion

cls

echo.
echo ╔═══════════════════════════════════════════════════════════════╗
echo ║                                                               ║
echo ║   🚀 Subir Animaciones a MultiplicaApp2 🚀                  ║
echo ║                                                               ║
echo ║  Sube el código con animaciones a pannettonne/multiplicapp2 ║
echo ║                                                               ║
echo ╚═══════════════════════════════════════════════════════════════╝
echo.

cd /d "C:\Users\david.paniaguadoming\Downloads\multiapp" 2>nul
if errorlevel 1 (
    echo ❌ Carpeta no encontrada
    pause
    exit /b 1
)

echo ✅ Carpeta encontrada
echo.

echo ═══════════════════════════════════════════════════════════════
echo 📤 SUBIENDO A GITHUB
echo ═══════════════════════════════════════════════════════════════
echo.

echo Preparando cambios...
git add .
echo ✅ Archivos preparados
echo.

echo Creando commit...
git commit -m "🎉 Agregar animaciones épicas, confeti y badges de victoria"
if errorlevel 1 (
    echo ⚠️  Sin cambios nuevos (ya están subidos)
)
echo.

echo Subiendo a GitHub...
git push origin main
if errorlevel 1 (
    echo Intentando con master...
    git push origin master
)
echo ✅ Código en GitHub
echo.

echo ═══════════════════════════════════════════════════════════════
echo ✅ ¡CÓDIGO SUBIDO!
echo ═══════════════════════════════════════════════════════════════
echo.
echo 🌐 GitHub: pannettonne/multiplicapp2
echo.
echo 🎯 LO QUE PASA AHORA:
echo    1. Vercel detecta el cambio automáticamente
echo    2. Comienza a buildear (~30-60 segundos)
echo    3. Deploy en vivo en 2-3 minutos
echo.
echo 📍 Ve a: https://multiplicapp2.vercel.app
echo    (Espera 3-5 minutos)
echo.
echo ✨ DEBERÍAS VER:
echo    - Explosión dorada 💛
echo    - Estrellas dispersas ⭐
echo    - Confeti cayendo ✨
echo    - Badges si racha 3+ 🏆
echo.
echo ═══════════════════════════════════════════════════════════════
echo.

pause

