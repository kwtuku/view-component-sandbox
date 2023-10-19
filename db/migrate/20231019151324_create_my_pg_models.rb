class CreateMyPgModels < ActiveRecord::Migration[7.0]
  def change
    create_table :my_pg_models, id: :uuid do |t|
      t.references :my_model, null: false, foreign_key: true, type: :uuid
      t.binary :my_binary, null: false
      t.string :my_string_array, null: false, array: true
      t.text :my_text_array, null: false, array: true
      t.integer :my_integer_array, null: false, array: true
      t.json :my_json, null: false
      t.jsonb :my_jsonb, null: false
      t.daterange :my_daterange, null: false
      t.uuid :my_uuid, null: false
      t.interval :my_interval, null: false

      t.timestamps
    end
  end
end
