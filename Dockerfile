# busca imagem base do node
FROM node

# usa essa pasta como diretório de trabalho (tipo um CD)
WORKDIR /usr/src

# copia o diretório atual para a workdir definida acima
COPY . .

# "expõe" a porta 5000
EXPOSE 5000

RUN ln -s /usr/lib/libssl.so.3 /lib/libssl.so.3

# baixa as dependências
RUN npm i

# faz a compilação do TS para JS
RUN npm run build

# só roda quando a imagem se torna um container em execução (comando inicial)
CMD ["npm", "start"]