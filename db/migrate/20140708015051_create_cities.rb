class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :city
      t.float  :longitude
      t.float  :latitude
      t.string :country_code
      t.string :country
      t.string :population
      t.string :wiki_url
      t.timestamps
    end

  end
end
