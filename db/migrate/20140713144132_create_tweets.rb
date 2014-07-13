class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.belongs_to :city, index: true
      t.string :tweet, array: true, default: []
      t.timestamps
    end
  end
end
