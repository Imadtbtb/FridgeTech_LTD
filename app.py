from flask import Flask
from flask import Flask
from classes.home_page import HomePage


app = Flask(__name__)

@app.route('/')
def home():
    return 'Hello, Flask!'

if __name__ == '__main__':
    app.run(debug=True)
#hello#