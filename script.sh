#!/bin/bash

# Iniciar as credenciais da AWS (access key e secret key)
aws configure

# Inicia o nome da variável ao bucket
bucket_name="NAME_BUCKET_TFSTATE"

# Solicita ao usuário que insira o valor da variável
echo "Digite o valor do bucket para guardar os arquivos tfstate na variável $bucket_name:"
read variable_value

# Exporta a variável com o nome definido e o valor fornecido pelo usuário
export "$bucket_name"="$bucket_value"

# Confirmação da exportação da variável
echo "A variável $bucket_name foi definida como $bucket_value."

# Cria o bucket
aws s3api create-bucket --bucket ${bucket_value} --region us-east-1
aws s3api put-bucket-versioning --bucket ${bucket_value} --versioning-configuration Status=Enabled
aws s3api put-bucket-encryption --bucket ${bucket_value} --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'


## Tem que mudar o nome dos buckets nos arquivos do Terraform ainda
## dos dois buckets, que o usuário criou aqui que vai para salvar o arquivo tfstate
## o outro para aplicação 

# Rodar o Terraform
echo "Rodando o Terraform..."
cd terraform
terraform init
terraform plan -out=tfplan
#terraform apply -auto-approve tfplan

# Subir o Docker Compose
cd ..
cd app
ls
echo "Subindo o Docker Compose..."
sudo docker-compose up -d