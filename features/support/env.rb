require 'selenium-webdriver'

Before do
  @driver = Selenium::WebDriver.for :chrome
  @driver.navigate.to("https://shop.mercedes-benz.com/en-au/shop/vehicle/srp/demo?sort=relevance-demo&assortment=vehicle&_ga=2.187480619.203641262.1657586487-633169010.1646263583&tgroup=realTarget")
  @driver.manage.window.maximize
end

After do
  @driver.quit
end