require 'watir'
puts '_+__+_++_++_+_+_+_'
@browser = Watir::Browser.new :chrome
puts '!!!!!!!!!!!! -=-='
@browser.goto 'https://weblium.com'
print @browser.text
