@echo off
setlocal enabledelayedexpansion

echo Inizio build ed export delle slide...

:: 1. Build
echo [1/5] Build in corso...
call bun run build slides.md
call bun run build slides_me.md --out ./dist/me --base /me

:: Assicurati che dist esista
if not exist dist mkdir dist
copy _redirects dist\

:: 2. Export Dark
echo [2/5] Export PDF/PPTX...
call bun run export slides.md --format pdf --output dist/slides.pdf
call bun run export slides_me.md --format pdf --output dist/me/slides.pdf

call bun run export slides.md --format pptx
call bun run export slides_me.md --format pptx

echo.
echo Processo completato: tutti i file sono in /dist!