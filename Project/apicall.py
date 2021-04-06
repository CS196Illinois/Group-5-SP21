from flask import Flask
import musicbrainzngs as mbrain
#should be using this language binding, currently unused
import requests

app = Flask(__name__)
#creating new instance of Flask class

@app.route('/')
#set a route for what URLs should use Flask

@app.route('/index')
def welcome():
	return 'welcome to index!'
#new route for /index

@app.route('/search', methods = ['POST', 'GET'])
def retrieve_location_list():
	if request.method == 'POST':
		Area = form_data
	response = requests.get("https://musicbrainz.org/ws/2/area?query=<Area>")
	return response
	#returns a requests.model.Response object that I can't read



