@echo off
REM 🎉 SCRIPT DE ACTUALIZACIÓN - MULTIPLICAPP
REM Actualiza las animaciones de victoria y badges
REM Uso: Doble click en este archivo

setlocal enabledelayedexpansion

cls

echo.
echo ╔═══════════════════════════════════════════════════════════════╗
echo ║                                                               ║
echo ║   🎉 Actualizar MultiplicaApp - Animaciones + Badges 🎉    ║
echo ║                                                               ║
echo ╚═══════════════════════════════════════════════════════════════╝
echo.

REM Verificar que Git está instalado
git --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Git no está instalado
    echo    Por favor instala Git desde: https://git-scm.com
    pause
    exit /b 1
)

echo ✅ Git encontrado
echo.

REM Cambiar a la carpeta del proyecto
cd /d "C:\Users\david.paniaguadoming\Downloads\multiapp" 2>nul
if errorlevel 1 (
    echo ❌ No se encontró la carpeta del proyecto
    echo    Esperaba: C:\Users\david.paniaguadoming\Downloads\multiapp
    echo.
    echo    Verifica la ruta y vuelve a intentar
    pause
    exit /b 1
)

echo ✅ Carpeta del proyecto encontrada
echo.

REM Mostrar estado actual
echo ═══════════════════════════════════════════════════════════════
echo 📋 ESTADO ACTUAL
echo ═══════════════════════════════════════════════════════════════
echo.
git status
echo.

REM Preguntar si continuar
set /p CONTINUAR="¿Deseas continuar con la actualización? (S/N): "
if /i not "%CONTINUAR%"=="S" (
    echo Cancelado por el usuario
    pause
    exit /b 0
)

echo.
echo ═══════════════════════════════════════════════════════════════
echo 🔄 ACTUALIZANDO...
echo ═══════════════════════════════════════════════════════════════
echo.

REM Paso 1: Limpiar cambios anteriores no commitados (opcional)
echo PASO 1: Preparando cambios...
git add .
echo ✅ Archivos preparados
echo.

REM Paso 2: Ver qué cambió
echo PASO 2: Cambios a realizar:
git diff --cached --name-only
echo.

REM Paso 3: Hacer commit
echo PASO 3: Creando commit...
git commit -m "🎉 Agregar animaciones épicas de victoria, confeti y logros" 2>nul
if errorlevel 1 (
    echo ⚠️  (Sin cambios nuevos para commitear)
) else (
    echo ✅ Commit realizado
)
echo.

REM Paso 4: Hacer push
echo PASO 4: Subiendo a GitHub...
echo ⚠️  Se abrirá el navegador para autenticación si es necesario
echo.

git push origin main 2>nul
if errorlevel 1 (
    echo ⚠️  Error al hacer push a 'main', intentando con 'master'...
    git push origin master
    if errorlevel 1 (
        echo ❌ Error al hacer push
        echo.
        echo    Intenta manualmente:
        echo    Terminal: git push origin main
        echo.
        pause
        exit /b 1
    )
)

echo ✅ Código subido a GitHub
echo.

REM Paso 5: Confirmación
echo ═══════════════════════════════════════════════════════════════
echo ✅ ¡ACTUALIZACIÓN COMPLETADA!
echo ═══════════════════════════════════════════════════════════════
echo.
echo 🌐 Tu código está en GitHub
echo.
echo 🎯 PRÓXIMO PASO:
echo    Vercel se actualizará automáticamente en 2-3 minutos
echo.
echo    1. Ve a: https://multiplicapp.vercel.app
echo    2. Acierta una respuesta
echo    3. Verás: ✨ Explosión + Confeti + Badge
echo.
echo 📝 Para verificar:
echo    1. Acierta 3 respuestas seguidas
echo    2. En la 3ª: Deberías ver badge 🌟 "¡Vas bien!"
echo.
echo ═══════════════════════════════════════════════════════════════
echo.

REM Preguntar si probar localmente
set /p PROBAR="¿Deseas probar localmente primero? (S/N): "
if /i "%PROBAR%"=="S" (
    echo.
    echo Iniciando servidor local...
    echo Abre en navegador: http://localhost:5173
    echo Presiona Ctrl+C para detener
    echo.
    pause
    npm run dev
) else (
    echo.
    echo ¡Listo! Vercel se actualizará en 2-3 minutos 🚀
    echo.
    pause
)

