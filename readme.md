## Environment setup
   * virtualenv -p python3 env
   * source env/bin/activate
   * pip install -r requirements.txt

## Usage
   * gunicorn hello:app 
   * curl localhost:8000/hello
