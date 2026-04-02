# Use the official Nginx Alpine image for a super lightweight container
FROM nginx:alpine

# Copy the static assets from the current directory into the Nginx default HTML directory
# Note: .dockerignore will handle excluding any files we don't want in the image
COPY . /usr/share/nginx/html/

# Expose the standard HTTP port
EXPOSE 80

# The default command of the nginx:alpine image starts the Nginx server
CMD ["nginx", "-g", "daemon off;"]
