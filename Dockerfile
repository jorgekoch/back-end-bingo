# Usa uma imagem base do Node LTS
FROM node:18

# Define o diretório de trabalho dentro do container
WORKDIR /usr/src

# Copia apenas os arquivos de dependência primeiro (melhor para cache)
COPY package*.json ./

# Instala as dependências
RUN npm install

# Copia o restante do código do projeto
COPY . .

RUN npx prisma generate

# Compila o código TypeScript
RUN npm run build

# Expõe a porta da aplicação
EXPOSE 5000

# Corrige a dependência do OpenSSL (necessário em algumas imagens)
RUN ln -s /usr/lib/libssl.so.3 /lib/libssl.so.3

# Comando padrão ao iniciar o container
CMD ["npm", "start"]
