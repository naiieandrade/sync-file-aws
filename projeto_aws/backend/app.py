import os
from dotenv import load_dotenv, dotenv_values

from flask import Flask, request
import boto3


app = Flask(__name__)

# loading variables from .env file
load_dotenv() 


@app.route('/upload', methods=['POST'])
def upload_file():
    file = request.files['file']
    if file:
        session = boto3.Session(profile_name="default")
        s3_client = session.client('s3')
        s3_client.upload_fileobj(file, os.getenv("NAME_BUCKET"), file.filename)
        return 'File uploaded successfully to S3!'
    else:
        return 'No file uploaded.', 400

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')