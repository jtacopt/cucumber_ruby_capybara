Given('The user populate the Location as bellow') do |table|
  table.hashes.map do |row|
    state = row['State']
    postal_code = row['Postal Code']
    purpose = row['Purpose']
    location_obj = Location.new(state, postal_code, purpose)
    @location = LocationPom.new(@driver)
    @location.fill(location_obj)
  end
end

