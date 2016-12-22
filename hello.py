from flask import Flask, request, url_for
from flask_restful import Api, Resource
import os

class HeartBeat(Resource):
    def get(self):
        return 200;

class Hello(Resource):
    def get(self):
        ret = {'text':'Hello'}
        return ret, 200;

app = Flask(__name__)
api = Api(app)    
api.add_resource(HeartBeat, '/')
api.add_resource(Hello, '/hello')

if __name__ == "__main__":
    # run service    
    app.run(host='0.0.0.0', port=os.environ.get('PORT') or 5000, debug=True)
