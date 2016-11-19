class CreateBarComments < ActiveRecord::Migration[5.0]
  def change
    create_table :bar_comments do |t|
      t.integer :bar_id, index: true
      t.string :commenter
      t.text :comment, null: false

      t.timestamps
    end
  end
end
