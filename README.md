# sync-file-aws


Esse projeto até então é uma simples aplicação que sobe um arquivo direto em um bucket no s3. (Que será evoluído com outras automaçoes...)


## Pré-requisito
Pré requisitos são criar um usuário com permissão AmazonS3FullAcess e criar uma chave de acesso. 

E criar um bucket.

Esses dados serão utilizados na aplicação python.

É importante ter o docker instalado e o docker-compose.

- CORS

Para a permissão de cors, vá nas configurações do bucket>permissões>CORS e edite e cole o código abaixo:

```
[
    {
        "AllowedHeaders": [
            "*"
        ],
        "AllowedMethods": [
            "PUT",
            "POST"
        ],
        "AllowedOrigins": [
            "*"
        ],
        "ExposeHeaders": []
    }
]
```


## Como rodar o projeto

A partir do arquivo `env-example` crie um arquivo `.env` e subistitua as variáveis.

No arquivo `app.py` colocar as variáveis da aws de access key id e secret. (Não subir no git, * um ponto a melhorar)

Para executar a aplicação entre na pasta projeto_aws e rode o comando:

`docker-compose up --build`




