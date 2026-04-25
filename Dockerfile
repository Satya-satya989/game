# Use official Node base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install dependencies
RUN npm install

# Expose port (change if needed)
EXPOSE 3000

# Start application
CMD ["npm", "start"]
