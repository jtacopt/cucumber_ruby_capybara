require 'selenium-webdriver'

Before do
  @driver = Selenium::WebDriver.for :chrome
  @driver.navigate.to("https://shop.mercedes-benz.com/en-au/shop/vehicle/srp/used?")
  @driver.manage.window.maximize
end

After do
  @driver.quit
end