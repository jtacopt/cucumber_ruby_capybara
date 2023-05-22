class LocationPom

  STATE = { css: "[data-test-id=modal-popup__location] select" }.freeze
  POSTAL_CODE = { css: "[data-test-id='modal-popup__location'] input[type=number]" }.freeze
  PURPOSE_PRIVATE = { css: "label:has([value=P]) div" }.freeze
  PURPOSE_BUSINESS = { css: "label:has([value=B]) div" }.freeze
  CONTINUE = { css: "[data-test-id=state-selected-modal__close]" }.freeze

  def initialize(page)
    @page = page
  end

  def select_state(state)
    select = @page.find(STATE[:css])
    select.select(state)
  end

  def input_postal_code(postal_code)
    @page.fill_in POSTAL_CODE[:css], with: postal_code
  end

  def populate_purpose(purpose)
    if purpose.downcase == 'private'
      @page.find(PURPOSE_PRIVATE[:css]).click
    else
      @page.find(PURPOSE_BUSINESS[:css]).click
    end
  end

  def click_continue
    @page.find(CONTINUE[:css]).click
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