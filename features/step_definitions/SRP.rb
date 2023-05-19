Given(/^The user set the filter as bellow$/) do |table|
  # table is a table.hashes.keys # => [:model, :kilometers]
  table.hashes.each do |row|
    model = row['model']
    price = row['price']
    kilometers = row['kilometers']

    current_url = @driver.current_url
    params = "model=#{model}&userPriceGroupPriceSlider=#{price}&mileageSlider=#{kilometers}"
    url_with_parameters = "#{current_url}?#{params}"
    @driver.get(url_with_parameters)
  end

end

When(/^The user sort the displayed result by "(.*?)"$/) do |sort_method|
  @results = DCPResultsPom.new(@driver)
  @results.sort(sort_method)
end

Then(/^The results should Match with the applied filter$/) do
  @results = DCPResultsPom.new(@driver)
  car_list = @results.get_cars
  car_list.each do |carPom|
    car = carPom.get_car
    validate_car(car)
  end
end

def validate_car(car)
  # HardCode
  expect(car.price).to be < BigDecimal(60000)
  expect(car.mileage).to be < BigDecimal(20000)
end