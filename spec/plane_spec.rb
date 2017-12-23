describe Plane do 
  
  let(:plane) { Plane.new }
  
  it 'can land' do
    plane.land
    expect(plane.landed).to be true
  end
  
end
