# Use the official Node.js image.
FROM node:18

# Install Python and required dependencies
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]
