# Use a lightweight Node.js base image
FROM node:alpine

# Install Python
RUN apk add --no-cache python3 py3-pip

# Set the working directory
WORKDIR /app

# Copy package files to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your application files to the working directory
COPY . .

# Expose the port your app runs on (replace 3000 with your port if different)
EXPOSE 3000

# Command to run your application
CMD ["npm", "start"]
