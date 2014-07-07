class Population
  def self.world_population
    GeoNamesAPI::Country.all.map(&:population).reduce(0, :+)
  end
end
