describe Airport do 
  
  let(:airport) { Airport.new }

  context '#landing' do  
    
    it 'can instruct a plane to land' do 
      plane = Plane.new
      airport.land(plane)
      expect(plane.landed).to be true
    end
    
    it 'can hold the plane' do 
      plane = Plane.new
      airport.land(plane)
      expect(airport.hangar).to include plane  
    end
    
    it 'can prevent landing if weather is stormy' do 
      plane = Plane.new
      allow(airport.weather).to receive(:stormy?).and_return true
      expect { airport.land(plane) }.to raise_error 'Cannot land due to turbulent weather conditions'
    end
    
    it 'can prevent landing if airport is full' do 
      plane = Plane.new
      Airport::MAXIMUM_CAPACITY.times do 
        airport.land(Plane.new) 
      end
      expect { airport.land(plane) }.to raise_error 'The airport is full'
    end
    
  end
  
  context '#takeoff' do 
    
    it 'can instruct a plane to takeoff' do 
      plane = Plane.new
      airport.land(plane)
      airport.takeoff(plane)
      expect(plane.landed).to be false
    end
    
    it 'can confirm the plane has left the airport' do
      plane = Plane.new
      airport.land(plane)
      airport.takeoff(plane)
      expect(airport.hangar).not_to include plane
    end
    
    it 'can prevent takeoff if weather is stormy' do 
      plane = Plane.new
      allow(airport.weather).to receive(:stormy?).and_return true
      expect { airport.takeoff(plane) }.to raise_error 'Cannot takeoff due to turbulent weather conditions'
    end
    
    it 'can not instruct takeoff if no planes are present' do 
      plane = Plane.new
      expect { airport.takeoff(plane) }.to raise_error 'No planes in the hangar'
    end
    
  end
  
end
