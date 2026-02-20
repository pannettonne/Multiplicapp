@echo off
REM 🔗 CONECTAR GITHUB Y HACER PUSH - MULTIPLICAPP
REM Configura la conexión a GitHub y sube los cambios

setlocal enabledelayedexpansion

cls

echo.
echo ╔═══════════════════════════════════════════════════════════════╗
echo ║                                                               ║
echo ║   🔗 Conectar GitHub y Subir Cambios 🔗                    ║
echo ║                                                               ║
echo ║   Este script configura GitHub y sube tu código             ║
echo ║                                                               ║
echo ╚═══════════════════════════════════════════════════════════════╝
echo.

REM Cambiar a la carpeta del proyecto
cd /d "C:\Users\david.paniaguadoming\Downloads\multiapp" 2>nul
if errorlevel 1 (
    echo ❌ No se encontró la carpeta del proyecto
    echo    Esperaba: C:\Users\david.paniaguadoming\Downloads\multiapp
    pause
    exit /b 1
)

echo ✅ Carpeta del proyecto encontrada
echo.

REM Pedir URL de GitHub
echo ═══════════════════════════════════════════════════════════════
echo 📍 CONFIGURACIÓN GITHUB
echo ═══════════════════════════════════════════════════════════════
echo.
echo Tu repositorio GitHub debería ser:
echo https://github.com/pannettonne/Multiplicapp
echo.
set /p GITHUB_URL="¿Es correcto? (S/N) o ingresa URL personalizada: "

if /i "%GITHUB_URL%"=="N" (
    set /p GITHUB_URL="Ingresa tu URL de GitHub (ej: https://github.com/usuario/repo): "
) else if /i "%GITHUB_URL%"=="S" (
    set GITHUB_URL=https://github.com/pannettonne/Multiplicapp
)

echo.
echo ✅ Usando: %GITHUB_URL%
echo.

REM Verificar si remoto existe
git remote get-url origin >nul 2>&1
if errorlevel 1 (
    echo 🔗 Configurando remoto GitHub...
    git remote add origin %GITHUB_URL%
    echo ✅ Remoto configurado
) else (
    echo 🔄 Remoto ya existe, actualizando...
    git remote set-url origin %GITHUB_URL%
    echo ✅ Remoto actualizado
)

echo.

REM Mostrar estado
echo ═══════════════════════════════════════════════════════════════
echo 📋 ESTADO ACTUAL
echo ═══════════════════════════════════════════════════════════════
git status
echo.

REM Preparar cambios
echo Preparando cambios...
git add .
echo ✅ Cambios preparados
echo.

REM Commit
echo ═══════════════════════════════════════════════════════════════
echo 💾 CREANDO COMMIT
echo ═══════════════════════════════════════════════════════════════
git commit -m "🎉 Agregar animaciones épicas, confeti y badges" 2>nul
if errorlevel 1 (
    echo ⚠️  (No hay cambios nuevos)
) else (
    echo ✅ Commit creado
)
echo.

REM Push
echo ═══════════════════════════════════════════════════════════════
echo 📤 SUBIENDO A GITHUB
echo ═══════════════════════════════════════════════════════════════
echo.

REM Intentar con master
echo Intentando push a rama 'master'...
git push -u origin master 2>&1

if errorlevel 1 (
    echo.
    echo ⚠️  Error con 'master', intentando con 'main'...
    git push -u origin master:main 2>&1
    if errorlevel 1 (
        echo.
        echo ❌ Error al hacer push
        echo    GitHub requiere autenticación
        echo.
        echo 📍 SOLUCIÓN:
        echo    1. Abre navegador (se debería abrir automáticamente)
        echo    2. GitHub te pedirá que autorices
        echo    3. Haz click en "Authorize"
        echo    4. Vuelve a esta ventana
        echo    5. Presiona ENTER e intenta de nuevo
        echo.
        pause
        
        REM Intentar de nuevo
        echo Intentando de nuevo...
        git push -u origin master 2>&1
        if errorlevel 1 (
            echo.
            echo ❌ Aún hay error
            echo.
            echo ALTERNATIVA: Usa esta URL de autorización:
            echo https://github.com/login/device
            echo.
            pause
            exit /b 1
        )
    )
)

echo.
echo ✅ Código subido a GitHub!
echo.

REM Confirmación
echo ═══════════════════════════════════════════════════════════════
echo ✅ ¡CONEXIÓN Y PUSH COMPLETADOS!
echo ═══════════════════════════════════════════════════════════════
echo.
echo 🌐 Tu código está en GitHub
echo    %GITHUB_URL%
echo.
echo 🎯 PRÓXIMO PASO:
echo    1. Ve a: https://vercel.com
echo    2. Busca tu proyecto "Multiplicapp"
echo    3. Debería detectar nuevo deploy automáticamente
echo    4. Espera 2-3 minutos
echo.
echo 📱 Luego verifica en:
echo    https://multiplicapp.vercel.app
echo.
echo ═══════════════════════════════════════════════════════════════
echo.

pause

