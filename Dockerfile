# Debian: NGINX
#
# VERSION 0.0.1

# Pull the base image.
FROM ericmdev/essentials-common

# Set the author.
MAINTAINER Eric Mugerwa <dev@ericmugerwa.com>

# Set environment variables.
ENV FILES config/
ENV NGINX_VERSION 1.9.9-1~jessie

# Install packages.
RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62
RUN echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
    openssl \
    ca-certificates \
    nginx=${NGINX_VERSION}

# Define mountable directories.
VOLUME ["/srv/www", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/cache/nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443

# Configure executable.
ENTRYPOINT []

# Define default command.
CMD ["nginx", "-g", "daemon off;"]