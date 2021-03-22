from flask import Flask
#importing the Flask class from flask package

app = Flask(__name__)
#creating new instance of Flask class

@app.route('/')
#set a route for what URLs should use Flask

def hello_world():
	return 'hello world!'
#first function!

@app.route('/index')
def welcome():
	return 'welcome to index!'
#new route for /index, in which the user is welcomed to the index

@app.route('/hello/<name>')
def hello_name(name):
	return 'Hello %s!' %name
#new route for a page within the directory hello, greeting the person of whose page was visited, which is in this case bartholomew


