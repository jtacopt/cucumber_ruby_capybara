class DCPResultsPom
  CAR_LIST = '.dcp-cars-srp-results__tile'.freeze
  SORTING = '#srp-result select'.freeze
  LOADER = '.dcp-loader'.freeze

  def initialize(driver)
    @driver = driver
  end

  def sort(sorting_method)
    select_by_visible_text(SORTING, sorting_method)
  end

  def get_cars
    we_list = find_element_list(CAR_LIST)
    we_list.map { |x| DCPCarPom.new(driver, x) }
  end

  private

  attr_reader :driver

  def select_by_visible_text(selector, text)
    select = Selenium::WebDriver::Support::Select.new(driver.find_element(:css, selector))
    select.select_by(:text, text)
  end

  def find_element_list(selector)
    driver.find_elements(:css, selector)
  end

  def wait
    @wait ||= Selenium::WebDriver::Wait.new(timeout: 10)
  end
end
