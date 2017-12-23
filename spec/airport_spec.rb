describe Airport do 
  
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
    
  it 'can instruct a plane to land' do 
    airport.land(plane)
    expect(plane.landed).to be true
  end
    
end
