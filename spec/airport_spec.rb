describe Airport do 
  
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  
  context '#landing' do  
    
    it 'can instruct a plane to land' do 
      airport.land(plane)
      expect(plane.landed).to be true
    end
    
    it 'can hold the plane' do 
      airport.land(plane)
      expect(airport.hangar).to include plane  
    end
    
  end
  
  context '#takeoff' do 
    
    it 'can instruct a plane to takeoff' do 
      airport.land(plane)
      airport.takeoff(plane)
      expect(plane.landed).to be false
    end
    
    it 'can confirm the plane has left the airport' do 
      airport.takeoff(plane)
      expect(airport.hangar).not_to include plane
    end
    
    it 'can prevent takeoff if weather is stormy' do 
      allow(airport.weather).to receive(:stormy?).and_return true
      expect { airport.takeoff(plane) }.to raise_error 'Cannot takeoff due to weather conditions'
    end
    
  end
  
end
