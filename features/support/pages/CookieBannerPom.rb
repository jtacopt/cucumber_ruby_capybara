class CookieBannerPom

  MAIN = { css: 'cmm-cookie-banner' }
  ACCEPT_ALL = { css: '.wb-button--accept-all' }

  def initialize(driver)
    @driver = driver
    @wait = Selenium::WebDriver::Wait.new(timeout: 10)
  end

  def accept_all
    main_element = @wait.until { @driver.find_element(MAIN) }
    shadow_root = main_element.shadow_root
    target_element = @wait.until { shadow_root.find_element(ACCEPT_ALL) }
    @wait.until { target_element.displayed? }
    target_element.click
  end

end