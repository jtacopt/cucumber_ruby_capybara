class CookieBannerPom
  MAIN = { css: 'cmm-cookie-banner' }
  ACCEPT_ALL = { css: '.wb-button--accept-all' }

  def initialize(page)
    @page = page
    @wait = Capybara.default_max_wait_time
  end

  def accept_all

    @page.assert_no_selector('[class=dcp-loader]', wait: 10)
    sleep(4)
    main_element = @page.find(MAIN[:css], visible: false, wait: 10)
    sleep(4)
    shadow_root = @page.execute_script("return arguments[0].shadowRoot", main_element)
    @page.execute_script("return new Promise((resolve) => {
        const element = arguments[0].querySelector('.wb-button--accept-all');
        if (element !== null) {
          resolve(element);
      }
    })", shadow_root).then do |element|
      target_element = element
      target_element.click
    end
  end
end
