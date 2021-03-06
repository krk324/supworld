class Population

  def self.country_population(city_name)
    # return population of that city's country.
    country_code = City.where(city: city_name)[0].country_code
    GeoNamesAPI::Country.find(country_code).population
  end

  def self.time_zone(latitude,longitude)
    # find country_code by latitude and longitude
    GeoNamesAPI::TimeZone.find(latitude,longitude).time
  end

  def self.wiki_url(city_name)
    "http://en.wikipedia.org/wiki/" + city_name
  end
end
