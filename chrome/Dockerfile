# # Starting from Ubuntu Xenial
# FROM selenium/standalone-chrome

# # We need wget to set up the PPA, Xvfb to have a virtual screen and unzip to extract ChromeDriver
# RUN sudo apt-get update && sudo apt-get install -y curl  zlib1g-dev ruby bundler git libxi6 libgconf-2-4

# # Set up the Chrome PPA
# # RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
# # RUN echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

# # Update the package list and install Chrome
# # RUN apt-get update
# # RUN apt-get install -y google-chrome-stable

# # Set up ChromeDriver environment variables
# # ENV CHROMEDRIVER_VERSION 2.30
# # ENV CHROMEDRIVER_DIR /chromedriver

# # #Download and install ChromeDriver
# # RUN mkdir $CHROMEDRIVER_DIR
# # RUN wget -q --continue -P $CHROMEDRIVER_DIR "http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip"
# # RUN unzip $CHROMEDRIVER_DIR/chromedriver* -d $CHROMEDRIVER_DIR

# # Put ChromeDriver into the PATH
# # ENV PATH $CHROMEDRIVER_DIR:$PATH
# RUN sudo gem install watir
# RUN sudo gem install selenium-webdriver
# RUN sudo gem install chromedriver-helper
# RUN sudo gem install rspec

# # RUN chmod +x $CHROMEDRIVER_DIR/chromedriver*


# # ADD xvfb-setup /usr/bin/xvfb-setup

# # RUN ln -s /usr/bin/xvfb-setup /usr/bin/chrome-stable
# # RUN ln -s /usr/bin/xvfb-setup /usr/bin/chrome

FROM eruvanos/xvfb

FROM ubuntu:xenial

RUN apt-get update && apt-get install -y xvfb chromium-browser curl unzip libgconf-2-4

RUN mv /usr/bin/chromium-browser /usr/bin/chromium-browser-real
ADD xvfb-chromium /usr/bin/xvfb-chromium
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser

ENV DISPLAY :99
RUN apt-get update && apt-get install -y curl wget zlib1g-dev ruby bundler git libxi6 libgconf-2-4

ENV CHROMEDRIVER_VERSION 2.30
ENV CHROMEDRIVER_DIR /chromedriver

#Download and install ChromeDriver
RUN mkdir $CHROMEDRIVER_DIR
RUN wget -q --continue -P $CHROMEDRIVER_DIR "http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip"
RUN unzip $CHROMEDRIVER_DIR/chromedriver* -d $CHROMEDRIVER_DIR

# Put ChromeDriver into the PATH
ENV PATH $CHROMEDRIVER_DIR:$PATH

RUN  gem install watir
RUN  gem install selenium-webdriver
RUN  gem install chromedriver-helper
RUN  gem install rspec

ADD simple.e2e.rb /spec/simple.e2e.rb
