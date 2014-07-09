class CreateMemos < ActiveRecord::Migration
  def change
    create_table :memos do |t|
      t.belongs_to :user, index: true
      t.belongs_to :city, index: true
      t.text :memo, null: false
      t.timestamps
    end
  end
end
