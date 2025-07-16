# Use official Node.js base image
FROM node:20

# Create app directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the code
COPY . .

# Expose app port
EXPOSE 3000

# Run the app
CMD ["npm", "start"]
