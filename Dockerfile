FROM php:7.1.20-apache-jessie

# Standard useful tools
RUN apt-get update && apt-get install -y \
	bash \
	ca-certificates \
	curl \
	git \
	gzip \
	jq \
	tar \
	wget \
  python \
  python-pip \
  && pip install --upgrade pip && \
  pip install --upgrade awscli==1.14.5 s3cmd==2.0.1

# Install composer
RUN php -r "copy('https://raw.githubusercontent.com/composer/getcomposer.org/master/web/installer', 'composer-setup.php');" && \
  php composer-setup.php && \
  php -r "unlink('composer-setup.php');" && \
  mv composer.phar /usr/local/bin/composer

RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.11.1/geckodriver-v0.11.1-linux64.tar.gz && \
  tar -xvzf geckodriver-v0.11.1-linux64.tar.gz && \
  chmod +x geckodriver && \
  cp geckodriver /usr/local/bin/
