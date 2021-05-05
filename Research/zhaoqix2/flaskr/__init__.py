import os

from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello():
    return 'Hello, World!'

@app.route('/greeting')
def greeting():
    return 'Have a nice day!'

@app.route('/hello/Zhaoqi')
def helloPerson():
    return 'Hello Zhaoqi!'