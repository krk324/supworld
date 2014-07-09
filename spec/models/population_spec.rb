require_relative '../../app/models/population'

describe Population do
  describe 'country_population' do
    it 'has city name' do
      city = City.new(city: 'newyork')
      city.save!
      expect(Population.country_population('New York')).to eq 310232863
    end
  end

  describe 'time_zone' do
    it 'has city_name' do
      city = City.new(city: 'tokyo')
      city.save!
      expect(Population.time_zone(35.689487500,139.6917063)).to eq Time.now.in_time_zone("Asia/Tokyo").time
    end
  end

end
