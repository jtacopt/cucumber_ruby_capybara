require 'bigdecimal'

class Car
  attr_accessor :model, :price, :currency, :mileage, :year, :fuel_type

  def initialize(model, price, currency, mileage, year, fuel_type)
    @model = model
    @price = price
    @currency = currency
    @mileage = mileage
    @year = year
    @fuel_type = fuel_type
  end

end
