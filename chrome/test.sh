#!/bin/bash
export DISPLAY=:99
/etc/init.d/xvfb start
ruby /spec/simple.e2e.rb
RESULT=$?
/etc/init.d/xvfb stop
exit $RESULT