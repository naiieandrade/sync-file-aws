import boto3
import subprocess
import os

def read_credentials(file_path):
    with open(file_path, 'r') as file:
        credentials = {}
        next(file)
        for line in file:
            key, value = line.strip().split('=')
            credentials[key.strip()] = value.strip()
        return credentials

aws_credentials = read_credentials('../projeto_aws/.aws/credentials')
bucket_name = 'projeto-final-ada-1'
if os.path.exists('../projeto_aws/.aws/config'):
    aws_config = read_credentials('../projeto_aws/.aws/config')
    region_name = aws_config.get('region')

s3 = boto3.client(
    's3',
    aws_access_key_id=aws_credentials['aws_access_key_id'],
    aws_secret_access_key=aws_credentials['aws_secret_access_key'],
    region_name=region_name
)

s3.create_bucket(Bucket=bucket_name)

print(f'Bucket {bucket_name} criado com sucesso.')

s = subprocess.getstatusoutput('docker-compose up -d')
print(s)