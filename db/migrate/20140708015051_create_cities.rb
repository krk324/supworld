class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :country
      t.string :city
      t.integer :population
      t.decimal :latitude
      t.decimal :longitude
    end

  end
end
