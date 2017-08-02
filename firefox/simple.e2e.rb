require 'watir'

@browser = Watir::Browser.new :firefox
@browser.goto 'https://weblium.com'
print @browser.text
