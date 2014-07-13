class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to :city, index: true
      t.text :image
      t.timestamps
    end
  end
end
