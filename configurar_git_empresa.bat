@echo off
chcp 65001 > nul

echo ===================================================
echo     CONFIGURAÇÃO DO GIT - PC DA EMPRESA
echo ===================================================
echo.
echo Este script configurará sua conta e atualizará o projeto.
echo.

echo Configurando identidade global do Git...
git config --global user.name "Luiz Fábio Pereira Santana"
git config --global user.email "f4biosantana@gmail.com"
git config --global credential.helper manager
echo Nome e E-mail configurados com sucesso!
echo.

:check_dir
if not exist ".git" (
    echo [AVISO] Este script não está na pasta de um projeto Git.
    echo.
    set /p PROJECT_DIR="Digite o caminho completo da pasta do projeto (ex: C:\Borland\Delphi7\Projects): "
    
    :: Remove aspas se o usuário tiver colado com aspas
    set PROJECT_DIR=%PROJECT_DIR:"=%
    
    if not exist "%PROJECT_DIR%\.git" (
        echo [ERRO] A pasta informada não contém um repositório Git (.git).
        echo.
        goto check_dir
    )
    cd /d "%PROJECT_DIR%"
)

echo.
echo ===================================================
echo Pasta do projeto identificada: %CD%
echo ===================================================
echo.

echo Buscando atualizações do GitHub (git pull)...
git pull origin main

if %ERRORLEVEL% equ 0 (
    echo.
    echo ===================================================
    echo PROJETO ATUALIZADO E CONFIGURADO!
    echo.
    echo Agora você pode trabalhar nos seus projetos normalmente.
    echo Quando terminar suas alterações, use os comandos padrão:
    echo.
    echo   git add .
    echo   git commit -m "sua mensagem"
    echo   git push origin main
    echo ===================================================
) else (
    echo.
    echo ===================================================
    echo [ALERTA] Houve um problema ao atualizar (git pull).
    echo Verifique se você tem alterações locais não salvas que estão
    echo conflitando ou se há conexão com a internet.
    echo ===================================================
)

pause
