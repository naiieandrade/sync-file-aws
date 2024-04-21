# Imagem base do Python
FROM python:3.8

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos necessários e instala as dependências
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .

# Expoe a porta em que o servidor Flask estará rodando
EXPOSE 5000

# Comando para executar o servidor Flask
CMD ["python", "app.py"]
