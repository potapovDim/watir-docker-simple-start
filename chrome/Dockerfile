# Starting from Ubuntu Xenial
FROM ubuntu:xenial

# We need wget to set up the PPA, Xvfb to have a virtual screen and unzip to extract ChromeDriver
RUN apt-get update
RUN apt-get install -y wget xvfb unzip

# Set up the Chrome PPA
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

# Update the package list and install Chrome
RUN apt-get update
RUN apt-get install -y google-chrome-stable

# Set up ChromeDriver environment variables
ENV CHROMEDRIVER_VERSION 2.31
ENV CHROMEDRIVER_DIR /chromedriver

# Download and install ChromeDriver
RUN mkdir $CHROMEDRIVER_DIR
RUN wget -q --continue -P $CHROMEDRIVER_DIR "http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip"
RUN unzip $CHROMEDRIVER_DIR/chromedriver* -d $CHROMEDRIVER_DIR

# Put ChromeDriver into the PATH
ENV PATH $CHROMEDRIVER_DIR:$PATH

RUN apt-get install -y ruby bundler git
RUN gem install watir

ADD simple.e2e.rb /spec/simple.e2e.rb

CMD xvfb-run chrome -a