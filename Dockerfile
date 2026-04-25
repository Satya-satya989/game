# Use lightweight and stable Nginx image
FROM nginx:alpine

# Set working directory inside container
WORKDIR /usr/share/nginx/html

# Remove default nginx static files (clean slate)
RUN rm -rf ./*

# Copy project files into nginx directory
COPY . .

# Set proper permissions (avoids Jenkins permission issues sometimes)
RUN chmod -R 755 /usr/share/nginx/html

# Expose web server port
EXPOSE 80

# Start nginx server
CMD ["nginx", "-g", "daemon off;"]
