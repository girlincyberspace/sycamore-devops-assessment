FROM node:20-alpine

WORKDIR /usr/src/app

# Install dependencies
COPY package*.json ./

RUN npm install -g npm@latest

# Copy source code
COPY . .

EXPOSE 3000
CMD ["node", "index.js"]
