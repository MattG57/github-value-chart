# Use Node.js 18 as the base image
FROM node:18-bullseye

# Set the working directory in the container
WORKDIR /app

# Install git to clone the repository
RUN apt-get update && apt-get install -y git && apt-get clean

# Clone the repository
# Replace <repository-url> with the actual Git repository URL
RUN git clone https://github.com/austenstone/github-value .

# Install diagnostic utilities
RUN apt-get update && apt-get install -y net-tools iputils-ping
RUN apt-get update && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y default-mysql-client

# Install backend dependencies
WORKDIR /app/backend
RUN npm install && npm run build

# Install frontend dependencies
WORKDIR /app/frontend
RUN npm install && npm run build


WORKDIR /app/backend

CMD node dist/index.js | ./node_modules/.bin/bunyan
