class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :city, index: true
      t.text :comment, null: false
      t.timestamps
    end
  end
end
