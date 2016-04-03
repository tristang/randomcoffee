class CreatePairings < ActiveRecord::Migration
  def change
    create_table :pairings do |t|
      t.references :meetup
      t.references :user_1
      t.references :user_2
      t.timestamps null: false
    end
  end
end
