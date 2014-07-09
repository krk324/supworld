class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :city
      t.float  :longitude
      t.float  :latitude
    end

  end
end
