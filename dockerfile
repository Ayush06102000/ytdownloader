# Use the official Node.js image
FROM node:20

# Install dependencies for yt-dlp
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip3 install yt-dlp && \
    apt-get clean

# Create a directory for your app
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install npm dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Create a directory for downloads
RUN mkdir downloads

# Expose the port
EXPOSE 10000

# Start the application
CMD ["node", "index.js"]
