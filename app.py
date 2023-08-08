#A simple web application!!
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello, World! from Roni! v2! every time an update to the app file is pushed, it will be automaticly updated at the host url! to check this out, just edit this file, push the changes and see for yourself'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
