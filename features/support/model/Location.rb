class Location
  attr_accessor :state, :postal_code, :purpose

  def initialize(state, postal_code = nil, purpose = nil)
    @state = state
    @postal_code = postal_code
    @purpose = purpose
  end
end