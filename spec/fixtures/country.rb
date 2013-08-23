class Country
  attr_accessor :name, :state_or_provinces

  def initialize(name, state_or_provinces=nil)
    @name = name
    @state_or_provinces = state_or_provinces
  end
end
