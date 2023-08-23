#A simple web application!!
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Check out this cool website! Made by Roni.A. adding another text'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
