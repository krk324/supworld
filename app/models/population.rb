class Population

  def self.country_population(city_name)
    # return population of that city's country.
    GeoNamesAPI.username = ENV['USER_NAME']
    country_code = City.where(city: city_name)[0].country_code
    GeoNamesAPI::Country.find(country_code).population
  end

  def self.time_zone(latitude,longitude)
    # find country_code by latitude and longitude
    GeoNamesAPI.username = ENV['USER_NAME']
    GeoNamesAPI::TimeZone.find(latitude,longitude).time
  end
end
