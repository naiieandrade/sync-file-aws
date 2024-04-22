from flask import Flask, request
import boto3

app = Flask(__name__)

@app.route('/upload', methods=['POST'])
def upload_file():
    file = request.files['file']
    if file:
        s3 = boto3.client('s3', aws_access_key_id='', aws_secret_access_key='')
        s3.upload_fileobj(file, 'myawsbucket-s3-ada', file.filename)
        return 'File uploaded successfully to S3!'
    else:
        return 'No file uploaded.', 400

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')


# import boto3
# from flask import Flask, request

# app = Flask(__name__)

# @app.route('/upload', methods=['POST'])
# def upload_file():
#     file = request.files['file']
#     if file:
#         # Salvar o arquivo temporariamente ou manipulá-lo conforme necessário
#         # Em seguida, enviar o arquivo para o S3 usando o boto3
#         # Aqui está um exemplo básico de como fazer isso com o boto3:
#         # import boto3
#         s3 = boto3.client('s3', aws_access_key_id='', aws_secret_access_key='')
#         s3.upload_fileobj(file, 'myawsbucket-s3-ada', file.filename)
#         return 'Arquivo enviado com sucesso para o S3!'
#     else:
#         return 'Nenhum arquivo enviado.', 400

# if __name__ == '__main__':
#     app.run(debug=True)



# def upload_file_to_s3(file_path, bucket_name, object_name):
#     s3 = boto3.client('s3')

#     try:
#         s3.upload_file(file_path, bucket_name, object_name)
#         return True, f"Arquivo '{file_path}' enviado com sucesso para o bucket '{bucket_name}' como '{object_name}'."
#     except Exception as e:
#         return False, f"Erro ao enviar arquivo para o bucket S3: {e}"

# # Exemplo de uso:
# success, message = upload_file_to_s3('./myapp/hi.txt', 'myawsbucket-s3-ada', 'nome-do-arquivo-no-s3.txt')
# if success:
#     print(message)
# else:
#     print("Erro:", message)
