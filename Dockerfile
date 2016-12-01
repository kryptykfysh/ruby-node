FROM ruby:2.3.3

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" | tee /etc/apt/sources.list.d/postgres.list \
  && apt-get install -y wget ca-certificates \
  && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update -qq \
  && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    npm \
    nodejs-legacy \
    chrpath \
    libssl-dev \
    libxft-dev \
    libfreetype6 \
    libfreetype6-dev \
    libfontconfig1 \
    libfontconfig1-dev \
    postgresql-9.6 \
    postgresql-client-9.6 \
  && apt-get clean \
  && apt-get autoclean \
  && rm -rf /var/lib/apt/lists/* \
  && gem install bundler \
  && npm install npm -g \
  && npm install bower -g
COPY phantomjs-2.1.1-linux-x86_64.tar.bz2 ./
RUN tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2 \
  && rm phantomjs-2.1.1-linux-x86_64.tar.bz2 \
  && mv phantomjs-2.1.1-linux-x86_64 /usr/local/share \
  && ln -sf /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin
