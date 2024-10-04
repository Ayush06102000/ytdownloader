# Use the official Node.js image
FROM node:20

# Install Python and pip
RUN apt-get update && \
    apt-get install -y python3 python3-venv python3-pip && \
    apt-get clean

# Create a virtual environment for Python packages
RUN python3 -m venv /venv

# Activate the virtual environment and install yt-dlp
RUN /venv/bin/pip install yt-dlp

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
