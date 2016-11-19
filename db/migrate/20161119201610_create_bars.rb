class CreateBars < ActiveRecord::Migration[5.0]
  def change
    create_table :bars do |t|
      t.string :name, null: false
      t.decimal :latitude, index: true, null: false
      t.decimal :longitude, index: true, null: false
      t.text :description
      t.integer :rating , default: 0
      t.integer :loudness, default: 0
      t.integer :crowdedness, default: 0
      t.string :bar_category, null: false
      t.string :address
      t.integer :person_count, index: true
      t.integer :rating_count, null: false, default: 1
      t.integer :loudness_count, null: false, default: 1
      t.integer :crowdedness_count, null: false, default: 1

      t.timestamps
    end
  end
end
