require 'watir'

@browser = Watir::Browser.new :chrome

@browser.goto 'https://weblium.com'

print @browser.text
