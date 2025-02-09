FROM ubuntu:latest

# Set non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && apt-get install -y nginx zip curl git unzip

# Set working directory
WORKDIR /var/www/html

# Clone the 2048 game repository
RUN git clone https://github.com/gabrielecirulli/2048.git && \
    mv 2048/* . && \
    rm -rf 2048

# Expose port 88
EXPOSE 88

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
