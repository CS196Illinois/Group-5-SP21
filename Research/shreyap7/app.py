from flask import Flask, render_template
from urllib.request import urlopen 

app = Flask(__name__)

@app.route('/')
def hello():
    date = '2010'
    country = 'US'
    with urlopen('http://musicbrainz.org/ws/2/release/?query=*&date:' + date + '&country:' + country + '&fmt=json') as r:
        text = r.read()
    return text

if __name__ == "__main__":
    app.run(debug=True)
