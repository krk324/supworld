class Population
  def self.world_population
    GeoNamesAPI::Country.all.map(&:population).reduce(0, :+)
  end

  def self.country_population(city_name)
    # return population of that city's country.
    country_code = City.where(city: city_name)[0].country_code
    GeoNamesAPI::Country.find(country_code).population
  end

  def self.time_zone(latitude,longitude)
    # find country_code by latitude and longitude
    GeoNamesAPI::TimeZone.find(latitude,longitude).time
  end
end
