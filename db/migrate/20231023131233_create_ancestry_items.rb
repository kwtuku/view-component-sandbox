class CreateAncestryItems < ActiveRecord::Migration[7.0]
  def change
    create_table :ancestry_items, id: :uuid do |t|
      t.string :my_string, null: false
      t.string :ancestry, collation: "C", null: false
      t.integer :ancestry_depth, null: false, default: 0
      t.integer :children_count, null: false, default: 0
      t.index :ancestry

      t.timestamps
    end
  end
end
