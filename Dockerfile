FROM ruby:2.3.1

RUN apt-get update -qq \
  && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    npm \
    nodejs-legacy \
    postgresql-client \
    chrpath \
    libssl-dev \
    libxft-dev \
    libfreetype6 \
    libfreetype6-dev \
    libfontconfig1 \
    libfontconfig1-dev \
  && apt-get clean \
  && apt-get autoclean \
  && rm -rf /var/lib/apt/lists/* \
  && gem install bundler \
  && npm install npm -g \
  && npm install bower -g
# RUN export PHANTOM_JS="phantomjs-2.1.1-linux-x86_64" \
#  && wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2 \
COPY phantomjs-2.1.1-linux-x86_64.tar.bz2 ./
RUN tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2 \
  && rm phantomjs-2.1.1-linux-x86_64.tar.bz2 \
  && mv phantomjs-2.1.1-linux-x86_64 /usr/local/share \
  && ln -sf /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin
