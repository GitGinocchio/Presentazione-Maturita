@echo off
echo Inizio build ed export delle slide...

:: 1. Build
echo [1/5] Build in corso...
call bun run build slides.md
call bun run build slides.fsl.md --out ./dist/fsl --base /fsl

copy _redirects dist\

:: 2. Export Dark
echo [2/5] Export PDF Dark...
call bun run export slides.md --format pdf --output slides
call bun run export slides.fsl.md --format pdf --output slides.fsl
echo [3/5] Export PPTX Dark...
call bun run export slides.md --format pptx --output slides
call bun run export slides.fsl.md --format pptx --output slides.fsl

echo.
echo Processo completato con successo!