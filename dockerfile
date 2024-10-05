# Use a base image
FROM node:18

# Install Python
RUN apt-get update && apt-get install -y python3 python3-pip

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port (change 3000 to your app's port if needed)
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]
