# Use lightweight web server
FROM nginx:alpine

# Set working directory
WORKDIR /usr/share/nginx/html

# Copy all project files into nginx folder
COPY . .

# Expose default web port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
