# sync-file-aws


Este projeto é uma aplicação simples que envia um arquivo diretamente para um bucket no S3 da AWS. Futuramente, será expandido com outras automações.


## Pré-requisito
Antes de começar, é necessário criar um usuário no AWS IAM com permissão AmazonS3FullAccess e gerar uma chave de acesso. Além disso, é preciso criar um bucket no S3.

Esses dados serão utilizados na aplicação python.

É importante ter o docker instalado e o docker-compose.

### Configuração CORS

Para configurar o CORS, siga estes passos:

1. Acesse as configurações do seu bucket no console da AWS.
2. Vá para a seção "Permissões" e clique em "CORS".
3. Cole o código abaixo:

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

1. A partir do arquivo `env-example` crie um arquivo `.env` e subistitua a variável do nome do bucket.

2. Na pasta `.aws` você encontra os arquivos exemplos para colocar as credenciais de **access key id** e **secret access key**. Esses arquivos podem ser encontrado no contâiner no caminho `~/.aws` equivalente ao `/root/.aws/`

3. Para executar a aplicação entre na pasta projeto_aws e rode o comando:

`docker-compose up --build`