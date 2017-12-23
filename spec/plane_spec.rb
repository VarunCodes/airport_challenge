describe Plane do 
  
  let(:plane) { Plane.new }
  
  it 'can land' do
    plane.land
    expect(plane.landed).to be true
  end
  
  it 'can takeoff' do
    plane.takeoff
    expect(plane.landed).to be false
  end
  
end
