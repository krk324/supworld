class Population
  def self.world_population
    GeoNamesAPI::Country.all.map(&:population).reduce(0, :+)
  end

  def self.country_population(city_name)
    # Find city by city name
    city = City.where(city: city_name)[0]
    # find country_code by latitude and longitude
    country_code = GeoNamesAPI::TimeZone.find(city.latitude,city.longitude).country_code

    # return population of that city's country.
    GeoNamesAPI::Country.find(country_code).population
  end

  def self.full_address(city_name)

  end

  def self.time_zone(city_name)
       # Find city by city name
    city = City.where(city: city_name)[0]
    # find country_code by latitude and longitude
    GeoNamesAPI::TimeZone.find(city.latitude,city.longitude).time
  end
end
