FROM ruby:2.3.0

RUN apt-get update -qq \
  && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    npm \
    nodejs-legacy \
    postgresql-client \
  && apt-get clean \
  && apt-get autoclean \
  && rm -rf /var/lib/apt/lists/* \
  && npm install npm -g \
  && npm install bower -g
