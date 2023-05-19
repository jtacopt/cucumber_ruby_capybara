class LocationPom

  STATE = { css: "[data-test-id='modal-popup__location'] select" }.freeze
  POSTAL_CODE = { css: "[data-test-id='modal-popup__location'] input[type=number]" }.freeze
  PURPOSE_PRIVATE = { css: "label:has([value=P]) div" }.freeze
  PURPOSE_BUSINESS = { css: "label:has([value=B]) div" }.freeze
  CONTINUE = { css: "[data-test-id=state-selected-modal__close]" }.freeze

  def initialize(driver)
    @driver = driver
  end

  def select_state(state)
    select = Selenium::WebDriver::Support::Select.new(@driver.find_element(STATE))
    select.select_by(:text, state)
  end

  def input_postal_code(postal_code)
    @driver.find_element(POSTAL_CODE).send_keys(postal_code)
  end

  def populate_purpose(purpose)
    if purpose.downcase == 'private'
      @driver.find_element(PURPOSE_PRIVATE).click
    else
      @driver.find_element(PURPOSE_BUSINESS).click
    end
  end

  def click_continue
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until { @driver.find_element(CONTINUE).attribute('disabled') != 'disabled' }
    @driver.find_element(CONTINUE).click
  end

  def fill(model)
    if model.state
      select_state(model.state)
    end
    if model.postal_code
      input_postal_code(model.postal_code)
    end
    if model.purpose
      populate_purpose(model.purpose)
    end
    click_continue
  end
end