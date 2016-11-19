class CreateBars < ActiveRecord::Migration[5.0]
  def change
    create_table :bars do |t|
      t.string :name
      t.decimal :latitude
      t.decimal :longitude
      t.text :description
      t.integer :rating
      t.integer :loudness
      t.integer :crowdedness
      t.string :bar_category
      t.string :address

      t.timestamps
    end
  end
end
