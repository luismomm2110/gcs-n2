FROM node:12 
WORKDIR /home/luismomm/Documents/Graduação/Gestão/N2
COPY package*.json ./ 
RUN npm install
COPY . . 
EXPOSE 8000
CMD [ "node", "server.js" ]

