#A simple web application!!
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello, World! from Roni! v2! every time an update to the app file is pushed, it will be automaticly updated at the host url!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
