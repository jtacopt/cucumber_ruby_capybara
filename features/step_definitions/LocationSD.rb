Given('The user populate the Location as bellow') do |table|
  table.hashes.map do |row|
    state = row['State']
    location_obj = Location.new(state)
    @location = LocationPom.new(page)
    @location.fill(location_obj)
  end
end

