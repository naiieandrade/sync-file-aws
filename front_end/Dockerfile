# Usa a imagem base do Node.js
FROM node:14

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos necessários e instale as dependências
COPY package*.json ./
RUN npm install
COPY . .

# Comando para compilar e executar o aplicativo Vue.js
CMD ["npm", "run", "serve"]
