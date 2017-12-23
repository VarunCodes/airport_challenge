require "./lib/plane"

class Airport 
    
  attr_accessor :hangar, :weather
    
  def initialize(weather = Weather.new)
    @hangar = []
    @weather = weather
  end
    
  def land(plane)
    fail 'Cannot land due to turbulent weather conditions' if @weather.stormy?
    @hangar << plane
    plane.land 
  end
  
  def takeoff(plane)
    fail 'Cannot takeoff due to turbulent weather conditions' if @weather.stormy?
    plane.takeoff
  end
    
end
