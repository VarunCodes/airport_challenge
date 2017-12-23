require "./lib/plane"

class Airport 
    
  # attr_accessor :hangar
    
  def initialize
    # @hangar = []
  end
    
  def land(plane)
    # @hangar << plane
    plane.land 
  end
    
end
