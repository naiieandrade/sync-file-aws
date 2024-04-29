#!/bin/bash

# Iniciar as credenciais da AWS (access key e secret key)
echo "Vamos iniciar! Entre com as credenciais da AWS."
echo "Access key e secret key e tenha certeza que tenha as devidas permissões."
aws configure

# Inicia o nome da variável ao bucket
bucket_name="name_bucket"

# Solicita ao usuário que insira o valor da variável
echo "Digite o valor do bucket para guardar os arquivos tfstate na variável $bucket_name:"
read variable_value

# Exporta a variável com o nome definido e o valor fornecido pelo usuário
export TF_VAR_name_bucket="$bucket_value"

# Confirmação da exportação da variável
echo "A variável $bucket_name foi definida como $bucket_value."

# Rodar o Terraform
echo "Rodando o Terraform..."
cd terraform_local
terraform init
terraform plan 
terraform apply -auto-approve 

# Subir o Docker Compose
cd ../app
ls
echo "Subindo o Docker Compose..."
sudo docker-compose up -d

echo "Pronto! Agora acesse localhost:8080"