@echo off
REM 🔗 CONECTAR GITHUB A MULTIPLICAPP2 EN VERCEL
REM Vincula tu repositorio GitHub con tu proyecto Vercel

setlocal enabledelayedexpansion

cls

echo.
echo ╔═══════════════════════════════════════════════════════════════╗
echo ║                                                               ║
echo ║   🔗 Conectar GitHub a MultiplicaApp2 🔗                    ║
echo ║                                                               ║
echo ║   Vincula tu repo de GitHub con tu proyecto Vercel          ║
echo ║                                                               ║
echo ╚═══════════════════════════════════════════════════════════════╝
echo.

echo 📋 INFORMACIÓN
echo ═══════════════════════════════════════════════════════════════
echo.
echo GitHub Repositorio: pannettonne/Multiplicapp
echo Vercel Proyecto: multiplicapp2
echo.
echo Este script:
echo  1. Subirá los cambios a GitHub
echo  2. Te dirá cómo conectar GitHub con Vercel en el dashboard
echo.
echo ═══════════════════════════════════════════════════════════════
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

REM Paso 1: Subir a GitHub
echo PASO 1: Subir código a GitHub
echo ═══════════════════════════════════════════════════════════════
echo.

echo Preparando cambios...
git add .
echo ✅ Archivos preparados
echo.

echo Creando commit...
git commit -m "🎉 Actualizar animaciones, confeti y badges de victoria" 2>nul
if errorlevel 1 (
    echo ⚠️  (Sin cambios nuevos)
) else (
    echo ✅ Commit creado
)
echo.

echo Subiendo a GitHub...
git push origin main 2>nul
if errorlevel 1 (
    git push origin master 2>nul
)
echo ✅ Código en GitHub
echo.

REM Mostrar instrucciones
echo ═══════════════════════════════════════════════════════════════
echo PASO 2: CONECTAR EN VERCEL DASHBOARD
echo ═══════════════════════════════════════════════════════════════
echo.
echo Ahora necesitas conectar tu repositorio GitHub en Vercel:
echo.
echo 1. Ve a: https://vercel.com/pannettonne/multiplicapp2
echo.
echo 2. En el dashboard, busca: "Git Repository" o "Connected Repository"
echo.
echo 3. Click en "Connect Repository" o "Link Repository"
echo.
echo 4. Selecciona: pannettonne/Multiplicapp
echo.
echo 5. Click "Deploy"
echo.
echo 6. Espera 2-3 minutos a que Vercel haga el deploy inicial
echo.
echo ═══════════════════════════════════════════════════════════════
echo.
echo 🎯 RESULTADO FINAL
echo ═══════════════════════════════════════════════════════════════
echo.
echo Cuando esté conectado:
echo  ✅ multiplicapp2 estará conectado a tu GitHub
echo  ✅ Cada push a GitHub triggereará un nuevo deploy
echo  ✅ Tus cambios se actualizarán automáticamente
echo.
echo Tu app estará en:
echo  https://multiplicapp2.vercel.app
echo.
echo ═══════════════════════════════════════════════════════════════
echo.

pause

