FROM nginx:alpine
COPY /Project/* /usr/share/nginx/html/
# Expose port 80
EXPOSE 80
