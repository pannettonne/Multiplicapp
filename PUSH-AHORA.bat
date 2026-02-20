@echo off
REM 🚀 PUSH DIRECTO A GITHUB - MULTIPLICAPP
REM Sube los cambios pendientes a GitHub
REM El script anterior preparó los cambios, este los sube

setlocal enabledelayedexpansion

cls

echo.
echo ╔═══════════════════════════════════════════════════════════════╗
echo ║                                                               ║
echo ║   🚀 Subiendo cambios a GitHub - Vercel 🚀                 ║
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

echo ✅ En la carpeta correcta
echo.

REM Ver qué cambios hay
echo ═══════════════════════════════════════════════════════════════
echo 📋 ESTADO GIT
echo ═══════════════════════════════════════════════════════════════
git status
echo.

REM Agregar todos los cambios
echo Preparando cambios...
git add .
echo ✅ Cambios preparados
echo.

REM Ver qué se va a subir
echo ═══════════════════════════════════════════════════════════════
echo 📤 ARCHIVOS A SUBIR
echo ═══════════════════════════════════════════════════════════════
git diff --cached --name-only
echo.

REM Hacer commit si hay cambios
echo ═══════════════════════════════════════════════════════════════
echo 💾 CREANDO COMMIT
echo ═══════════════════════════════════════════════════════════════
git commit -m "🎉 Actualizar animaciones, confeti y badges de victoria" 2>nul
if errorlevel 1 (
    echo ⚠️  No hay cambios nuevos que commitear
    echo    Intentando push de commits existentes...
) else (
    echo ✅ Commit creado
)
echo.

REM Hacer push
echo ═══════════════════════════════════════════════════════════════
echo 📤 SUBIENDO A GITHUB
echo ═══════════════════════════════════════════════════════════════
echo.
echo Intentando push a 'main'...
git push origin main 2>&1
if errorlevel 1 (
    echo.
    echo ⚠️  Error con 'main', intentando con 'master'...
    git push origin master 2>&1
    if errorlevel 1 (
        echo.
        echo ❌ Error al hacer push
        echo.
        echo    Intenta manualmente:
        echo    1. Abre terminal en: C:\Users\david.paniaguadoming\Downloads\multiapp
        echo    2. Ejecuta: git push origin main
        echo    3. O: git push origin master
        echo.
        pause
        exit /b 1
    )
)

echo.
echo ✅ Código subido a GitHub exitosamente!
echo.

REM Confirmación final
echo ═══════════════════════════════════════════════════════════════
echo ✅ ¡PUSH COMPLETADO!
echo ═══════════════════════════════════════════════════════════════
echo.
echo 🌐 Los cambios están en GitHub
echo.
echo 🎯 PRÓXIMO PASO AUTOMÁTICO:
echo    Vercel detectorá los cambios automáticamente
echo    y los deployará en 2-3 minutos
echo.
echo 📍 Ve a: https://multiplicapp.vercel.app
echo    (Espera 3 minutos después de este mensaje)
echo.
echo 📊 Para ver el progreso del deploy:
echo    1. Ve a: https://vercel.com
echo    2. Entra en tu proyecto: Multiplicapp
echo    3. Mira la sección "Deployments"
echo    4. Deberías ver un nuevo deploy en progreso
echo.
echo ═══════════════════════════════════════════════════════════════
echo.

pause

