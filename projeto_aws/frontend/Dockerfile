FROM node:14

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

CMD ["npm", "start"]


# FROM node:14

# WORKDIR /app

# # Inicializa um novo projeto Node.js
# RUN npm init -y

# # Instala as dependências do projeto
# COPY package*.json ./
# RUN npm install

# # Copia os arquivos do código-fonte
# COPY . .

# # Comando padrão para iniciar o servidor
# CMD ["npm", "start"]
