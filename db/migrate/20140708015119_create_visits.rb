class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.belongs_to :user, index: true
      t.belongs_to :city, index: true
      t.integer    :count
      t.timestamps
    end
  end
end
