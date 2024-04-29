import os
from dotenv import load_dotenv, dotenv_values
from flask_cors import CORS

from flask import Flask, request, jsonify
import boto3


app = Flask(__name__)
CORS(app)
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


@app.route('/files', methods=['GET'])
def list_files():
    session = boto3.Session(profile_name="default")
    s3_client = session.client('s3')
    bucket_name = os.getenv("NAME_BUCKET")
    response = s3_client.list_objects_v2(Bucket=bucket_name)

    files = []
    if 'Contents' in response:
        for file in response['Contents']:
            file_name = file['Key']
            file_url = s3_client.generate_presigned_url('get_object', Params={'Bucket': bucket_name, 'Key': file_name})
            files.append({'name': file_name, 'url': file_url})

    return jsonify(files)
    
    
if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')