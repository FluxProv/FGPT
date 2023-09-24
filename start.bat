@echo off
chcp 65001  > nul 2>&1
color 2

echo Установка цветов...
color 5
cls

echo Установка зависимостей из requirements.txt...
pip install -r requirements.txt
cls

color 2
echo Запуск приложения...
cls

color 4
echo Открытие веб-браузера...
start http://127.0.0.1:5000
cls

echo Запуск завершен.
color 1
python app.py
pause
