# Use the official Node.js image
FROM node:18

# Set the working directory
WORKDIR /app

# Create the downloads directory
RUN mkdir -p /app/downloads

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
