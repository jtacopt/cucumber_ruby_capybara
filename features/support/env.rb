require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

World(Capybara::DSL)

Capybara.default_max_wait_time = 10
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.default_driver = :selenium

Before do
  Capybara.current_session.driver.browser.manage.window.maximize
  visit "https://shop.mercedes-benz.com/en-au/shop/vehicle/srp/used?"
end

After do
  Capybara.current_session.driver.quit
end