FROM docker.io/library/node:16

USER node
WORKDIR /home/node

COPY package*.json ./

RUN npm ci --only=production --ignore-scripts

# Bundle app source
COPY dist/ ./

CMD [ "node", "index.js" ]