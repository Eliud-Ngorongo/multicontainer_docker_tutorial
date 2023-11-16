# Use the Node.js 12.7-alpine image as the base
FROM node:12.7-alpine

# Set the working directory
WORKDIR /usr/src/app/ui

# Copy package.json and package-lock.json files to the working dir
COPY package*.json ./

# Clean the npm cache and install project dependecies
RUN npm cache clean --force
RUN npm install

# Install the ANgualr CLI globally
RUN npm install -g @angular/cli

# Copy the application code into the container
COPY . .

# Expose port 4200
EXPOSE 4200

# Define the command to start the application
CMD ["npm", "run", "start"]

# Use the Node.js 12.13.0-alpine image as the base
FROM node:12.13.0-alpine

# Set the working directory
WORKDIR /usr/src/app/api

# Copy package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the application code into the container
COPY . .

# Expose port 3000
EXPOSE 3000

# Define the command to start the API
CMD ["npm", "run", "start"]