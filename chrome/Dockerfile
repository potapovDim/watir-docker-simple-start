FROM ubuntu:xenial

RUN apt-get update -y -q
RUN apt-get install -y -q unzip xvfb curl wget zlib1g-dev ruby bundler git libxi6 libgconf-2-4
 
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

# Update the package list and install Chrome
RUN apt-get update
RUN apt-get install -y google-chrome-stable

# Set up ChromeDriver environment variables
ENV CHROMEDRIVER_VERSION 2.30
ENV CHROMEDRIVER_DIR /chromedriver

#Download and install ChromeDriver
RUN mkdir $CHROMEDRIVER_DIR
RUN wget -q --continue -P $CHROMEDRIVER_DIR "http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip"
RUN unzip $CHROMEDRIVER_DIR/chromedriver* -d $CHROMEDRIVER_DIR

# Put ChromeDriver into the PATH
ENV PATH $CHROMEDRIVER_DIR:$PATH


ENV DISPLAY :99

# Install Xvfb init script
ADD xvfb_init /etc/init.d/xvfb
RUN chmod a+x /etc/init.d/xvfb
ADD xvfb-daemon-run /usr/bin/xvfb-daemon-run
RUN chmod a+x /usr/bin/xvfb-daemon-run

# Allow root to execute Google Chrome by replacing launch script
ADD google-chrome-launcher /usr/bin/google-chrome
RUN chmod a+x /usr/bin/google-chrome

RUN gem install watir
ADD simple.e2e.rb /spec/simple.e2e.rb
ADD test.sh /run/test.sh
RUN chmod a+x /run/test.sh

CMD /run/test.sh

