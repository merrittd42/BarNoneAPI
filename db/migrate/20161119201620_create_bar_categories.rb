class CreateBarCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :bar_categories do |t|
      t.string :category, null: false

      t.timestamps
    end
  end
end
