import pandas as pd

def gerar_relatorio(event, context):
    # Ler o arquivo CSV do S3
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']
    df = pd.read_csv(f's3://{bucket}/{key}')

    # Calcular vendas totais, número de pedidos e produtos mais vendidos
    vendas_totais = df['Quantidade'] * df['Preço']
    num_pedidos = len(df)
    produtos_mais_vendidos = df['Produto'].value_counts().head(3)

    # Gerar o relatório
    relatorio = f"Relatório Mensal de Vendas:\nVendas Totais: R${vendas_totais.sum()}\nNúmero de Pedidos: {num_pedidos}\nProdutos Mais Vendidos:\n{produtos_mais_vendidos}"

    # Salvar o relatório no S3
    recurso_s3 = boto3.resource('s3')
    recurso_s3.Object(bucket, 'relatorio_mensal_vendas.txt').put(Body=relatorio)

