FROM ruby:2.6.6

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - 
RUN apt-get install -y nodejs

RUN npm install -g npm@8.5.4
RUN npm install -g n
RUN n 16.13.0
RUN hash -r
RUN npm install -g yarn

ADD ./ /home/
WORKDIR /home

RUN bundle install

RUN rails webpacker:install
RUN rails webpacker:compile