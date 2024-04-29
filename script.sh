#!/bin/bash

# Rodar o Terraform
echo "Rodando o Terraform..."
cd terraform
terraform init
terraform plan -out=tfplan
#terraform apply -auto-approve tfplan

# Subir o Docker Compose
echo "Subindo o Docker Compose..."
cd ..
cd app
ls
sudo docker-compose up -d
