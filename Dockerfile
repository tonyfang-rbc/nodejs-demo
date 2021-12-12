FROM docker.io/library/node:16

USER node
WORKDIR /home/node

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm ci --only=production --ignore-scripts
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY dist/ ./

CMD [ "node", "index.js" ]