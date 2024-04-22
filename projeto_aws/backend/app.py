import os
from dotenv import load_dotenv, dotenv_values

from flask import Flask, request
import boto3


app = Flask(__name__)

# loading variables from .env file
load_dotenv() 

AWS_KEY = os.getenv("AWS_KEY")
AWS_SECRET = os.getenv("AWS_SECRET")

@app.route('/upload', methods=['POST'])
def upload_file():
    file = request.files['file']
    if file:
        #session = boto3.Session(profile_name="ada_s3")
        s3_client = boto3.client('s3', aws_access_key_id='', aws_secret_access_key='')
        s3_client.upload_fileobj(file, os.getenv("NAME_BUCKET"), file.filename)
        return 'File uploaded successfully to S3!'
    else:
        return 'No file uploaded.', 400

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')