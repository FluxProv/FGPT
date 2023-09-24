@echo off
chcp 1251
color 5
cls
echo Добро пожаловать в установщик ChatGPT
echo ------------------------------
color 1
set /p API_KEY=Пожалуйста, введите ваш API ключ ChatGPT и нажмите Enter: 
color 5
echo ------------------------------

(
  echo # Конфигурация для ChatGPT
  echo.
  echo API_KEY = '%API_KEY%'
  echo.
  echo # Конфигурация для Google OAuth
  echo GOOGLE_CLIENT_ID = '151544131298-irs2burgr07scf15i7qho808jpa8knr3.apps.googleusercontent.com'
  echo GOOGLE_CLIENT_SECRET = '151544131298-irs2burgr07scf15i7qho808jpa8knr3.apps.googleusercontent.com'
  echo SECRET_KEY = 'secretkey'
  echo.
  echo # Другие настройки
  echo ANOTHER_SECRET_KEY = 'another_secret_key'
) > data\config.py

echo ------------------------------
echo Ключ успешно установлен в файл data\config.py
echo ------------------------------
pause
