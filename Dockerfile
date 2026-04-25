# Use lightweight and stable Nginx image
FROM nginx:alpine

# Set working directory inside container
WORKDIR /usr/share/nginx/html

# Remove default nginx files (clean slate)
RUN rm -rf /usr/share/nginx/html/*

# Copy project files into nginx directory
COPY . /usr/share/nginx/html

# Fix permissions (safe for Jenkins + Docker)
RUN chmod -R 755 /usr/share/nginx/html

# Optional: ensure nginx has proper config ownership
RUN chown -R nginx:nginx /usr/share/nginx/html

# Expose web server port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
