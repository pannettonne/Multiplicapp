@echo off
REM 🚀 MULTIPLICAPP - DEPLOYMENT DEFINITIVO TODO EN UNO
REM Este script hace ABSOLUTAMENTE TODO
REM Uso: DEPLOY-TODO-YA.bat

setlocal enabledelayedexpansion

cls

echo.
echo ╔═════════════════════════════════════════════════════════════╗
echo ║     🚀 MultiplicaApp - Deploy Definitivo 🚀                ║
echo ║                                                             ║
echo ║         ESTE SCRIPT LO HACE TODO POR TI                    ║
echo ╚═════════════════════════════════════════════════════════════╝
echo.

REM Verificar que Git existe
git --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Git no está instalado
    echo    Descargalo desde: https://git-scm.com
    pause
    exit /b 1
)

echo ✅ Git encontrado
echo.

REM Variables
set GITHUB_USER=pannettonne
set REPO_NAME=Multiplicapp
set REPO_URL=https://github.com/!GITHUB_USER!/!REPO_NAME!.git

echo ═══════════════════════════════════════════════════════════════
echo 🎯 INFORMACIÓN DEL DEPLOYMENT
echo ═══════════════════════════════════════════════════════════════
echo.
echo 👤 GitHub User: !GITHUB_USER!
echo 📦 Repository: !REPO_NAME!
echo 🌐 URL: !REPO_URL!
echo.

REM Paso 1: Git init
echo ───────────────────────────────────────────────────────────────
echo PASO 1: Inicializando Git...
echo ───────────────────────────────────────────────────────────────
echo.

if not exist .git (
    echo Inicializando repositorio...
    call git init
    call git config user.name "!GITHUB_USER!"
    call git config user.email "!GITHUB_USER!@github.com"
    echo ✅ Git inicializado
) else (
    echo ✅ Git ya estaba inicializado
)

echo.

REM Paso 2: Add
echo ───────────────────────────────────────────────────────────────
echo PASO 2: Preparando archivos...
echo ───────────────────────────────────────────────────────────────
echo.

call git add .
echo ✅ Archivos preparados

echo.

REM Paso 3: Commit
echo ───────────────────────────────────────────────────────────────
echo PASO 3: Creando commit...
echo ───────────────────────────────────────────────────────────────
echo.

git rev-parse HEAD >nul 2>&1
if errorlevel 1 (
    call git commit -m "🚀 Initial commit: MultiplicaApp PWA - Aprende tablas de multiplicar"
) else (
    call git commit -m "🔄 Update: MultiplicaApp PWA" 2>nul || echo    (Sin cambios nuevos)
)

echo ✅ Commit creado
echo.

REM Paso 4: Rama main
echo ───────────────────────────────────────────────────────────────
echo PASO 4: Configurando rama main...
echo ───────────────────────────────────────────────────────────────
echo.

for /f %%i in ('git rev-parse --abbrev-ref HEAD') do set CURRENT_BRANCH=%%i
if not "!CURRENT_BRANCH!"=="main" (
    call git branch -M main
    echo ✅ Rama cambiada a main
) else (
    echo ✅ Ya estamos en main
)

echo.

REM Paso 5: Remote
echo ───────────────────────────────────────────────────────────────
echo PASO 5: Configurando remoto GitHub...
echo ───────────────────────────────────────────────────────────────
echo.

git remote get-url origin >nul 2>&1
if errorlevel 1 (
    call git remote add origin !REPO_URL!
    echo ✅ Remoto añadido
) else (
    call git remote set-url origin !REPO_URL!
    echo ✅ Remoto actualizado
)

echo.

REM Paso 6: Push
echo ───────────────────────────────────────────────────────────────
echo PASO 6: Haciendo push a GitHub...
echo ───────────────────────────────────────────────────────────────
echo.
echo ⚠️  Se abrirá navegador para autenticación...
echo.

call git push -u origin main
if errorlevel 1 (
    echo.
    echo ⚠️  Error en autenticación
    echo    Intenta manualmente: git push -u origin main
    pause
    exit /b 1
)

echo.
echo ✅ Código subido a GitHub

echo.

REM Paso 7: Vercel
echo ═════════════════════════════════════════════════════════════════
echo ✅ ¡CÓDIGO EN GITHUB!
echo ═════════════════════════════════════════════════════════════════
echo.
echo 📍 Repositorio: !REPO_URL!
echo.
echo 🎯 PRÓXIMO PASO: Vercel Deploy
echo.
echo Opción A (Dashboard - Más Fácil):
echo    1. Ve a: https://vercel.com
echo    2. Click: Add New / Project
echo    3. Click: Import Git Repository
echo    4. Busca y selecciona: Multiplicapp
echo    5. Click: Import
echo    6. Review settings y click: Deploy
echo    7. ¡Espera 2-3 minutos!
echo.
echo Opción B (CLI - Automático):
echo    1. npm install -g vercel
echo    2. vercel
echo    3. Sigue las instrucciones
echo.
echo ═════════════════════════════════════════════════════════════════
echo.
echo 🌟 En 5-10 minutos tendrás tu PWA en vivo
echo.
echo URL será algo como:
echo    https://multiplicapp.vercel.app
echo.
echo ═════════════════════════════════════════════════════════════════
echo.

pause

