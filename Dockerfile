FROM debian:jessie

RUN apt-get update && apt-get install -y xvfb iceweasel
RUN apt-get install -y ruby bundler git
RUN gem install watir
RUN apt-get update && apt-get install -y wget
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.18.0/geckodriver-v0.18.0-linux64.tar.gz
RUN sh -c 'tar -x geckodriver -zf geckodriver-v0.18.0-linux64.tar.gz -O > /usr/bin/geckodriver'
RUN rm geckodriver-v0.18.0-linux64.tar.gz
RUN chmod +x /usr/bin/geckodriver
RUN PATH=$PATH:/usr/bin/geckodriver

ADD xvfb-setup /usr/bin/xvfb-setup
RUN rm /usr/bin/firefox
RUN ln -s /usr/bin/xvfb-setup /usr/bin/firefox

RUN chmod +x /usr/bin/firefox

ADD simple.e2e.rb /spec/simple.e2e.rb