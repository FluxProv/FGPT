@echo off
chcp 1251
color 5
cls
echo ����� ���������� � ���������� ChatGPT
echo ------------------------------
color 1
set /p API_KEY=����������, ������� ��� API ���� ChatGPT � ������� Enter: 
color 5
echo ------------------------------

(
  echo # ������������ ��� ChatGPT
  echo.
  echo API_KEY = '%API_KEY%'
  echo.
  echo # ������������ ��� Google OAuth
  echo GOOGLE_CLIENT_ID = '151544131298-irs2burgr07scf15i7qho808jpa8knr3.apps.googleusercontent.com'
  echo GOOGLE_CLIENT_SECRET = '151544131298-irs2burgr07scf15i7qho808jpa8knr3.apps.googleusercontent.com'
  echo SECRET_KEY = 'secretkey'
  echo.
  echo # ������ ���������
  echo ANOTHER_SECRET_KEY = 'another_secret_key'
) > data\config.py

echo ------------------------------
echo ���� ������� ���������� � ���� data\config.py
echo ------------------------------
pause
