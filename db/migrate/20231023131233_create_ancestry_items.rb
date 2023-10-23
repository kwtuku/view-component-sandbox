class CreateAncestryItems < ActiveRecord::Migration[7.0]
  def change
    create_table :ancestry_items, id: :uuid do |t|
      t.string :my_string, null: false
      t.string :ancestry, collation: "C", null: false
      t.index :ancestry

      t.timestamps
    end
  end
end
