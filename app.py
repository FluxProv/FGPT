# app.py
from flask import Flask, request, render_template
import requests
from data import config

app = Flask(__name__)

# Замените конфигурацию Google OAuth на использование из config.py
app.secret_key = config.SECRET_KEY
app.config['GOOGLE_CLIENT_ID'] = config.GOOGLE_CLIENT_ID
app.config['GOOGLE_CLIENT_SECRET'] = config.GOOGLE_CLIENT_SECRET

# Конфигурация для ChatGPT
api_key = config.API_KEY
chatgpt_url = 'https://api.openai.com/v1/chat/completions'
headers = {
    'Authorization': f'Bearer {api_key}',
    'Content-Type': 'application/json'
}

# Шаблон для главной страницы
@app.route('/')
def index():
    return render_template('question.html')

# Функция для отправки вопроса в ChatGPT
def send_question_to_chatgpt(question):
    data = {
        'messages': [
            {
                'role': 'system',
                'content': 'You are now chatting with ChatGPT, ask your question.'
            },
            {
                'role': 'user',
                'content': question
            }
        ]
    }

    response = requests.post(chatgpt_url, json=data, headers=headers)

    if response.status_code == 200:
        try:
            answer = response.json()['choices'][0]['message']['content']
            return answer
        except (KeyError, IndexError):
            return "Invalid response from ChatGPT"
    else:
        return "Пожалуйста, Проверьте ваш API ключ в файле config.py!"

# Обработка отправки вопроса
@app.route('/ask', methods=['POST'])
def ask_question():
    question = request.form.get('question')
    
    # Отправить вопрос ChatGPT и обработать ответ
    answer = send_question_to_chatgpt(question)

    # Отобразить ответ на веб-странице
    return render_template('result.html', question=question, answer=answer)

if __name__ == '__main__':
    app.run(debug=True)
