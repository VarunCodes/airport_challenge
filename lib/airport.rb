require "./lib/plane"

class Airport 
  
  MAXIMUM_CAPACITY = 15
  attr_accessor :hangar, :weather
    
  def initialize(weather = Weather.new)
    @hangar = []
    @weather = weather
    @capacity = MAXIMUM_CAPACITY
  end
    
  def land(plane)
    fail 'Cannot land due to turbulent weather conditions' if @weather.stormy?
    fail 'The airport is full' if @capacity == hangar.count
    @hangar << plane
    plane.land 
  end
  
  def takeoff(plane)
    fail 'Cannot takeoff due to turbulent weather conditions' if @weather.stormy?
    fail 'No planes in the hangar' if @hangar.empty?
    hangar.delete(plane)
    plane.takeoff
  end
    
end
