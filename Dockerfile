FROM kalilinux/kali-linux-docker
MAINTAINER nahidul kibria <nahidupa@gmail.com>
#python-httplib2 fimap dependency
#libswitch-perl libssl-dev dotdotpwn dependency

RUN apt-get update\
  && apt-get install --assume-yes curl libsqlite3-dev libxslt-dev libxml2-dev zlib1g-dev gcc\
  && apt-get clean
  
#RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
#RUN curl -sSL https://get.rvm.io | bash

#RUN rvm install 2.1.5
#RUN rvm use 2.1.5

RUN git clone https://github.com/nahidupa/oxml_xxe.git

CD oxeml_xxe

RUN gem install bundler
RUN bundle install
RUN ruby server.rb

EXPOSE 4567
