require_relative '../../app/models/population'

describe Population do
  describe 'country_population' do
    it 'has city name' do
      city = City.new(city: 'new york')
      city.save!
      expect(Population.country_population('new york')).to eq 310232863
    end
  end

  describe 'time_zone' do
    it 'has city_name' do
      city = City.new(city: 'tokyo')
      city.save!
      expect(Population.time_zone('tokyo')).to eq Time.now.in_time_zone("Asia/Tokyo").time
    end
  end

end
