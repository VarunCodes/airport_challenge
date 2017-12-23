describe Weather do 
  
  let(:weather) { Weather.new }
  
  it 'can have cloudy or clear skies' do
    expect(weather.stormy?).to eq(true).or eq(false)
  end
    
end
