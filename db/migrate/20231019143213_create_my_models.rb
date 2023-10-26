class CreateMyModels < ActiveRecord::Migration[7.0]
  def change
    create_table :my_models, id: :uuid do |t|
      t.string :my_string, null: false
      t.text :my_text, null: false
      t.integer :my_integer, null: false
      t.bigint :my_bigint, null: false
      t.float :my_float, null: false
      t.decimal :my_decimal, null: false
      t.datetime :my_datetime, null: false
      t.time :my_time, null: false
      t.date :my_date, null: false
      t.boolean :my_boolean, default: false, null: false

      t.timestamps
    end
  end
end
