class CreateNestedSetItems < ActiveRecord::Migration[7.0]
  def change
    create_table :nested_set_items, id: :uuid do |t|
      t.string :my_string, null: false
      t.references :parent, foreign_key: { to_table: :nested_set_items }, type: :uuid
      t.integer :lft, null: false
      t.integer :rgt, null: false

      t.index :lft
      t.index :rgt

      t.timestamps
    end
  end
end
