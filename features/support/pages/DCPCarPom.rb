class DCPCarPom
  MODEL_NAME = '.dcp-cars-product-tile__model'.freeze
  PRICE = '[data-test-id=dcp-cars-product-tile-price]'.freeze
  MILEAGE = '.dcp-cars-product-tile-used-car-info :has(span.dcp-cars-product-tile-used-car-info-text):nth-child(1)'.freeze
  YEAR = '.dcp-cars-product-tile-used-car-info :has(span.dcp-cars-product-tile-used-car-info-text):nth-child(2)'.freeze
  FUEL_TYPE = '.dcp-cars-product-tile-used-car-info :has(span.dcp-cars-product-tile-used-car-info-text):nth-child(3)'.freeze

  def initialize(page, car_element)
    @page = page
    @car_element = car_element
  end

  def get_model
    read_text(@car_element, MODEL_NAME)
  end

  def get_full_price
    read_text(@car_element, PRICE)
  end

  def get_price
    price = nil
    price_pattern = /[\d,.]+/
    matcher = get_full_price.match(price_pattern)
    if matcher
      price_value = matcher[0]
      price = BigDecimal(price_value.gsub(',', ''))
    end
    price
  end

  def get_mileage
    mileage = 0
    distance_string = read_text(@car_element, MILEAGE)
    number_pattern = /\d+/
    matcher = distance_string.match(number_pattern)
    mileage = matcher[0].to_i if matcher
    mileage
  end

  def get_year
    read_text(@car_element, YEAR).to_i
  end

  def get_fuel
    read_text(@car_element, FUEL_TYPE)
  end

  def get_car
    Car.new(get_model, get_price, 'CAD', BigDecimal(get_mileage), get_year, get_fuel.upcase.to_sym)
  end

  private

  def read_text(element, selector)
    element.find(:css, selector).text
  end
end

