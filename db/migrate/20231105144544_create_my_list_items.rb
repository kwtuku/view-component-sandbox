class CreateMyListItems < ActiveRecord::Migration[7.0]
  def change
    create_table :my_list_items, id: :uuid do |t|
      t.string :my_string, null: false
      t.integer :my_scope, null: false
      t.integer :position

      t.timestamps
    end
  end
end
