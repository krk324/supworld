class Population
  def self.world_population
    GeoNamesAPI::Country.all.map(&:population).reduce(0, :+)
  end

  def self.country_population(search)
    # Find coordinates of certain city.
    coordinates = Geocoder.coordinates(search)
    longitude = coordinates[0]
    latitude = coordinates[1]

    # return country code for that city
    country_code = GeoNamesAPI::TimeZone.find(longitude,latitude).country_code

    # return population of that city's country.
    GeoNamesAPI::Country.find(country_code).population
  end
end
