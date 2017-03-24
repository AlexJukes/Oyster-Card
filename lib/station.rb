# Responsible for storing station information: name and zone. 
class Station

attr_reader :name, :zone

  def initialize(name, zone)
    @name = name
    @zone = zone
  end
end
