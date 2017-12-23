require "./lib/plane"

class Airport 
    
  attr_accessor :hangar, :weather
    
  def initialize(weather = Weather.new)
    @hangar = []
    @weather = weather
  end
    
  def land(plane)
    @hangar << plane
    plane.land 
  end
  
  def takeoff(plane)
    fail 'Cannot takeoff due to weather conditions' if @weather.stormy?
    plane.takeoff
  end
    
end
