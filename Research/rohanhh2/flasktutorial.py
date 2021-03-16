from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/whatup')
def what_up():
    return 'Whats up?'

@app.route('/hello/<name>')
def say_hello(name):
    return 'Hello ' + str(name)
