from datetime import date
from flask import Flask, render_template, request, g
import json
import os
import socket
import pandas as pd
from redis import Redis

app = Flask(__name__)

redisurl = os.getenv('REDIS_URL')
hostname = socket.gethostname()

# Colour the Logo
logocolour = os.getenv('LOGO_COLOUR', 'pink')
logo = './static/{}.png'.format(logocolour)

def get_redis():
    if not hasattr(g, 'redis'):
        g.redis = Redis(host=redisurl, db=0, socket_timeout=5, decode_responses=True)
    return g.redis

def generate_table():
    redis = get_redis()
    result = pd.DataFrame(columns=['Date', 'Clicks'])

    keys = redis.keys('*')
    for key in keys:
        val = redis.get(key)
        raw = json.dumps([{'Date': key, 'Clicks': val}])
        df = pd.read_json(raw)
        result = result.append(df, ignore_index=True)
    
    result = result.sort_values(by=['Date'], ascending=False)
    
    return result

@app.route('/', methods=['POST','GET'])
def hello():

   redis = get_redis()
   today = str(date.today())

   if request.method == 'POST':
    redis.incr(today)

   global no_clicks
   no_clicks = redis.get(today)

   df = generate_table()

   return render_template(
      'index.html',
      no_clicks=no_clicks,
      hostname=hostname,
      logo=logo,
      tables=[df.to_html(classes='data', index=False)],
      titles=df.columns.values)

@app.route('/health', methods=['GET'])
def health():
   return render_template('health.html')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=80)