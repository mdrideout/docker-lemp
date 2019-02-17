FROM ubuntu:bionic
LABEL maintainer="Matthew Rideout <mdrideout@gmail.com>"

# Set Timezone
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# update
RUN apt update && apt-get install -y --no-install-recommends apt-utils systemd dumb-init

# generic tools
RUN apt install -y nano wget net-tools git unzip curl iputils-ping telnet dnsutils nmap \
    software-properties-common apt-transport-https

# nginx
RUN apt install -y nginx

## nginx conf
COPY nginx/default /etc/nginx/sites-available/default

# install php
RUN LC_ALL=C.UTF-8  add-apt-repository ppa:ondrej/php
RUN DEBIAN_FRONTEND=noninteractive apt update && apt install -y php7.3 php7.3-fpm php7.3-cli php7.3-mysql php7.3-curl php7.3-gd \
    php7.3-imap php7.3-zip php7.3-ldap php7.3-xml php7.3-mbstring php7.3-intl php7.3-soap php7.3-bcmath

# start webserver
RUN service php7.3-fpm start
RUN service nginx restart

# install composer
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN composer

# Expose Ports
EXPOSE 443
EXPOSE 80

COPY start.sh start.sh
RUN chmod a+x start.sh

WORKDIR /var/www/html

CMD ["dumb-init", "--", "/start.sh"]